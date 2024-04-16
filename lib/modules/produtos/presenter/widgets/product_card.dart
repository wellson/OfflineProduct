import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:produtos/modules/produtos/data/models/produto_model.dart';
import 'package:produtos/modules/produtos/presenter/widgets/product_text.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
  });

  final ProdutoModel product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey.shade100,
          boxShadow: [
            BoxShadow(
              blurRadius: 15,
              blurStyle: BlurStyle.solid,
              offset: Offset(-2, 3),
              spreadRadius: 2,
              color: Colors.deepPurple.shade50,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
                image: DecorationImage(
                  image: NetworkImage(product.image ?? ''),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductText(
                    title: product.name?.toUpperCase(),
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Colors.purple.shade700,
                  ),
                  SizedBox(height: 12),
                  ProductText(
                    title: 'R\$ ${product.price}',
                    fontSize: 18,
                    color: Colors.black,
                  ),
                  ProductText(
                    title: product.hero,
                    fontSize: 10,
                    color: Colors.purple.shade700,
                  ),
                  ProductText(
                    title: product.detail,
                  ),
                  SizedBox(height: 8),
                  ProductText(title: product.info),
                  SizedBox(height: 8),
                  ProductText(
                    title: product.offer,
                    color: Colors.purple.shade700,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
