import 'package:flutter/foundation.dart';
import 'package:flutter_clok/enums.dart';

class MenuInfo extends ChangeNotifier {
  MenuType menuType;
  String title;
  String imageSource;

  MenuInfo(this.menuType, {required this.title, required this.imageSource});
  updateMenu(MenuInfo menuInfo) async {
    menuType = menuInfo.menuType;
    title = menuInfo.title;
    imageSource = menuInfo.imageSource;

    notifyListeners();
  }
}
