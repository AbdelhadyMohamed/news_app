import '../data/models/SourcesResponse.dart';

abstract class NewsSourceRepository {
  Future<List<Sources>?> getSources(categoryId);
}
