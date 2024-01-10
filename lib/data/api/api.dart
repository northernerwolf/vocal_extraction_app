import 'package:dio/dio.dart';

class MyApiDataSource {
  static Dio dio = Dio();
  Future<Response> postUrl(String audio, bool youtube) async {
    final response = await dio.post(
        "https://prediction-q76mmqxizq-uc.a.run.app",
        data: {"audio": audio, "youtube": youtube});
    return response;
  }
}
