import 'package:bloc_test/bloc_test.dart';
import 'package:produtos/modules/carrinho/presenter/pages/cubit/carrinho_cubit.dart';

void main() {
  blocTest<CarrinhoCubit, CarrinhoState>(
    'emits [CarrinhoState] when MyEvent is Initialized.',
    build: () => CarrinhoCubit(),
    expect: () => const <CarrinhoInitial>[],
  );
}
