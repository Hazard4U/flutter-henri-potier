import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_henri_potier/domain/book.dart';

class BookProvider with ChangeNotifier {
  final Map<String, Book> _books = HashMap();

  List<Book> get books => _books.values.toList();

  void addBooks(List<Book> books) {
    for (var book in books) {
      _books[book.isbn] = book;
    }
    notifyListeners();
  }

  Book? getBook(String isbn) {
    return _books[isbn];
  }
}
