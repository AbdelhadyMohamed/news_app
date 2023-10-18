import 'package:flutter/material.dart';
import 'package:news_app/ui/categories/categories_widget.dart';
import 'package:news_app/ui/categories/category.dart';
import 'package:news_app/ui/categories/category_details.dart';
import 'package:news_app/ui/home/home_drawer.dart';
import 'package:news_app/ui/settings/settings_widget.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName = "HomeLayout";
  HomeLayout({super.key});

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
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(35),
          )),
          elevation: 4,
          backgroundColor: Colors.green,
          centerTitle: true,
          title: Text("News App"),
        ),
        body: selectedWidget,

        // body:
      ),
    );
  }

  late Widget selectedWidget;

  void onMenuItemClicked(MenuItem item) {
    if (item == MenuItem.settings) {
      selectedWidget = SettingsWidget();
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
