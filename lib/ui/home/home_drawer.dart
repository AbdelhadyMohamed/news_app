import 'package:easy_localization/easy_localization.dart';
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
            child: Text(
              "News App".tr(),
              style: const TextStyle(
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
            child: Row(
              children: [
                const Icon(Icons.list, size: 32),
                const SizedBox(width: 20),
                Text("Categories".tr(),
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold))
              ],
            ),
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: () {
              onMenuItemClick(MenuItem.settings);
              Navigator.pop(context);
            },
            child: Row(
              children: [
                const Icon(
                  Icons.settings,
                  size: 32,
                ),
                const SizedBox(width: 20),
                Text(
                  "Settings".tr(),
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
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
