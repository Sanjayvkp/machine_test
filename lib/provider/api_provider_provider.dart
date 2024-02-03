import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_machine_test/model/api_model.dart';
import 'package:flutter_machine_test/utils/api_utils.dart';

class MyApiProvider extends ChangeNotifier {
  List<UserPosts> posts = [];
  final Dio dio = Dio();

  Future<void> fetchPosts() async {
    final response = await dio.get(ApiUrl.jsonUrl);

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.data);
      posts = data.map((json) => UserPosts.fromJson(json)).toList();
      notifyListeners();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
