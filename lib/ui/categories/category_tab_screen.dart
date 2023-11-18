import 'package:flutter/material.dart';

import '../../data/models/SourcesResponse.dart';
import '../news/news_list_widget.dart';
import '../news/tab_widget.dart';

class CategoryTabScreen extends StatefulWidget {
  List<Sources> sources;
  int index = 0;
  CategoryTabScreen(this.sources, {super.key});

  @override
  State<CategoryTabScreen> createState() => _CategoryTabScreenState();
}

class _CategoryTabScreenState extends State<CategoryTabScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sources.length,
      child: Expanded(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: TabBar(
                  indicatorColor: Colors.transparent,
                  onTap: (currentIndex) {
                    widget.index = currentIndex;
                    setState(() {});
                  },
                  isScrollable: true,
                  tabs: widget.sources
                      .map((source) => TabWidget(source,
                          widget.sources.indexOf(source) == widget.index))
                      .toList()),
            ),
            NewsListWidget(widget.sources[widget.index])
          ],
        ),
      ),
    );
  }
}
// typedef OnFullNewsClicked = Function();
// OnFullNewsClicked onFullNewsClicked;
