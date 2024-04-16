import 'package:produtos/core/di/modules/di.dart';
import 'package:produtos/modules/produtos/data/datasource/produtos_datasource.dart';
import 'package:produtos/modules/produtos/infra/datasource/produtos_datasource_interface.dart';

Future datasourceProdutos() async {
  inject.registerLazySingleton<IProdutosDatasource>(
    () => ProdutosDatasource(),
  );
}
