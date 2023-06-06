import 'dart:js_interop';

import 'package:flutter_henri_potier/domain/offers/minus_offer.dart';
import 'package:flutter_henri_potier/domain/offers/offer.dart';
import 'package:flutter_henri_potier/domain/offers/percentage_offer.dart';
import 'package:flutter_henri_potier/domain/offers/slice_offer.dart';
import 'package:json_annotation/json_annotation.dart';

import '../tool/mapper.dart';

part 'offer_dto.g.dart';

@JsonSerializable()
class OffersDTO {
  List<OfferDTO>? offers;

  OffersDTO({this.offers});

  factory OffersDTO.fromJson(Map<String, dynamic> json) =>
      _$OffersDTOFromJson(json);
}

@JsonSerializable()
class OfferDTO {
  String? type;
  double? value;
  double? sliceValue;

  OfferDTO({this.type, this.value, this.sliceValue});

  factory OfferDTO.fromJson(Map<String, dynamic> json) =>
      _$OfferDTOFromJson(json);
}

class ToOffers implements Mapper<OffersDTO, List<Offer>> {
  @override
  List<Offer> map(OffersDTO object) {
    if (object.offers.isNull) {
      throw Exception('Non null offer variables expected');
    }

    List<Offer> offers = object.offers!.map((e) {
      if (e.type.isNull || e.value.isNull) {
        throw Exception('Non null offer variables expected');
      }

      switch (e.type) {
        case "percentage":
          return PercentageOffer(type: e.type!, value: e.value!);
        case "minus":
          return MinusOffer(type: e.type!, value: e.value!);
        case "slice":
          if (e.sliceValue.isNull) {
            throw Exception('Non null offer variables expected');
          }
          return SliceOffer(
              type: e.type!, value: e.value!, sliceValue: e.sliceValue!);
        default:
          throw Exception("Unknown offer");
      }
    }).toList();

    return offers;
  }
}
