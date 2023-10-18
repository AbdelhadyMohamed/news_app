import 'package:flutter/material.dart';

import 'category.dart';
import 'category_item.dart';

typedef OnCategoryClicked = Function(Category category);

class CategoriesWidget extends StatelessWidget {
  OnCategoryClicked onCategoryClicked;
  CategoriesWidget(this.onCategoryClicked, {super.key});
  List<Category> categoryList = Category.getAllCategories();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text('''Pick your category \nof interest''',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.only(top: 35),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 24, crossAxisSpacing: 20),
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      onCategoryClicked(categoryList[index]);
                    },
                    child: CategoryItem(categoryList[index], index));
              },
              itemCount: categoryList.length,
            ),
          ),
        ],
      ),
    );
  }
}
