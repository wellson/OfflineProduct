import 'package:flutter_test/flutter_test.dart';
import 'package:produtos/modules/produtos/data/datasource/produtos_datasource.dart';
import 'package:produtos/modules/produtos/data/models/produto_model.dart';

void main() {
  final _datasource = ProdutosDatasource();

  test(
    'getProdutos - When Successful should return a List of ProdutoModel',
    () async {
      //act
      final _res = await _datasource.getProdutos();

      // assert
      expect(_res, isA<List<ProdutoModel?>>());
    },
  );
}
