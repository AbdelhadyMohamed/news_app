import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/NewsResponse.dart';
import 'package:news_app/ui/categories/category_tab_screen.dart';
import 'package:news_app/ui/widgets/show_full_news_widget.dart';
import 'package:provider/provider.dart';

import '../../providers/my_provider.dart';

class NewsWidget extends StatefulWidget {
  News news;
  int index;
  NewsWidget(this.news, this.index, {super.key});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Padding(
      padding: EdgeInsets.all(12),
      child: InkWell(
        onTap: () {
          provider.fromNewsToFull();
          provider.getNews(widget.news, widget.index);
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
                imageUrl: widget.news.urlToImage ?? " ",
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(
                        child: CircularProgressIndicator(
                            value: downloadProgress.progress)),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            Text(
              widget.news.author ?? "",
              textAlign: TextAlign.start,
            ),
            Text(
              widget.news.title ?? "",
              textAlign: TextAlign.start,
            ),
            Text(
              widget.news.publishedAt?.substring(0, 10) ?? "",
              textAlign: TextAlign.end,
            ),
          ],
        ),
      ),
    );
  }
}
