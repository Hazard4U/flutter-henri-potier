import 'package:flutter_henri_potier/domain/offers/offer.dart';

class MinusOffer extends Offer {
  double value;


  MinusOffer({required super.type, required this.value});

  @override
  double calculate(double total) {
    return value;
  }
}
