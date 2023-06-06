import 'dart:js_interop';

import 'package:flutter_henri_potier/domain/book.dart';
import 'package:json_annotation/json_annotation.dart';

import '../tool/mapper.dart';

part 'book_dto.g.dart';

@JsonSerializable()
class BookDTO {
  String? isbn;
  String? title;
  double? price;
  String? cover;
  List<String>? synopsis;

  BookDTO({this.isbn, this.title, this.price, this.cover, this.synopsis});

  factory BookDTO.fromJson(Map<String, dynamic> json) =>
      _$BookDTOFromJson(json);
}

class ToBook implements Mapper<BookDTO, Book> {
  @override
  Book map(BookDTO object) {
    if (object.isbn.isNull ||
        object.title.isNull ||
        object.price.isNull ||
        object.cover.isNull ||
        object.synopsis.isNull) {
      throw Exception('Non null book variables expected');
    }

    return Book(
      isbn: object.isbn!,
      title: object.title!,
      price: object.price!,
      cover: object.cover!,
      synopsis: object.synopsis!,
    );
  }
}
