import 'package:bringin_assesment/presentation/screen/home_page.dart';
import 'package:bringin_assesment/presentation/screen/search_screen.dart';
import 'package:bringin_assesment/presentation/state_holders/comments_controller.dart';
import 'package:bringin_assesment/presentation/state_holders/main_bottom_navbar_controller.dart';
import 'package:bringin_assesment/presentation/state_holders/post_controller.dart';
import 'package:bringin_assesment/presentation/state_holders/users_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  final List<Widget> screens = [
    const HomePage(),
    const SearchScreen(),
  ];
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<UsersController>().getUsers();
      Get.find<PostsController>().getPostsList();
      Get.find<CommentsController>().getComments();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainBottomNavController>(builder: (controller) {
      return Scaffold(
        body: screens[controller.currentSelectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.currentSelectedIndex,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.blueAccent,
          showSelectedLabels: true,
          type: BottomNavigationBarType.fixed,
          elevation: 4,
          onTap: controller.onChanged,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.search), label: "Search"),
          ],
        ),
      );
    });
  }
}
