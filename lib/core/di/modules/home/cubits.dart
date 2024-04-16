import 'package:produtos/core/di/modules/di.dart';
import 'package:produtos/modules/produtos/domain/repositories/produtos_repository.dart';
import 'package:produtos/modules/produtos/presenter/cubit/home_cubit.dart';

Future cubitProduto() async {
  inject.registerFactory<HomeCubit>(
    () => HomeCubit(
      produtoRepository: inject.get<IProdutoRepository>(),
    ),
  );
}
