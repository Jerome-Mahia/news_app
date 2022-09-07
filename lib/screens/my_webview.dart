import 'package:flutter/material.dart';
import 'package:news_app/models/news.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyWebView extends StatelessWidget {
  const MyWebView({
    Key? key,
    required this.news,
  }) : super(key: key);

  final News news;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(news.title),
        ),
        body: Column(
          children: [
          Expanded(
              child: WebView(
                  initialUrl: news.url,
                  javascriptMode: JavascriptMode.unrestricted,
              )
          ),
        ],
        ),
        );
  }
}
