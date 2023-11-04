import 'package:injectable/injectable.dart';
import 'package:news_app/data/dataSourceContract/news_source_data_source.dart';
import 'package:news_app/data/models/SourcesResponse.dart';
import 'package:news_app/repoContract/news_source_repo.dart';

@Injectable(as: NewsSourceRepository)
class NewsSourceRepoImpl extends NewsSourceRepository {
  NewsSourceDataSource remoteDataSource;

  @factoryMethod
  NewsSourceRepoImpl(this.remoteDataSource); //constructor injection

  @override
  Future<List<Sources>?> getSources(String? categoryId) {
    return remoteDataSource.getSources(categoryId);
  }
}
