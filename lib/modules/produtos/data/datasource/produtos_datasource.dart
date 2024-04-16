import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:produtos/modules/produtos/data/models/produto_model.dart';
import 'package:produtos/modules/produtos/infra/datasource/produtos_datasource_interface.dart';

class ProdutosDatasource implements IProdutosDatasource {
  ProdutosDatasource();

  @override
    Future<List<ProdutoModel?>> getProdutos() async {
    try {
      final String response = await rootBundle.loadString('assets/products.json');
      final data = await json.decode(response);

      final List<ProdutoModel> produtosList;
      produtosList = (data as List).map((element) => ProdutoModel.fromJson(element)).toList();

      return produtosList;
    } catch (e) {
      return [ ];
    }
  }
}
