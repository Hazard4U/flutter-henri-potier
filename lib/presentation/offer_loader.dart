import 'package:flutter/material.dart';
import 'package:flutter_henri_potier/application/offer_service.dart';
import 'package:flutter_henri_potier/domain/book.dart';
import 'package:flutter_henri_potier/domain/offers/best_offer.dart';
import 'package:flutter_henri_potier/main.dart';

import 'basket_info.dart';

class OfferLoader extends StatelessWidget {
  final List<Book> books;
  late final OfferService offerService;

  OfferLoader({super.key, required this.books}) {
    offerService = getIt<OfferService>();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<BestOffer?>(
        future: offerService.getBestOffer(books),
        builder: (BuildContext context, AsyncSnapshot<BestOffer?> snapshot) {
          if (snapshot.hasData) {
            return Card(
              color: Theme.of(context).colorScheme.background,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: Padding(
                  padding:  const EdgeInsets.all(10.0),
                  child: Center(
                      child: Column(
                    children: [
                      BasketInfo(
                        first: 'Total:',
                        second: '${snapshot.requireData!.total.toString()}€',
                      ),
                      BasketInfo(
                        first: 'Best offer (${snapshot.requireData!.offer?.type}):',
                        second: '${snapshot.requireData!.reduction.toString()}€',
                      ),
                      BasketInfo(
                        first: 'Total after offer:',
                        second: '${(snapshot.requireData!.total -
                                snapshot.requireData!.reduction)
                            .toString()}€',
                      ),
                    ],
                  ))),
            );
          } else if (snapshot.hasError) {
            return Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return const Text("Awaiting results");
          }
        });
  }
}
