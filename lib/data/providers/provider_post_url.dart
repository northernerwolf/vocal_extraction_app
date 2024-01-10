import 'package:flutter/material.dart';
import 'package:vocal_extraction_app/domain/repositories/youtube_repository.dart';

class PostUrlProvider with ChangeNotifier {
  final PostUrlRepository useCase = PostUrlRepository();
  bool isLoading = false;
  bool waiting = false;

  Future<void> postUrl(String audio, bool youtube) async {
    final result = await useCase.postData(audio, youtube);
    isLoading = true;
    notifyListeners();
    if (result.statusCode == 200) {
      print('data have');
      if (result.data != null) {
        isLoading = false;
        notifyListeners();
      }
      return;
    }
  }
}
