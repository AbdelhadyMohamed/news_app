import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/providers/search_provider.dart';
import 'package:news_app/ui/news/news_view_model.dart';
import 'package:provider/provider.dart';

import '../../data/models/SourcesResponse.dart';
import '../../providers/my_provider.dart';
import 'news_widget.dart';

class NewsListWidget extends StatefulWidget {
  final Sources source;
  NewsListWidget(this.source, {super.key});

  @override
  State<NewsListWidget> createState() => _NewsListWidgetState();
}

class _NewsListWidgetState extends State<NewsListWidget> {
  var viewModel = NewsViewModel();
  var provider = SearchProvider();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.loadNews(widget.source.id!, provider.searchedItem ?? "");
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SearchProvider>(context);
    provider.searchedItem ??= "";
    viewModel.loadNews(widget.source.id!, provider.searchedItem ?? "");
    return BlocBuilder<NewsViewModel, NewsListState>(
      bloc: viewModel,
      builder: (context, state) {
        switch (state) {
          case SuccessState():
            {
              var newsList = state.newsList ?? [];
              return Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return NewsWidget(newsList[index], index);
                  },
                  itemCount: newsList.length,
                ),
              );
            }
          case ErrorState():
            {
              return ChangeNotifierProvider(
                  create: (context) => MyProvider(),
                  builder: (context, child) {
                    return Column(
                      children: [
                        Center(
                          child: Text(state.message),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              viewModel.loadNews(widget.source.id!,
                                  provider.searchedItem ?? "");
                            },
                            child: const Text("Please try again"))
                      ],
                    );
                  });
            }
          // TODO: Handle this case.
          case LoadingState():
            {
              return const Expanded(
                  child: Center(child: CircularProgressIndicator()));
            }
          // TODO: Handle this case.
        }
      },
    );
  }
}
// FutureBuilder(
//   future: ApiManager.getInstance()
//       .getNews(source.id!, provider.searchedItem ?? ""),
//   builder: (context, snapshot) {
//     if (snapshot.connectionState == ConnectionState.waiting) {
//       return const Center(child: CircularProgressIndicator());
//     } else if (snapshot.hasError || snapshot.data?.status == "error") {
//       return ChangeNotifierProvider(
//           create: (context) => MyProvider(),
//           builder: (context, child) {
//             return Column(
//               children: [
//                 Center(
//                   child: Text(snapshot.data?.message ??
//                       snapshot.data!.status.toString()),
//                 ),
//                 ElevatedButton(
//                     onPressed: () {}, child: const Text("Please try again"))
//               ],
//             );
//           });
//     }
//
//     var news = snapshot.data?.articles ?? [];
//
//     return Expanded(
//       child: ListView.builder(
//         itemBuilder: (context, index) {
//           return NewsWidget(news[index], index);
//         },
//         itemCount: news.length,
//       ),
//     );
//   },
// );
