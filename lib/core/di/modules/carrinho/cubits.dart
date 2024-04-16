import 'package:produtos/core/di/modules/di.dart';
import 'package:produtos/modules/carrinho/presenter/pages/cubit/carrinho_cubit.dart';

Future cubitCarrinho() async {
  inject.registerFactory<CarrinhoCubit>(
    () => CarrinhoCubit(),
  );
}
