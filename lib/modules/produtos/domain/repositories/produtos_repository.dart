import 'package:produtos/modules/produtos/data/models/produto_model.dart';

abstract class IProdutoRepository {
  Future<List<ProdutoModel?>> getProdutos();
}
