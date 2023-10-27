import 'package:news_app/data/api_manager/api_manager.dart';
import 'package:news_app/data/dataSourceContract/news_source_data_source.dart';
import 'package:news_app/data/models/SourcesResponse.dart';

class NewsSourceDataSourceImplementation extends NewsSourceDataSource {
  ApiManager apiManager;

  NewsSourceDataSourceImplementation(this.apiManager);

  @override
  Future<List<Sources>?> getSources(String categoryId) async {
    var response = await apiManager.getSources(categoryId);
    return response.sources;
  }
}
