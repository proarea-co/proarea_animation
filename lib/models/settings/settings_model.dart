import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class SettingsModel extends Equatable {
  final String userName;
  final String appVersion;

  const SettingsModel({
    this.userName = '',
    this.appVersion = '',
  });

  @override
  List<Object> get props {
    return [
      userName,
      appVersion,
    ];
  }

  SettingsModel copyWith({
    String? userName,
    String? appVersion,
  }) {
    return SettingsModel(
      userName: userName ?? this.userName,
      appVersion: appVersion ?? this.appVersion,
    );
  }
}
