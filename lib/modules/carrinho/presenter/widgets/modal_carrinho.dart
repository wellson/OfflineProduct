import 'package:flutter/material.dart';

Future<void> modalCarrinho({
  required BuildContext context,
  required Function()? onPressed,
}) {
  return showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: 150,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(6)),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 26),
                child: Center(
                  child: Container(
                    height: 8,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: const Color.fromARGB(255, 220, 220, 220),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: onPressed,
                child: Center(
                  child: Text(
                    'Comprar'.toUpperCase(),
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      );
    },
  );
}
