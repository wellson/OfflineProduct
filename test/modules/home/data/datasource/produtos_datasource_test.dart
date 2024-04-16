import 'package:flutter_test/flutter_test.dart';
import 'package:produtos/modules/produtos/data/datasource/produtos_datasource.dart';
import 'package:produtos/modules/produtos/data/models/produto_model.dart';
import 'package:produtos/modules/produtos/infra/repositories/produtos_repository.dart';

void main() {
  final _repository = ProdutoRepository(datasource: ProdutosDatasource());

  test(
    'getProdutos - When Successful should return a List of ProdutoModel',
    () async {
      //act
      final _res = await _repository.getProdutos();

      // assert
      expect(_res, isA<List<ProdutoModel?>>());
    },
  );
}
