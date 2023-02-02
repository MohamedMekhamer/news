import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/model/NewsResponse.dart';
import 'package:news/model/SourcesResponse.dart';

class ApiManger {
  static const String baseUrl = 'newsapi.org';

  static Future<SourcesResponce> getSources(String categoryId) async {
    var url = Uri.https(baseUrl, 'v2/top-headlines/sources',
        {'apiKey': 'bd11d1d8f2564a4ea470c4f8a0296fcd', 'category': categoryId});
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      var sourcesResponse = SourcesResponce.fromJson(json);
      return sourcesResponse;
    } catch (e) {
      throw e;
    }
  }

  static Future<NewsResponce> getNews({
    String? sourceId,
    String? searchKeyword,
    int? page,
  }) async {
    var url = Uri.https(baseUrl, '/v2/everything', {
      'apiKey': 'bd11d1d8f2564a4ea470c4f8a0296fcd',
      'sources': sourceId,
      'q': searchKeyword,
      'page' : '$page',
      'pageSize':'30',
    });
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      var newsResponse = NewsResponce.fromJson(json);
      return newsResponse;
    } catch (e) {
      throw e;
    }
  }
}
