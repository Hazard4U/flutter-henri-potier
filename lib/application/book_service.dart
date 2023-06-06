import 'package:flutter_henri_potier/data/book_api.dart';
import 'package:flutter_henri_potier/data/book_dto.dart';
import 'package:flutter_henri_potier/domain/book.dart';
import 'package:flutter_henri_potier/main.dart';

class BookService {
  late final RestClient client;

  BookService() {
    client = getIt<RestClient>();
  }

  Future<List<Book>> getBooks() async {
    List<BookDTO> books = await client.getBooks();
    ToBook mapper = ToBook();
    return books.map(mapper.map).toList();
  }
}
