import 'package:flutter/material.dart';
import 'package:news_app/providers/my_provider.dart';
import 'package:news_app/shared/api_manager/api_manager.dart';
import 'package:news_app/ui/categories/categories_widget.dart';
import 'package:news_app/ui/categories/category.dart';
import 'package:news_app/ui/categories/category_details.dart';
import 'package:news_app/ui/home/home_drawer.dart';
import 'package:news_app/ui/settings/settings_widget.dart';
import 'package:provider/provider.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName = "HomeLayout";
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  void initState() {
    super.initState();
    selectedWidget = CategoriesWidget(onCategoryClicked);
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage("assets/images/pattern.png"),
              fit: BoxFit.cover)),
      child: Scaffold(
        drawer: HomeDrawer(onMenuItemClicked),
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          actions: [
            Container(
                margin: const EdgeInsets.only(right: 20),
                child: const Icon(Icons.search))
          ],
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(35),
          )),
          elevation: 4,
          backgroundColor: Colors.green,
          centerTitle: true,
          title: Container(
              padding: const EdgeInsets.only(right: 10),
              height: 38,
              child: SearchBar(
                onSubmitted: (value) {
                  provider.searchNews(value);
                  // setState(() {});
                },
              )),
        ),
        body: selectedWidget,

        // body:
      ),
    );
  }

  late Widget selectedWidget;

  void onMenuItemClicked(MenuItem item) {
    if (item == MenuItem.settings) {
      selectedWidget = const SettingsWidget();
    } else {
      selectedWidget = CategoriesWidget(onCategoryClicked);
    }
    setState(() {});
  }

  void onCategoryClicked(Category category) {
    selectedWidget = CategoryDetails(category);
    setState(() {});
  }
}
