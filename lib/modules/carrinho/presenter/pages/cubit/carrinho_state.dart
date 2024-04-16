part of 'carrinho_cubit.dart';

sealed class CarrinhoState extends Equatable {
  const CarrinhoState();

  @override
  List<Object> get props => [];
}

final class CarrinhoInitial extends CarrinhoState {}

final class CarrinhoLoading extends CarrinhoState {}

class CarrinhoSuccess extends CarrinhoState {
  final List<CarrinhoEntity> produtosList;

  CarrinhoSuccess({
    required this.produtosList,
  });

  @override
  List<Object> get props => [
        produtosList,
      ];
}

final class CarrinhoError extends CarrinhoState {}
