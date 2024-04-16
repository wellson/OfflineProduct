import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:produtos/main.dart';
import 'package:produtos/modules/produtos/data/models/produto_model.dart';
import 'package:produtos/modules/produtos/domain/repositories/produtos_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final IProdutoRepository _iProdutoRepository;
  HomeCubit({
    required IProdutoRepository produtoRepository,
  })  : _iProdutoRepository = produtoRepository,
        super(HomeInitial());

  getProdutos() async {
    emit(HomeLoading());

    final produtos = await _iProdutoRepository.getProdutos();
    emit(HomeSuccess(produtosList: produtos));
  }

  addCarrinho({required ProdutoModel produtoEntity}) async {

    objectbox.addProduct(
      name: produtoEntity.name,
      detail: produtoEntity.detail,
      price: produtoEntity.price,
      hero: produtoEntity.hero,
      image: produtoEntity.image,
      info: produtoEntity.info,
      offer: produtoEntity.offer,
      qntd: 1,
    );
  }
}
