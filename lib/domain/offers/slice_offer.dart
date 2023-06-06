import 'package:flutter_henri_potier/domain/offers/offer.dart';

class SliceOffer extends Offer {
  double value;
  double sliceValue;

  SliceOffer(
      {required super.type, required this.value, required this.sliceValue});

  @override
  double calculate(double total) {
    return (total / sliceValue).floor() * value;
  }
}
