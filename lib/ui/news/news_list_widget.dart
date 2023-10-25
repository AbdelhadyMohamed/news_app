import 'package:flutter/material.dart';
import 'package:news_app/models/SourcesResponse.dart';
import 'package:news_app/providers/search_provider.dart';
import 'package:news_app/ui/news/news_list_widget_view_model.dart';
import 'package:provider/provider.dart';
import 'news_widget.dart';

class NewsListWidget extends StatefulWidget {
  final Sources source;
  const NewsListWidget(this.source, {super.key});

  @override
  State<NewsListWidget> createState() => _NewsListWidgetState();
}

class _NewsListWidgetState extends State<NewsListWidget> {
  var viewModel = NewsListViewModel();
  var provider = SearchProvider();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getNews(widget.source.id!, provider.searchedItem ?? "");
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SearchProvider>(context);

    provider.searchedItem ??= "";
    viewModel.getNews(widget.source.id!, provider.searchedItem ?? "");

    return ChangeNotifierProvider(
        create: (context) => viewModel,
        builder: (context, child) {
          return Consumer<NewsListViewModel>(
            builder: (context, viewModel, child) {
              if (viewModel.showLoading == true) {
                return const Expanded(
                    child: Center(child: CircularProgressIndicator()));
              } else if (viewModel.errorMessage != null) {
                return Column(
                  children: [
                    const SizedBox(height: 50),
                    Center(
                      child: Text(viewModel.errorMessage ??
                          "Connection is Lost please try again later"),
                    ),
                    const SizedBox(height: 50),
                    ElevatedButton(
                        onPressed: () {
                          viewModel.getNews(
                              widget.source.id!, provider.searchedItem ?? "");
                        },
                        child: const Text("Please try again"))
                  ],
                );
              }
              var newsList = viewModel.newsList ?? [];
              return Expanded(
                  child: ListView.builder(
                itemBuilder: (context, index) {
                  return NewsWidget(newsList[index], index);
                },
                itemCount: newsList.length,
              ));
            },
          );
        });
  }
}
