import 'package:stacked/stacked.dart';
import 'package:zapatas/menuService.dart';

class MenuViewModel extends BaseViewModel {
  final MenuService _menuService = MenuService();
  List<MenuItem> menuItems;

  Future<void> getMenu() async {
    menuItems = await _menuService.getMenu();
    notifyListeners();
  }
}
