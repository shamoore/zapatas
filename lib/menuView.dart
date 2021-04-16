import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:zapatas/menuService.dart';
import 'package:zapatas/menuViewModel.dart';

import 'resources/strings.dart';

class MenuView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MenuViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.blueGrey,
        body: SingleChildScrollView(
          padding: EdgeInsets.all(100),
          child: Container(
            child: Column(
                children: model.menuItems != null
                    ? _buildMenuItems(model.menuItems)
                    : [
                        Text("no menu found"),
                        ElevatedButton(
                          onPressed: () => model.getMenu(),
                          child: Text('GetMenu'),
                        ),
                      ]),
          ),
        ),
      ),
      viewModelBuilder: () => MenuViewModel(),
    );
  }
}

List<Widget> _buildMenuItems(List<MenuItem> listOfItems) {
  List<Widget> menuItems = <Widget>[];
  for (var i = 0; i < listOfItems.length; i++) {
    var thisItem = listOfItems[i];
    var category = thisItem.category;
    var lastCategory = i != 0 ? listOfItems[i - 1].category : Strings.emptyString;

    if (category != lastCategory) {
      menuItems.add(
        Row(
          children: [Text(category)],
        ),
      );
    }

    menuItems.add(
      Row(
        children: [
          Text(thisItem.name),
          Text(thisItem.price.toString()),
        ],
      ),
    );
  }

  return menuItems;
}
