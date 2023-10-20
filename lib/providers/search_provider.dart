import 'package:flutter/cupertino.dart';

class SearchProvider extends ChangeNotifier {
  String? searchedItem;
  bool? showSearchIcon;

  searchNews(String keyword) {
    searchedItem ??= "";
    searchedItem = keyword;
    notifyListeners();
  }

  viewSearchIcon() {
    showSearchIcon = true;
    notifyListeners();
  }

  unViewSearchIcon() {
    showSearchIcon = false;
    notifyListeners();
  }
}
