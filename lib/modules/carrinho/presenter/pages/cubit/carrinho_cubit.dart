import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:produtos/main.dart';
import 'package:produtos/modules/carrinho/domain/entities/carrinho_entity.dart';

part 'carrinho_state.dart';

class CarrinhoCubit extends Cubit<CarrinhoState> {
  CarrinhoCubit() : super(CarrinhoInitial());

  getCarrinho() async {
    emit(CarrinhoLoading());
    final produtosList = objectbox.getCarrinho();
    emit(CarrinhoSuccess(produtosList: produtosList));
  }

  removeProduto({required int id}) async {
    await objectbox.removeProduct(id);
    emit(CarrinhoLoading());
    final produtosList = objectbox.getCarrinho();
    emit(CarrinhoSuccess(produtosList: produtosList));
  }

  addProduto({required int id, required CarrinhoEntity produtoEntity}) async {
    await objectbox.addProduct(
      name: produtoEntity.name,
      detail: produtoEntity.detail,
      price: produtoEntity.price,
      hero: produtoEntity.hero,
      image: produtoEntity.image,
      info: produtoEntity.info,
      offer: produtoEntity.offer,
      qntd: produtoEntity.qntd! + 1,
      id: produtoEntity.id,
    );
    emit(CarrinhoLoading());
    final produtosList = objectbox.getCarrinho();
    emit(CarrinhoSuccess(produtosList: produtosList));
  }

  downProduto({required int id, required CarrinhoEntity produtoEntity}) async {
    await objectbox.addProduct(
      name: produtoEntity.name,
      detail: produtoEntity.detail,
      price: produtoEntity.price,
      hero: produtoEntity.hero,
      image: produtoEntity.image,
      info: produtoEntity.info,
      offer: produtoEntity.offer,
      qntd: (produtoEntity.qntd! - 1),
      id: produtoEntity.id,
    );
    emit(CarrinhoLoading());
    final produtosList = objectbox.getCarrinho();
    emit(CarrinhoSuccess(produtosList: produtosList));
  }

  removeAll() async {
    objectbox.removeAllProduct();
    emit(CarrinhoLoading());
    final produtosList = objectbox.getCarrinho();
    emit(CarrinhoSuccess(produtosList: produtosList));
  }
}
