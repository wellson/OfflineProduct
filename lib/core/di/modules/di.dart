import 'package:get_it/get_it.dart';
import 'package:produtos/core/di/modules/carrinho/cubits.dart';
import 'package:produtos/core/di/modules/home/cubits.dart';
import 'package:produtos/core/di/modules/home/datasource.dart';
import 'package:produtos/core/di/modules/home/repositories.dart';
import 'package:produtos/core/di/modules/home/usecase.dart';

GetIt inject = GetIt.instance;

Future initDependencies() async {
  await initDatasource();
  await initRepository();
  await initUsecase();
  await initCubit();
}

Future initDatasource() async {
  await datasourceProdutos();
}

Future initRepository() async {
  await repositoryProdutos();
}

Future initUsecase() async {
  await usecaseProduto();
}

Future initCubit() async {
  await cubitProduto();
  await cubitCarrinho();
}
