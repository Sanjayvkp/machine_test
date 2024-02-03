import 'package:flutter_machine_test/model/api_model.dart';
import 'package:flutter_machine_test/services/api_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiProvider = FutureProvider<List<UserPosts>?>((ref) async {
  return ApiService.fetchData();
});
