
import 'package:produtos/core/di/modules/di.dart';
import 'package:produtos/modules/produtos/domain/repositories/produtos_repository.dart';
import 'package:produtos/modules/produtos/domain/usecases/produtos_usecase.dart';

Future usecaseProduto() async {
  inject.registerLazySingleton<IProdutosUsecase>(
    () => ProdutosUsecase(
      repository: inject.get<IProdutoRepository>()
    ),
  );

}
