import 'package:flutter/cupertino.dart';

import '../models/NewsResponse.dart';

class SearchProvider extends ChangeNotifier {
  String? searchedItem;

  searchNews(String keyword) {
    searchedItem ??= "";
    searchedItem = keyword;
    notifyListeners();
  }
}
