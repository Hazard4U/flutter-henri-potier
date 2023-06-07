import 'package:flutter/material.dart';
import 'package:flutter_henri_potier/presentation/state/basket_provider.dart';
import 'package:flutter_henri_potier/presentation/state/book_provider.dart';
import 'package:provider/provider.dart';

class Providers extends StatelessWidget {
  final Widget child;

  const Providers({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BookProvider()),
        ChangeNotifierProvider(
          create: (_) => BasketProvider(),
        ),
      ],
      child: child,
    );
  }
}
