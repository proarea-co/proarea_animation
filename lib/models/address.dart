import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';

part 'address.g.dart';

@JsonSerializable()
@immutable
class Address extends Equatable {
  final String street;
  final String suite;
  final String city;
  @JsonKey(name: 'zipcode')
  final String zipCode;

  const Address({
    this.street = '',
    this.suite = '',
    this.city = '',
    this.zipCode = '',
  });

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
  Map<String, dynamic> toJson() => _$AddressToJson(this);

  @override
  List<Object> get props {
    return [
      street,
      suite,
      city,
      zipCode,
    ];
  }

  Address copyWith({
    String? street,
    String? suite,
    String? city,
    String? zipCode,
  }) {
    return Address(
      street: street ?? this.street,
      suite: suite ?? this.suite,
      city: city ?? this.city,
      zipCode: zipCode ?? this.zipCode,
    );
  }
}
