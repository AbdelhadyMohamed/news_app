import 'package:injectable/injectable.dart';
import 'package:news_app/data/dataSourceContract/news_data_source.dart';
import 'package:news_app/repoContract/news_repo_contract.dart';

import '../models/NewsResponse.dart';

@Injectable(as: NewsRepoContract)
class NewsRepoImpl implements NewsRepoContract {
  NewsDataSource dataSource;
  @factoryMethod
  NewsRepoImpl(this.dataSource);

  @override
  Future<List<News>?> getNews(String? sourceId, String? keyword) {
    return dataSource.getNews(sourceId, keyword);
  }
}
