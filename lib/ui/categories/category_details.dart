import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/ui/categories/categories_details_view_model.dart';
import 'package:news_app/ui/categories/category.dart';
import 'package:news_app/ui/categories/category_tab_screen.dart';
import 'package:provider/provider.dart';
import '../../DI/di.dart';
import '../../providers/my_provider.dart';
import '../news/show_full_news_widget.dart';

class CategoryDetails extends StatefulWidget {
  final Category category;
  const CategoryDetails(this.category, {super.key});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  int index = 0;
  var viewModel = getIt.get<CategoryDetailsViewModel>(); //field injection
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.loadSources(widget.category.id);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (BuildContext context) => MyProvider(),
        builder: (context, child) {
          var provider = Provider.of<MyProvider>(context);
          provider.indicator ??= true;
          return Column(
            children: [
              provider.indicator == true
                  ? BlocBuilder<CategoryDetailsViewModel, CategoryDetailsState>(
                      bloc: viewModel,
                      builder: (context, state) {
                        switch (state) {
                          case SuccessState():
                            {
                              //implicit casting
                              var sources = state.sourcesList ?? [];
                              return CategoryTabScreen(sources);
                            }
                          case LoadingState():
                            {
                              //implicit casting
                              return Expanded(
                                child: Center(
                                  child: Column(
                                    children: [
                                      Text(state.message),
                                      const CircularProgressIndicator(),
                                    ],
                                  ),
                                ),
                              );
                            }
                          case ErrorState():
                            {
                              return Column(
                                children: [
                                  Center(
                                    child: Text(state.message),
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        viewModel
                                            .loadSources(widget.category.id);
                                      },
                                      child: const Text("Please try again"))
                                ],
                              );
                            }
                        }
                      },
                    )
                  : const ShowFullNewWidget()
            ],
          );
        });

    //
  }
}
// FutureBuilder(
// future: ApiManager.getInstance()
//     .getSources(widget.category.id),
// builder: (context, snapshot) {
// if (snapshot.connectionState ==
// ConnectionState.waiting) {
// return const Center(
// child: CircularProgressIndicator());
// } else if (snapshot.hasError ||
// snapshot.data?.status == "error") {
// return Column(
// children: [
// Center(
// child: Text(snapshot.data?.message ??
// snapshot.data?.status.toString() ??
// "Connection is Lost please try again later"),
// ),
// ElevatedButton(
// onPressed: () {
// setState(() {});
// },
// child: const Text("Please try again"))
// ],
// );
// }
// var sources = snapshot.data?.sources ?? [];
//
// return CategoryTabScreen(sources);
// })
