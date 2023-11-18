import '../models/NewsResponse.dart';

abstract class NewsDataSource {
  Future<List<News>?> getNews(String? sourceId, String? keyword);
}
