import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_henri_potier/application/book_service.dart';
import 'package:flutter_henri_potier/application/offer_service.dart';
import 'package:flutter_henri_potier/application/router.dart';
import 'package:flutter_henri_potier/data/book_api.dart';
import 'package:flutter_henri_potier/presentation/state/providers.dart';
import 'package:get_it/get_it.dart';

void main() {
  getIt.registerSingleton(RestClient(Dio()));
  getIt.registerSingleton(BookService());
  getIt.registerSingleton(OfferService());
  runApp(const MyApp());
}

GetIt getIt = GetIt.instance;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Providers(
      child: MaterialApp.router(
        routerConfig: router,
      ),
    );
  }
}
