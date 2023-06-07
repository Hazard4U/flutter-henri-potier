import 'package:flutter/material.dart';
import 'package:flutter_henri_potier/domain/book.dart';
import 'package:flutter_henri_potier/presentation/basket_book_switch.dart';
import 'package:flutter_henri_potier/presentation/book_cover.dart';

class BookTile extends StatelessWidget {
  final Book book;
  final bool basketAvailable;

  const BookTile({super.key, required this.book, this.basketAvailable = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          BookCover(coverUrl: book.cover),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(book.title),
          ),
          const Spacer(),
          if (basketAvailable) BasketBookSwitch(book: book) else Container()
        ],
      ),
    );
  }
}
