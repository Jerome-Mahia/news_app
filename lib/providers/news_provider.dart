import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/models/news.dart';
import 'package:news_app/service/news_service.dart';

final newsProvider = FutureProvider<List<News>>((ref) async {
  return ref.read(newsApiProvider).getNews();
});
