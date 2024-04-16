import 'package:produtos/modules/produtos/data/models/produto_model.dart';
import 'package:produtos/modules/produtos/domain/repositories/produtos_repository.dart';
import 'package:produtos/modules/produtos/infra/datasource/produtos_datasource_interface.dart';

class ProdutoRepository implements IProdutoRepository {
  final IProdutosDatasource datasource;

  ProdutoRepository({required this.datasource});

  @override
  Future<List<ProdutoModel?>> getProdutos() => datasource.getProdutos();
}
