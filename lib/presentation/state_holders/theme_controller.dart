import 'package:flutter/material.dart';
import 'package:get/get.dart';

// class ThemeModeController extends GetxController {
//   final box = GetStorage();
//   Rx<ThemeMode> themeMode = ThemeMode.light.obs;

//   @override
//   void onInit() {
//     super.onInit();
//     loadThemeMode();
//   }

//   void toggleThemeMode() {
//     themeMode.value = themeMode.value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
//     _saveThemeMode(themeMode.value);
//     update();
//   }

//   void _saveThemeMode(ThemeMode mode) {
//     box.write('themeMode', mode.toString());
//     update();
//   }

//   void loadThemeMode() {
//     final storedMode = box.read('themeMode');
//     if (storedMode != null) {
//       themeMode.value = ThemeMode.values.firstWhere((element) => element.toString() == storedMode);
//     }
//     update();
//   }
// }

class ThemeModeController extends GetxController{
  bool isDark = true;
  final switcherController = ValueNotifier<bool>(false);

  themeMode(){
    return isDark ? ThemeMode.dark : ThemeMode.light;
  }
  lightTheme() {
    isDark = false;
    ThemeMode.light;
    update();
  }

  darkTheme() {
    isDark = true;
    ThemeMode.dark;
    update();
  }

  @override
  void onInit() {
    switcherController.addListener(() {
      if (switcherController.value) {
        lightTheme();
      } else {
        darkTheme();
      }
    });
    super.onInit();
  }

}