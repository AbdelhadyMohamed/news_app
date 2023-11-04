import '../models/SourcesResponse.dart';

abstract class NewsSourceDataSource {
  Future<List<Sources>?> getSources(String? categoryId);
}
