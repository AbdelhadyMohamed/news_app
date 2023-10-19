import 'package:flutter/material.dart';
import 'package:news_app/ui/categories/category.dart';
import 'package:news_app/ui/categories/category_tab_screen.dart';
import 'package:provider/provider.dart';
import '../../providers/my_provider.dart';
import '../../shared/api_manager/api_manager.dart';
import '../widgets/show_full_news_widget.dart';

class CategoryDetails extends StatefulWidget {
  final Category category;
  const CategoryDetails(this.category, {super.key});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  int index = 0;

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
                  ? FutureBuilder(
                      future: ApiManager.getSources(widget.category.id),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (snapshot.hasError ||
                            snapshot.data?.status == "error") {
                          return Column(
                            children: [
                              Center(
                                child: Text(snapshot.data?.message ??
                                    snapshot.data?.status.toString() ??
                                    "something is missing"),
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    setState(() {});
                                  },
                                  child: const Text("Please try again"))
                            ],
                          );
                        }
                        var sources = snapshot.data?.sources ?? [];

                        return CategoryTabScreen(sources, index);
                      })
                  : const ShowFullNewWidget()
            ],
          );
        });

    //
  }
}
