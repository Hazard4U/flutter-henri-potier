import 'dart:collection';

import 'package:flutter/material.dart';

import '../../domain/book.dart';

class BasketProvider with ChangeNotifier {
  final Map<String, Book> _books = HashMap();

  List<Book> get books => _books.values.toList();

  void addBook(Book book) {
    _books[book.isbn] = book;
    notifyListeners();
  }

  Book? removeBook(String isbn) {
    Book? book = _books.remove(isbn);
    notifyListeners();
    return book;
  }
}
