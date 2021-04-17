import 'package:stacked/stacked.dart';
import 'package:zapatas/menuService.dart';

class MenuViewModel extends BaseViewModel {
  final MenuService _menuService = MenuService();
  List<MenuCategory> menu;

  Future<void> getMenu() async {
    menu = await _menuService.getMenu();
    notifyListeners();
  }
}
