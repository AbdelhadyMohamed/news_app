import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import '../models/NewsResponse.dart';
import '../models/SourcesResponse.dart';

@singleton
class ApiManager {
  static const String apiKey = "38a53e1cd499476194cdb9211d1f9ab1";
  static const String baseUrl = "newsapi.org";

  ApiManager();

  Future<SourcesResponse> getSources(String? categoryId) async {
    Uri url = Uri.https("newsapi.org", "/v2/top-headlines/sources",
        {"apikey": apiKey, "category": categoryId});
    Response response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    SourcesResponse sourcesResponse = SourcesResponse.fromJson(jsonData);
    return sourcesResponse;
  }

  Future<NewsResponse> getNews(String? sourceId, String? keyword) async {
    Uri url = Uri.https(baseUrl, "/v2/everything",
        {"apikey": apiKey, "sources": sourceId, "q": keyword});
    Response response = await http.get(url);
    var json = jsonDecode(response.body);
    var newsResponse = NewsResponse.fromJson(json);
    return newsResponse;
  }
}
