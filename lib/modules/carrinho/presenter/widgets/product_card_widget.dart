import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:produtos/modules/carrinho/domain/entities/carrinho_entity.dart';
import 'package:produtos/modules/carrinho/presenter/pages/cubit/carrinho_cubit.dart';
import 'package:produtos/modules/produtos/presenter/widgets/product_text.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
    required this.cubit,
  });

  final CarrinhoEntity product;
  final CarrinhoCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          flex: 7,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: NetworkImage(product.image ?? ''),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProductText(
                      title: product.name?.toUpperCase(),
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.purple.shade700,
                    ),
                    ProductText(
                      title: product.detail,
                    ),
                    ProductText(title: product.info),
                    ProductText(
                      title: product.offer,
                      color: Colors.purple.shade700,
                    ),
                    ProductText(
                      title: product.hero,
                      fontSize: 10,
                      color: Colors.purple.shade700,
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            ProductText(
                              title: 'R\$ ${product.price}',
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () => product.qntd! > 1
                                  ? cubit.downProduto(id: product.id!, produtoEntity: product)
                                  : () {},
                              child: CircleAvatar(
                                backgroundColor: product.qntd! > 1 ? Colors.purple.shade100 : Colors.grey.shade300,
                                maxRadius: 15,
                                child: const Center(
                                  child: Icon(Icons.remove),
                                ),
                              ),
                            ),
                            BlocBuilder<CarrinhoCubit, CarrinhoState>(
                              builder: (context, state) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 12),
                                  child: ProductText(title: '${product.qntd}'),
                                );
                              },
                            ),
                            GestureDetector(
                              onTap: () => cubit.addProduto(id: product.id!, produtoEntity: product),
                              child: CircleAvatar(
                                backgroundColor: Colors.purple.shade100,
                                maxRadius: 15,
                                child: const Center(
                                  child: Icon(Icons.add),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ],
          ),
        ),
        Flexible(
          flex: 1,
          child: IconButton(
            onPressed: () => cubit.removeProduto(id: product.id!),
            icon: const Icon(
              Icons.delete_outline_outlined,
            ),
          ),
        ),
      ],
    );
  }
}
