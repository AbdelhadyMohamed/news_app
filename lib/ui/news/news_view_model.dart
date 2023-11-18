import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import '../../data/models/NewsResponse.dart';
import '../../repoContract/news_repo_contract.dart';

@injectable
class NewsViewModel extends Cubit<NewsListState> {
  late NewsRepoContract newsRepo;
  @factoryMethod
  NewsViewModel(this.newsRepo) : super(LoadingState("Loading...."));
  void loadNews(String sourceId, String keyword) async {
    emit(LoadingState("Loading...."));
    try {
      var newsList = await newsRepo.getNews(sourceId, keyword);
      emit(SuccessState(newsList));
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

// class NewsWidget {
//   int? id;
//   String? date;
//   String? title;
//   String? content;
//
//   NewsWidget(this.id);
//   NewsWidget.fromTitle(this.title);
//   NewsWidget.fromTitleAndId(this.id, this.title);
// }
