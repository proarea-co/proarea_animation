import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'base_error.g.dart';

@JsonSerializable()
class BaseError extends Equatable {
  final int status;
  final String detail;
  final String message;

  const BaseError({
    required this.status,
    required this.detail,
    required this.message,
  });

  factory BaseError.fromJson(Map<String, dynamic> json) {
    return _$BaseErrorFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BaseErrorToJson(this);

  @override
  List<Object?> get props {
    return [
      status,
      detail,
      message,
    ];
  }
}
