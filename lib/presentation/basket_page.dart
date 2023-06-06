import 'package:flutter/material.dart';
import 'package:flutter_henri_potier/presentation/basket_wrapper.dart';
import 'package:flutter_henri_potier/presentation/book_list.dart';
import 'package:flutter_henri_potier/presentation/offer_loader.dart';

class BasketPage extends StatelessWidget {
  const BasketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text("Basket"),
      ),
      body: BasketWrapper(builder: (books) {
        if (books.isEmpty) return const Center(child: Text("Empty basket"));
        return Column(
          children: [
            OfferLoader(books: books),
            Expanded(child: BookList(books: books)),
          ],
        );
      }),
    );
  }
}
