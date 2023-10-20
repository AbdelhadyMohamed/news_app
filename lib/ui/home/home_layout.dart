import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news_app/providers/search_provider.dart';
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

  bool searchSelected = false;
  Widget build(BuildContext context) {
    var provider = Provider.of<SearchProvider>(context);
    late var searchController = TextEditingController();
    searchController.text = provider.searchedItem ?? "";

    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage("assets/images/pattern.png"),
              fit: BoxFit.cover)),
      child: WillPopScope(
        onWillPop: () {
          if (selectedWidget is CategoriesWidget) {
            return Future.value(true);
          } else if (selectedWidget is CategoryDetails) {
            selectedWidget = CategoriesWidget(onCategoryClicked);
            setState(() {});
            return Future.value(false);
          }
          return Future.value(true);
        },
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
            title: searchSelected
                ? Container(
                    padding: const EdgeInsets.only(right: 10),
                    height: 38,
                    child: SearchBar(
                      onSubmitted: (value) {
                        provider.searchNews(value);
                      },
                      // hintText: "search",
                      leading: const Icon(Icons.search, color: Colors.black),
                      trailing: [
                        Tooltip(
                          message: 'Change brightness mode',
                          child: IconButton(
                            onPressed: () {
                              if (provider.searchedItem != "") {
                                provider.searchNews("");
                              }
                            },
                            icon: InkWell(
                                onTap: () {
                                  provider.searchNews("");
                                  searchSelected = false;
                                  setState(() {});
                                },
                                child: const Icon(Icons.cancel,
                                    color: Colors.black)),
                            selectedIcon: const Icon(
                                Icons.brightness_2_outlined,
                                color: Colors.black),
                          ),
                        )
                      ],
                      controller: searchController,
                    ))
                : Row(
                    children: [
                      Text("News App".tr()),
                      const Spacer(),
                      InkWell(
                          onTap: () {
                            searchSelected = true;
                            setState(() {});
                          },
                          child: const Icon(Icons.search))
                    ],
                  ),
          ),
          body: selectedWidget,

          // body:
        ),
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
