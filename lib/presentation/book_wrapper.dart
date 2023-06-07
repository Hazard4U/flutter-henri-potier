import 'package:flutter/material.dart';
import 'package:flutter_henri_potier/presentation/state/book_provider.dart';
import 'package:provider/provider.dart';

import '../domain/book.dart';

class BookWrapper extends StatelessWidget {
  final String isbn;
  final Widget Function(Book? book) builder;

  const BookWrapper({super.key, required this.isbn, required this.builder});

  @override
  Widget build(BuildContext context) {
    Book? book = context.watch<BookProvider>().getBook(isbn);
    return builder(book);
  }
}
