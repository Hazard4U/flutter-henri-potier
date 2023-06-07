import 'package:flutter/material.dart';
import 'package:flutter_henri_potier/application/book_service.dart';
import 'package:flutter_henri_potier/domain/book.dart';
import 'package:flutter_henri_potier/main.dart';
import 'package:flutter_henri_potier/presentation/book_list.dart';
import 'package:flutter_henri_potier/presentation/state/book_provider.dart';
import 'package:provider/provider.dart';

class BookLoader extends StatelessWidget {
  late final BookService bookService;

  BookLoader({super.key}) {
    bookService = getIt<BookService>();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Book>>(
        future: bookService.getBooks().then((value) {
          context.read<BookProvider>().addBooks(value);
          return value;
        }),
        builder: (BuildContext context, AsyncSnapshot<List<Book>> snapshot) {
          if (snapshot.hasData) {
            return BookList(
              books: snapshot.requireData,
              basketAvailable: true,
            );
          } else if (snapshot.hasError) {
            return Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return const Text("Awaiting results");
          }
        });
  }
}
