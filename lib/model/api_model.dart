import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_model.freezed.dart';
part 'api_model.g.dart';

List<UserPosts> userPostsFromJson(String str) =>
    List<UserPosts>.from(json.decode(str).map((x) => UserPosts.fromJson(x)));

String userPostsToJson(List<UserPosts> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
class UserPosts with _$UserPosts {
  const factory UserPosts({
    required int userId,
    required int id,
    required String title,
    required String body,
  }) = _UserPosts;

  factory UserPosts.fromJson(Map<String, dynamic> json) =>
      _$UserPostsFromJson(json);
}
