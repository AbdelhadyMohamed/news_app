import 'package:injectable/injectable.dart';
import 'package:news_app/data/api_manager/api_manager.dart';
import 'package:news_app/data/dataSourceContract/news_data_source.dart';
import 'package:news_app/data/dataSourceContract/news_source_data_source.dart';
import 'package:news_app/data/models/SourcesResponse.dart';

@Injectable(as: NewsSourceDataSource)
class NewsSourceDataSourceImplementation extends NewsSourceDataSource {
  ApiManager apiManager;
  @factoryMethod
  NewsSourceDataSourceImplementation(this.apiManager); // constructor injection

  @override
  Future<List<Sources>?> getSources(String? categoryId) async {
    var response = await apiManager.getSources(categoryId);
    return response.sources;
  }
}
