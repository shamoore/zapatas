import 'dart:convert';

import 'package:flutter/services.dart';

class MenuService {
  final file = "assets/menu.json";

  Future<List<MenuItem>> getMenu() async {
    var _rawData = await rootBundle.loadString(file);

    var jsonList = json.decode(_rawData) as List;

    List<MenuItem> menuItems = jsonList.map((itemsJson) => MenuItem.from(itemsJson)).toList();

    return menuItems;
  }
}

class MenuItem {
  MenuItem(this.name, this.category, this.description, this.price);

  factory MenuItem.from(dynamic json) {
    return MenuItem(json['Item'] as String, json['Category'] as String, json['Description'] as String, json['Price'].toDouble());
  }

  String name;
  String description;
  String category;
  double price;
}
