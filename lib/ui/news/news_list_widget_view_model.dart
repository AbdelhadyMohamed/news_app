import 'package:flutter/widgets.dart';
import 'package:news_app/shared/api_manager/api_manager.dart';

import '../../models/NewsResponse.dart';

class NewsListViewModel extends ChangeNotifier {
  bool? showLoading;
  List<News>? newsList;
  String? errorMessage;

  getNews(String sourceId, String keyword) async {
    showLoading = true;
    notifyListeners();
    try {
      var response = await ApiManager.getInstance().getNews(sourceId, keyword);
      if (response.status == "error") {
        showLoading = false;
        errorMessage = response.message;
      } else {
        showLoading = false;
        newsList = response.articles;
      }
    } catch (e) {
      errorMessage = e.toString();
    }
    notifyListeners();
  }
}
