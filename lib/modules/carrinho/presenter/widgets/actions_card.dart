import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:produtos/modules/carrinho/presenter/pages/cubit/carrinho_cubit.dart';
import 'package:produtos/modules/carrinho/presenter/widgets/modal_carrinho.dart';

class ActionsCard extends StatelessWidget {
  const ActionsCard({
    super.key,
    required this.cubit,
  });

  final CarrinhoCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 1,
          child: IconButton(
            onPressed: () => cubit.removeAll(),
            icon: Icon(
              Icons.delete_forever_outlined,
            ),
          ),
        ),
        Flexible(
          flex: 4,
          child: ElevatedButton(
            onPressed: () => modalCarrinho(
              context: context,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            child: Center(
              child: Text(
                'Revisar'.toUpperCase(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
