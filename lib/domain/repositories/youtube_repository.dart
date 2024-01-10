import 'package:dio/dio.dart';

import '../../data/api/api.dart';

class PostUrlRepository {
  final MyApiDataSource apiDataSource = MyApiDataSource();

  Future<Response> postData(String audio, bool youtube) async {
    final response = await apiDataSource.postUrl(audio, youtube);
    return response;
  }
}
