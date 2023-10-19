import 'package:flutter/material.dart';
import 'package:news_app/providers/my_provider.dart';
import 'package:news_app/providers/search_provider.dart';
import 'package:news_app/ui/home/home_layout.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        MultiProvider(providers: [
          ChangeNotifierProvider(create: (context) => MyProvider()),
          ChangeNotifierProvider(create: (context) => SearchProvider())
        ]),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SearchProvider>(context);
    provider.searchedItem ??= "";
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeLayout.routeName,
      routes: {HomeLayout.routeName: (context) => HomeLayout()},
    );
  }
}
