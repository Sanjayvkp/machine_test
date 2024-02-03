import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_machine_test/model/api_model.dart';
import 'package:flutter_machine_test/utils/api_utils.dart';

class ApiService {
  static final dio = Dio();
  static Future<List<UserPosts>?> fetchData() async {
    const path = ApiUrl.jsonUrl;
    try {
      final Response response = await dio.get(path);
      if (response.statusCode == 200) {
        final posts = <UserPosts>[];
        for (var i in response.data) {
          posts.add(UserPosts.fromJson(i));
        }
        return posts;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
