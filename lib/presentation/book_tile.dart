import 'package:flutter/material.dart';
import 'package:flutter_henri_potier/domain/book.dart';
import 'package:flutter_henri_potier/presentation/book_cover.dart';
import 'package:flutter_henri_potier/presentation/state/basket_provider.dart';
import 'package:provider/provider.dart';

class BookTile extends StatefulWidget {
  final Book book;
  final bool basketAvailable;

  const BookTile({super.key, required this.book, this.basketAvailable = false});

  @override
  State<BookTile> createState() => _BookTileState();
}

class _BookTileState extends State<BookTile> {
  bool added = false;

  handleChange(bool value) {
    setState(() {
      added = value;
    });

    if (added) {
      context.read<BasketProvider>().addBook(widget.book);
    } else {
      context.read<BasketProvider>().removeBook(widget.book.isbn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          BookCover(coverUrl: widget.book.cover),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(widget.book.title),
          ),
          const Spacer(),
          if (widget.basketAvailable)
            Switch(onChanged: handleChange, value: added)
          else
            Container()
        ],
      ),
    );
  }
}
