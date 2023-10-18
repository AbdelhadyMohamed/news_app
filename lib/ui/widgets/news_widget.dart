import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/NewsResponse.dart';

class NewsWidget extends StatelessWidget {
  News news;
  NewsWidget(this.news, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: InkWell(
        onTap: () {
          // showFullNewsWidget();
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: CachedNetworkImage(
                height: 220,
                width: double.infinity,
                fit: BoxFit.fill,
                imageUrl: news.urlToImage ?? " ",
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(
                        child: CircularProgressIndicator(
                            value: downloadProgress.progress)),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            Text(
              news.author ?? "",
              textAlign: TextAlign.start,
            ),
            Text(
              news.title ?? "",
              textAlign: TextAlign.start,
            ),
            Text(
              news.publishedAt ?? "",
              textAlign: TextAlign.end,
            ),
          ],
        ),
      ),
    );
  }
}
