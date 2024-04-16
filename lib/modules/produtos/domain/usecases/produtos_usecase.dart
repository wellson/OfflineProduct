import 'package:produtos/modules/produtos/data/models/produto_model.dart';
import 'package:produtos/modules/produtos/domain/repositories/produtos_repository.dart';

abstract class IProdutosUsecase {
  Future<List<ProdutoModel?>> getProdutos();
}

class ProdutosUsecase implements IProdutosUsecase {
  final IProdutoRepository repository;

  ProdutosUsecase({required this.repository});

  @override
  Future<List<ProdutoModel?>> getProdutos() => repository.getProdutos();
}
