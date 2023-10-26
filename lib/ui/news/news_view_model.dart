import 'package:bloc/bloc.dart';
import 'package:news_app/shared/api_manager/api_manager.dart';

import '../../models/NewsResponse.dart';

class NewsViewModel extends Cubit<NewsListState> {
  NewsViewModel() : super(LoadingState("Loading...."));
  void loadNews(String sourceId, String keyword) async {
    emit(LoadingState("Loading...."));
    try {
      var response = await ApiManager.getInstance().getNews(sourceId, keyword);
      if (response.status == "error") {
        emit(ErrorState(response.message ?? ""));
      } else {
        emit(SuccessState(response.articles));
      }
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }
}

sealed class NewsListState {}

class SuccessState extends NewsListState {
  List<News>? newsList;
  SuccessState(this.newsList);
}

class ErrorState extends NewsListState {
  String message;

  ErrorState(this.message);
}

class LoadingState extends NewsListState {
  String message;

  LoadingState(this.message);
}
