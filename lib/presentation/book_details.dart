import 'package:flutter/material.dart';
import 'package:flutter_henri_potier/domain/book.dart';
import 'package:flutter_henri_potier/presentation/book_cover.dart';

class BookDetails extends StatelessWidget {
  final Book? book;
  const BookDetails({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    if (book == null) return const Center(child: Text('Unknown book'));
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BookCover(coverUrl: book!.cover),
          Text("Title: ${book!.title}"),
          Text("ISBN: ${book!.isbn}"),
          Text("Price: ${book!.price} €"),
          const Text("Synopsis:"),
          for (String synopsis in book!.synopsis) Text(synopsis.toString()),
        ],
      ),
    );
  }
}
