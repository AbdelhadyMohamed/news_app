import '../data/models/NewsResponse.dart';

abstract class NewsRepoContract {
  Future<List<News>?> getNews(String? sourceId, String? keyword);
}
