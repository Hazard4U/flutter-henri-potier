import 'package:flutter/material.dart';

class BasketInfo extends StatelessWidget {
  final String first;
  final String second;

  const BasketInfo({
    super.key,
    required this.first,
    required this.second,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(first),
        Card(
            color: Theme.of(context).colorScheme.tertiary,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(second,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary)),
            ))
      ],
    );
  }
}
