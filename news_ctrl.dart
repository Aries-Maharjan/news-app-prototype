import 'package:dio/dio.dart';

import '../model/news_model.dart';

class NewsCtrl{
  final Dio _dio = Dio();

  Future<NewsModel?> fetchNews() async{
    try{
      final response = await _dio.get(ApiEndpoint.topHeadlines);
      if(response.statusCode == 200){
        return NewsModel.fromJson(response.data);
      }
    } catch (e) {
      return null;
    }
    return null;

  }


}

class ApiEndpoint {
  static const String baseUrl = "https://newsapi.org/v2";
  static const String apiKey = "32aea7077b2b457cbf7334a0cdc0c0e6";
  static const String topHeadlines = "$baseUrl/top-headlines?country=us&category=business&apiKey=$apiKey";


}
