import 'package:flutter/material.dart';

class Category {
  String id;
  String title;
  Color color;
  String imageName;

  Category(this.id, this.title, this.color, this.imageName);
  static List<Category> getAllCategories() {
    return [
      Category("sports", "Sports", const Color(0XFFC91C22),
          "assets/images/sports.png"),
      Category("general", "General", const Color(0XFF003E90),
          "assets/images/general.png"),
      Category("health", "Health", const Color(0XFFED1E79),
          "assets/images/health.png"),
      Category("business", "Business", const Color(0XFFCF7E48),
          "assets/images/business.png"),
      Category("technology", "technology", const Color(0XFF4882CF),
          "assets/images/tech.png"),
      Category("science", "Science", const Color(0XFFF2D352),
          "assets/images/science.png"),
    ];
  }
}
