import 'package:flutter/material.dart';
import 'package:flutter_henri_potier/presentation/book_tile.dart';

import '../domain/book.dart';

class BookList extends StatelessWidget {
  final List<Book> books;
  final bool basketAvailable;

  const BookList(
      {super.key, required this.books, this.basketAvailable = false});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: books
          .map((e) => BookTile(
                book: e,
                basketAvailable: basketAvailable,
              ))
          .toList(),
    );
  }
}
