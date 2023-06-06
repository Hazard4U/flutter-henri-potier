import 'package:flutter/material.dart';
import 'package:flutter_henri_potier/presentation/state/basket_provider.dart';
import 'package:provider/provider.dart';

import '../domain/book.dart';

class BasketWrapper extends StatelessWidget {
  final Widget Function(List<Book> books) builder;

  const BasketWrapper({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    List<Book> books = context.watch<BasketProvider>().books;
    return builder(books);
  }
}
