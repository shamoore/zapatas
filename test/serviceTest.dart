import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zapatas/menuService.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MenuService service = MenuService();
  test('Csv is loaded with data', () async {
    final file = "assets/menu.json";
  });
}
