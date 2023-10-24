import 'package:bringin_assesment/application/state_bindings.dart';
import 'package:bringin_assesment/presentation/screen/main_bottom_nav_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.light(
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(
        useMaterial3: true,
      ),
      home: const BottomNavBarScreen(),
      initialBinding: StateHoldersBindings(),
    );
  }
}
