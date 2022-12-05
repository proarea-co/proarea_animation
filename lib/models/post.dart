import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post.g.dart';

@JsonSerializable()
@immutable
class Post extends Equatable {
  final int userId;
  final int id;
  final String title;
  final String body;

  const Post({
    this.userId = 0,
    this.id = 0,
    this.title = '',
    this.body = '',
  });

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
  Map<String, dynamic> toJson() => _$PostToJson(this);

  @override
  List<Object> get props {
    return [
      userId,
      id,
      title,
      body,
    ];
  }

  Post copyWith({
    int? userId,
    int? id,
    String? title,
    String? body,
  }) {
    return Post(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }
}
