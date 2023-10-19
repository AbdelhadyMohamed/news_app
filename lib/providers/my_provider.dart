import 'package:flutter/cupertino.dart';

import '../models/NewsResponse.dart';

class MyProvider extends ChangeNotifier {
  bool? indicator;
  late News newsItem;
  late int newsIndex;
  late String? searchedItem;

  fromNewsToFull() {
    indicator = false;
    notifyListeners();
  }

  fromFullToNews() {
    indicator = true;
    notifyListeners();
  }

  getNews(News news, int index) {
    newsItem = news;
    newsIndex = index;
  }

  searchNews(String keyword) {
    searchedItem = keyword;
    notifyListeners();
  }
}
