import 'package:injectable/injectable.dart';
import 'package:news_app/data/api_manager/api_manager.dart';
import 'package:news_app/data/dataSourceContract/news_data_source.dart';
import 'package:news_app/data/models/NewsResponse.dart';

@Injectable(as: NewsDataSource)
class NewsDataSourceImpl extends NewsDataSource {
  ApiManager apiManager;
  @factoryMethod
  NewsDataSourceImpl(this.apiManager);

  @override
  @override
  Future<List<News>?> getNews(String? sourceId, String? keyword) async {
    var response = await apiManager.getNews(sourceId, keyword);
    return response.articles;
  }
}
