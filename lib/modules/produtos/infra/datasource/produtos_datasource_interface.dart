import 'package:produtos/modules/produtos/data/models/produto_model.dart';

abstract class IProdutosDatasource {
  Future<List<ProdutoModel?>> getProdutos();
}
