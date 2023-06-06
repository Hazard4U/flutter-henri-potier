import 'dart:collection';

import '../../domain/book.dart';

class BasketProvider {
  final Map<String, Book> _books = HashMap();

  List<Book> get books => _books.values.toList();

  void addBook(Book book) {
    _books[book.isbn] = book;
  }

  Book? removeBook(String isbn) {
    return _books.remove(isbn);
  }
}
