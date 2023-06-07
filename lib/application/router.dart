import 'package:flutter/cupertino.dart';
import 'package:flutter_henri_potier/presentation/basket_page.dart';
import 'package:flutter_henri_potier/presentation/book_page.dart';
import 'package:flutter_henri_potier/presentation/library_page.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const LibraryPage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'basket',
          builder: (BuildContext context, GoRouterState state) {
            return const BasketPage();
          },
        ),
        GoRoute(
          path: 'book/:isbn',
          builder: (BuildContext context, GoRouterState state) {
            return BookPage(
              isbn: state.pathParameters['isbn'],
            );
          },
        ),
      ],
    ),
  ],
);
