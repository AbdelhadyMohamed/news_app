import 'package:flutter/material.dart';

typedef OnMenuItemClick = void Function(MenuItem clickedItemPos);

class HomeDrawer extends StatelessWidget {
  OnMenuItemClick onMenuItemClick;
  HomeDrawer(this.onMenuItemClick, {super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.width * 0.167),
            decoration: const BoxDecoration(color: Colors.green),
            child: const Text(
              "News App",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: () {
              onMenuItemClick(MenuItem.categories);
              Navigator.pop(context);
            },
            child: const Row(
              children: [
                Icon(Icons.list, size: 32),
                SizedBox(width: 20),
                Text("Categories",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))
              ],
            ),
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: () {
              onMenuItemClick(MenuItem.settings);
              Navigator.pop(context);
            },
            child: const Row(
              children: [
                Icon(
                  Icons.settings,
                  size: 32,
                ),
                SizedBox(width: 20),
                Text(
                  "Settings",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

enum MenuItem { categories, settings }
