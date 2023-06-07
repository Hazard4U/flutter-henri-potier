import 'package:flutter/material.dart';
import 'package:flutter_henri_potier/domain/book.dart';
import 'package:flutter_henri_potier/presentation/state/basket_provider.dart';
import 'package:provider/provider.dart';

class BasketBookSwitch extends StatelessWidget {
  final Book book;

  const BasketBookSwitch({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    List<Book> books = context.watch<BasketProvider>().books;

    return Switch(
      onChanged: (value) {
        if (value) {
          context.read<BasketProvider>().addBook(book);
        } else {
          context.read<BasketProvider>().removeBook(book.isbn);
        }
      },
      value: books.contains(book),
    );
  }
}
