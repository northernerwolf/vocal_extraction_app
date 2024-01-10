import 'package:flutter/material.dart';
import 'package:vocal_extraction_app/domain/repositories/youtube_repository.dart';

class PostUrlProvider with ChangeNotifier {
  final PostUrlRepository useCase = PostUrlRepository();
  bool isLoading = false;
  bool waiting = false;

  Future<void> postUrl(String audio, bool youtube, BuildContext context) async {
    final result = await useCase.postData(
      audio,
      youtube,
    );
    isLoading = true;
    notifyListeners();
    if (result.statusCode == 200) {
      print('data have');
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.green,
        content: Text(
          "Starting",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
        ),
      ));
      print(result.data);
      if (result.data != null) {
        isLoading = false;
        notifyListeners();
      }
      return;
    }
  }
}
