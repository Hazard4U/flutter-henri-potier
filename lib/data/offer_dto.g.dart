// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OffersDTO _$OffersDTOFromJson(Map<String, dynamic> json) => OffersDTO(
      offers: (json['offers'] as List<dynamic>?)
          ?.map((e) => OfferDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OffersDTOToJson(OffersDTO instance) => <String, dynamic>{
      'offers': instance.offers,
    };

OfferDTO _$OfferDTOFromJson(Map<String, dynamic> json) => OfferDTO(
      type: json['type'] as String?,
      value: (json['value'] as num?)?.toDouble(),
      sliceValue: (json['sliceValue'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$OfferDTOToJson(OfferDTO instance) => <String, dynamic>{
      'type': instance.type,
      'value': instance.value,
      'sliceValue': instance.sliceValue,
    };
