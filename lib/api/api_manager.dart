import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news/api/api_constants.dart';
import 'package:news/api/end_points.dart';
import 'package:news/model/NewsResponse.dart';
import 'package:news/model/SourceResponse.dart';

class ApiManager {
  /*
 https://newsapi.org/v2/top-headlines/sources?apiKey=b5758fee4b1b498c9fe663551304daa1
 */

  static Future<SourceResponse?> getSources(String categoryId) async {
    Uri url = Uri.https(ApiConstants.baseUrl, EndPoints.sourceApi,
        {'apiKey': ApiConstants.apiKey, 'category': categoryId});
    try {
      var response = await http.get(url);
      var responseBody = response.body; // String
      var json = jsonDecode(responseBody); // to json
      return SourceResponse.fromJson(json);
    } catch (e) {
      rethrow;
    } // to object
    // String => json => object
  }

/*https://newsapi.org/v2/everything?q=bitcoin&apiKey=b5758fee4b1b498c9fe663551304daa1
  */
  static Future<NewsResponse?> getNewsBySourceId(String sourceId) async {
    Uri url = Uri.https(ApiConstants.baseUrl, EndPoints.newsApi,
        {'apiKey': ApiConstants.apiKey, 'sources': sourceId});
    try {
      var response = await http.get(url);
      var responseBody = response.body; // String
      var json = jsonDecode(responseBody); // to json
      return NewsResponse.fromJson(json);
    } catch (e) {
      rethrow;
    } // to object
  }
}
