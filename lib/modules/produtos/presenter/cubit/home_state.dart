part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final List<ProdutoModel?> produtosList;

  HomeSuccess({
    required this.produtosList,
  });

  @override
  List<Object> get props => [
        produtosList,
      ];
}

final class HomeError extends HomeState {}
