import 'dart:convert';

import 'package:flutter/services.dart';

class MenuService {
  final file = "assets/menu.json";

  Future<List<MenuCategory>> getMenu() async {
    var _rawData = await rootBundle.loadString(file);

    var jsonList = json.decode(_rawData);
    var menu = jsonList["menu"] as List;

    List<MenuCategory> menuCategories = menu.map<MenuCategory>((categoryJson) => MenuCategory.from(categoryJson)).toList();
    return menuCategories;
  }
}

class ZapatasMenuItem {
  ZapatasMenuItem(this.name, this.description, this.price, this.multiPrice);

  factory ZapatasMenuItem.from(dynamic json) {
    return ZapatasMenuItem(json['Item'] as String, json['Description'] as String, json['Price'] as num, json['Multi Pricing'] as String);
  }

  String name;
  String description;
  num price;
  String multiPrice;
}

class MenuCategory {
  String name;
  String description;
  List<ZapatasMenuItem> items;

  MenuCategory(this.name, this.description, this.items);

  factory MenuCategory.from(dynamic json) {
    return MenuCategory(json['Category'] as String, json['Description'] as String, convertItems(json['Items'] as List));
  }
}

List<ZapatasMenuItem> convertItems(List<dynamic> jsonItems) {
  return jsonItems.map<ZapatasMenuItem>((item) => ZapatasMenuItem.from(item)).toList();
}
