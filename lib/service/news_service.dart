import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:news_app/models/news.dart';

String apiKey = 'c5c04e055b62459abbdd3ac31b506d4e';

class ApiService {
  String endpoint =
      'https://newsapi.org/v2/top-headlines?country=us&apiKey=${apiKey}';

  Future<List<News>> getNews() async {
    Response response = await get(Uri.parse(endpoint));
    if (response.statusCode == 200) {
      final List result = jsonDecode(
          response.body)['articles']; //retrieving everything from Api
      return result.map(((e) => News.fromJson(e))).toList();
    } else {
      throw Exception(response.reasonPhrase); //name of error
    }
  }
}

final newsApiProvider = Provider<ApiService>((ref) => ApiService());
