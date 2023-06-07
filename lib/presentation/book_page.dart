import 'package:flutter/material.dart';
import 'package:flutter_henri_potier/presentation/book_details.dart';
import 'package:flutter_henri_potier/presentation/book_wrapper.dart';

class BookPage extends StatelessWidget {
  final String? isbn;

  const BookPage({super.key, required this.isbn});

  @override
  Widget build(BuildContext context) {
    if (isbn == null) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: const Text("Book : No ISBN"),
        ),
        body: const Text("No ISBN"),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: BookWrapper(
            isbn: isbn!,
            builder: (book) {
              return Text("Book : ${book?.title ?? "Unknown"}");
            }),
      ),
      body: BookWrapper(
        isbn: isbn!,
        builder: (book) {
          return BookDetails(book: book);
        },
      ),
    );
  }
}
