import 'package:flutter/widgets.dart';
import 'package:news_app/shared/api_manager/api_manager.dart';
import 'package:provider/provider.dart';
import '../../models/SourcesResponse.dart';

class CategoryDetailsViewModel extends ChangeNotifier {
  List<Sources>? sourcesList;
  String? errorMessage;
  bool? showLoading;
  getSources(String categoryId) async {
    showLoading = true;
    notifyListeners();
    try {
      var response = await ApiManager.getInstance().getSources(categoryId);
      if (response.status == "error") {
        //error
        errorMessage = response.message;
      } else {
        //data
        sourcesList = response.sources;
      }
    } catch (e) {
      errorMessage = e.toString();
    }
    notifyListeners();
  }
}
