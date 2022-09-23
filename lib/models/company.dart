import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'company.g.dart';

@JsonSerializable()
@immutable
class Company extends Equatable {
  final String name;
  final String catchPhrase;
  @JsonKey(name: 'bs')
  final String businessScheme;

  const Company({
    this.name = '',
    this.catchPhrase = '',
    this.businessScheme = '',
  });

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);
  Map<String, dynamic> toJson() => _$CompanyToJson(this);

  @override
  List<Object> get props {
    return [
      name,
      catchPhrase,
      businessScheme,
    ];
  }

  Company copyWith({
    String? name,
    String? catchPhrase,
    String? businessScheme,
  }) {
    return Company(
      name: name ?? this.name,
      catchPhrase: catchPhrase ?? this.catchPhrase,
      businessScheme: businessScheme ?? this.businessScheme,
    );
  }
}
