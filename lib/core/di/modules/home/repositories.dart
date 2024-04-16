import 'package:produtos/core/di/modules/di.dart';
import 'package:produtos/modules/produtos/domain/repositories/produtos_repository.dart';
import 'package:produtos/modules/produtos/infra/datasource/produtos_datasource_interface.dart';
import 'package:produtos/modules/produtos/infra/repositories/produtos_repository.dart';

Future repositoryProdutos() async {
  inject.registerLazySingleton<IProdutoRepository>(
    () => ProdutoRepository(datasource: inject.get<IProdutosDatasource>()),
  );
}
