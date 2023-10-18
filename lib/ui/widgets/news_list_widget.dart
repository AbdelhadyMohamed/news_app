import 'package:flutter/material.dart';
import 'package:news_app/models/SourcesResponse.dart';
import 'package:news_app/shared/api_manager/api_manager.dart';

import 'news_widget.dart';

class NewsListWidget extends StatelessWidget {
  Sources source;
  NewsListWidget(this.source, {super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getNews(source.id!),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError || snapshot.data?.status == "error") {
          return Column(
            children: [
              Center(
                child: Text(
                    snapshot.data?.message ?? snapshot.data!.status.toString()),
              ),
              ElevatedButton(
                  onPressed: () {}, child: const Text("Please try again"))
            ],
          );
        }

        var news = snapshot.data?.articles ?? [];

        return Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return NewsWidget(news[index]);
            },
            itemCount: news.length ?? 0,
          ),
        );
      },
    );
  }
}
