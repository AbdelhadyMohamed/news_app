import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:news_app/models/SourcesResponse.dart';

import '../../models/NewsResponse.dart';

class ApiManager {
  static const String apiKey = "5edd600c6201426bbccb9f232dd022ca";
  static const String baseUrl = "newsapi.org";
  static Future<SourcesResponse> getSources(String categoryId) async {
    Uri url = Uri.https("newsapi.org", "/v2/top-headlines/sources",
        {"apikey": apiKey, "category": categoryId});
    Response response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    SourcesResponse sourcesResponse = SourcesResponse.fromJson(jsonData);
    return sourcesResponse;
  }

  static Future<NewsResponse> getNews(String sourcedId) async {
    Uri url = Uri.https(baseUrl, "/v2/everything",
        {"apikey": apiKey, "sources": sourcedId, "source": sourcedId});
    Response response = await http.get(url);
    var json = jsonDecode(response.body);
    var newsResponse = NewsResponse.fromJson(json);
    return newsResponse;
  }
}
