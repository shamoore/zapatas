import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_autolink_text/flutter_autolink_text.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zapatas/menuService.dart';
import 'package:zapatas/menuViewModel.dart';

import 'resources/strings.dart';
import 'resources/theme.dart';

class MenuView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MenuViewModel>.reactive(
        builder: (context, model, child) {
          model.getMenu();
          return Scaffold(
            backgroundColor: Colors.orangeAccent,
            body: SingleChildScrollView(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Container(
                child: Column(children: _getMenu(model.menu, context)),
              ),
            ),
          );
        },
        viewModelBuilder: () => MenuViewModel());
  }
}

List<Widget> _getMenu(List<MenuCategory> categories, BuildContext context) {
  List<Widget> menu = [];
  menu.addAll(_getHeader());
  menu.addAll(_getExpandables(categories, context));
  return menu;
}

List<Widget> _getExpandables(List<MenuCategory> categories, BuildContext context) {
  List<Widget> expandables = [];
  for (var i = 0; i < categories.length; i++) {
    var thisCategory = categories[i];

    ExpansionTile tile = ExpansionTile(
        title: Column(
          children: [
            Text(thisCategory.name, style: categoryTextStyle),
            thisCategory.description.isNotEmpty
                ? Text(
                    thisCategory.description,
                    style: categoryTextStyleSub,
                  )
                : SizedBox(
                    height: 1,
                  )
          ],
        ),
        initiallyExpanded: false,
        children: _categoryItems(thisCategory.items, context));
    expandables.add(tile);
  }
  return expandables;
}

List<Widget> _getHeader() {
  List<Widget> header = [];
  header.add(
    Image(
      image: AssetImage('assets/logo.png'),
    ),
  );
  header.add(
    AutolinkText(
      text: Strings.phone,
      textStyle: categoryTextStyleSub,
      linkStyle: categoryTextStyleLink,
      onPhoneTap: (link) => launch('tel://$link'),
    ),
  );
  header.add(
    Text(
      Strings.address,
      style: categoryTextStyleSub,
    ),
  );

  header.add(
    SizedBox(height: 50),
  );
  return header;
}

String getPrice(num price) {
  if (price != null && price != 0) {
    final currencyFormat = NumberFormat("#,##0.00", "en_US");
    return '\$${currencyFormat.format(price)}';
  } else
    return Strings.emptyString;
}

List<Widget> _categoryItems(List<MenuItem> menuItems, BuildContext context) {
  List<Widget> items = [];

  for (var j = 0; j < menuItems.length; j++) {
    var thisMenuItem = menuItems[j];
    items.add(Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(thisMenuItem.name, style: menuTextStyle),
        Text(
          getPrice(thisMenuItem.price),
          style: menuTextStyle,
        ),
      ],
    ));
    items.add(
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: thisMenuItem.description.length != null && thisMenuItem.description.length > 0
            ? [
                Expanded(
                  child: Text(
                    thisMenuItem.description,
                  ),
                ),
              ]
            : [],
      ),
    );
    items.add(
      dividerLine(),
    );
    items.add(
      SizedBox(height: 10),
    );
  }

  return items;
}

Widget dividerLine() => Container(
      height: 1,
      color: Colors.black12,
    );
