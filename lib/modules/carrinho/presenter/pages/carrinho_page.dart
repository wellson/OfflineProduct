import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:produtos/core/di/modules/di.dart';
import 'package:produtos/modules/carrinho/presenter/pages/cubit/carrinho_cubit.dart';
import 'package:produtos/modules/carrinho/presenter/widgets/actions_card.dart';
import 'package:produtos/modules/carrinho/presenter/widgets/product_card_widget.dart';

class CarrinhoPage extends StatefulWidget {
  const CarrinhoPage({super.key});

  @override
  State<CarrinhoPage> createState() => _CarrinhoPageState();
}

class _CarrinhoPageState extends State<CarrinhoPage> {
  final cubit = inject.get<CarrinhoCubit>();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      await cubit.getCarrinho();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrinho'),
      ),
      body: BlocProvider(
        create: (context) => cubit,
        child: SafeArea(
          child: BlocBuilder<CarrinhoCubit, CarrinhoState>(
            builder: (context, state) {
              if (state is CarrinhoLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is CarrinhoSuccess) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      state.produtosList.isEmpty
                          ? const Center(
                              child: Text(
                                'Seus produtos adicionados no carrinho aparecem aqui.',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            )
                          : Expanded(
                              child: ListView.builder(
                                itemCount: state.produtosList.length,
                                itemBuilder: (context, index) {
                                  final product = state.produtosList[index];
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: double.maxFinite,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: Colors.grey.shade100,
                                      ),
                                      child: ProductCard(
                                        product: product,
                                        cubit: cubit,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                      state.produtosList.isEmpty ? SizedBox() : ActionsCard(cubit: cubit),
                    ],
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
