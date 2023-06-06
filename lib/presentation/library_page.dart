import 'package:flutter/material.dart';
import 'package:flutter_henri_potier/presentation/book_loader.dart';
import 'package:go_router/go_router.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text("Library"),
      ),
      body: BookLoader(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.go("/basket");
        },
        tooltip: 'Basket',
        child: const Icon(Icons.shopping_basket),
      ),
    );
  }
}
