import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:produtos/core/di/modules/di.dart';
import 'package:produtos/modules/produtos/presenter/cubit/home_cubit.dart';
import 'package:produtos/modules/produtos/presenter/widgets/product_card.dart';

class ProdutosPage extends StatefulWidget {
  const ProdutosPage({super.key});

  @override
  State<ProdutosPage> createState() => _ProdutosPageState();
}

class _ProdutosPageState extends State<ProdutosPage> {
  final cubit = inject.get<HomeCubit>();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      await cubit.getProdutos();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Produtos'),
      ),
      body: BlocProvider(
        create: (context) => cubit,
        child: SafeArea(
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state is HomeLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is HomeSuccess) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      mainAxisExtent: 300,
                      mainAxisSpacing: 8,
                      maxCrossAxisExtent: 250,
                    ),
                    itemCount: state.produtosList.length,
                    itemBuilder: (context, index) {
                      final product = state.produtosList[index]!;
                      return Stack(
                        children: [
                          ProductCard(product: product),
                          Positioned(
                            bottom: 15,
                            right: 15,
                            child: CircleAvatar(
                                backgroundColor: Colors.deepPurple.shade400,
                                maxRadius: 18,
                                child: Center(
                                  child: IconButton(
                                    enableFeedback: true,
                                    highlightColor: Colors.deepPurple.shade100,
                                    onPressed: () {
                                      cubit.addCarrinho(produtoEntity: product);
                                      Flushbar(
                                        message: "Produto adicionado ao carrinho",
                                        duration: Duration(seconds: 2),
                                      ).show(context);
                                    },
                                    icon: const Icon(
                                      Icons.add_shopping_cart_sharp,
                                      size: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                )),
                          )
                        ],
                      );
                    },
                  ),
                );
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}
