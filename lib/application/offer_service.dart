import 'package:flutter_henri_potier/data/book_api.dart';
import 'package:flutter_henri_potier/data/offer_dto.dart';
import 'package:flutter_henri_potier/domain/book.dart';
import 'package:flutter_henri_potier/domain/offers/best_offer.dart';
import 'package:flutter_henri_potier/domain/offers/offer.dart';
import 'package:flutter_henri_potier/main.dart';

class OfferService {
  late final RestClient client;

  OfferService() {
    client = getIt<RestClient>();
  }

  Future<BestOffer?> getBestOffer(List<Book> books) async {
    double total = 0;

    String ids = books.map((e) {
      total += e.price;
      return e.isbn;
    }).join(",");

    OffersDTO offersDTO = await client.getOffers(ids);

    ToOffers mapper = ToOffers();

    List<Offer> offers = mapper.map(offersDTO);

    BestOffer? bestOffer;
    for (var offer in offers) {
      double reduction = offer.calculate(total);
      bestOffer = bestOffer == null || bestOffer.reduction < reduction
          ? BestOffer(offer: offer, reduction: reduction, total: total)
          : bestOffer;
    }

    return bestOffer;
  }
}
