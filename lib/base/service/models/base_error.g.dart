// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseError _$BaseErrorFromJson(Map<String, dynamic> json) => BaseError(
      status: json['status'] as int,
      detail: json['detail'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$BaseErrorToJson(BaseError instance) => <String, dynamic>{
      'status': instance.status,
      'detail': instance.detail,
      'message': instance.message,
    };
