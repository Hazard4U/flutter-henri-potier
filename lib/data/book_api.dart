import 'package:dio/dio.dart';
import 'package:flutter_henri_potier/data/book_dto.dart';
import 'package:flutter_henri_potier/data/offer_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'book_api.g.dart';

@RestApi(baseUrl: "https://henri-potier.techx.fr/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/books")
  Future<List<BookDTO>> getBooks();

  @GET("/books/{ids}/commercialOffers")
  Future<OffersDTO> getOffers(@Path("ids") String id);
}
