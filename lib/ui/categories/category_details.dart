import 'package:flutter/material.dart';
import 'package:news_app/ui/categories/category.dart';
import 'package:news_app/ui/categories/category_details_view_model.dart';
import 'package:news_app/ui/categories/category_tab_screen.dart';
import 'package:provider/provider.dart';
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
  var viewModel = CategoryDetailsViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSources(widget.category.id);
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    provider.indicator ??= true;
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Column(
        children: [
          provider.indicator == true
              ? Consumer<CategoryDetailsViewModel>(
                  builder: (context, value, child) {
                    if (viewModel.showLoading == true) {
                      return const Expanded(
                          child: Center(child: CircularProgressIndicator()));
                    } else if (viewModel.errorMessage != null) {
                      return Column(
                        children: [
                          Center(
                            child: Text(viewModel.errorMessage ??
                                "Connection is Lost please try again later"),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                setState(() {});
                              },
                              child: const Text("Please try again"))
                        ],
                      );
                    }
                    return CategoryTabScreen(viewModel.sourcesList!, index);
                  },
                )
              : const ShowFullNewWidget()
        ],
      ),
    );
  }
}
