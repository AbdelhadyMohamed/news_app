import 'package:flutter/material.dart';
import 'package:news_app/ui/categories/category.dart';
import 'package:news_app/ui/categories/category_tab_screen.dart';

import '../../shared/api_manager/api_manager.dart';

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
    return Column(
      children: [
        FutureBuilder(
            future: ApiManager.getSources(widget.category.id),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
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
            }),
      ],
    );

    //
  }
}
