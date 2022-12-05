import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import 'address.dart';
import 'company.dart';

part 'user.g.dart';

@JsonSerializable()
@immutable
class User extends Equatable {
  final int id;
  final String name;
  final String username;
  final String email;
  final Address address;
  final String phone;
  final String website;
  final Company company;

  const User({
    this.id = 0,
    this.name = '',
    this.username = '',
    this.email = '',
    this.address = const Address(),
    this.phone = '',
    this.website = '',
    this.company = const Company(),
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  List<Object> get props {
    return [
      id,
      name,
      username,
      email,
      address,
      phone,
      website,
      company,
    ];
  }

  User copyWith({
    int? id,
    String? name,
    String? username,
    String? email,
    Address? address,
    String? phone,
    String? website,
    Company? company,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      username: username ?? this.username,
      email: email ?? this.email,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      website: website ?? this.website,
      company: company ?? this.company,
    );
  }
}
