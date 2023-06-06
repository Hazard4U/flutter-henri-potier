import 'package:flutter_henri_potier/domain/offers/offer.dart';

class PercentageOffer extends Offer {
  double value;

  PercentageOffer({required super.type, required this.value});

  @override
  double calculate(double total) {
    return total * value / 100;
  }
}
