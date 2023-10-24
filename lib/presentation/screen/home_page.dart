import 'package:bringin_assesment/presentation/screen/users_posts_screen.dart';
import 'package:bringin_assesment/presentation/state_holders/users_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Get.find<UsersController>().getUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomePage"),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.wb_sunny,
            ),
            onPressed: () {
              Get.isDarkMode
                  ? Get.changeThemeMode(ThemeMode.light)
                  : Get.changeThemeMode(ThemeMode.dark);
            },
          )
        ],
      ),
      body: GetBuilder<UsersController>(builder: (controller) {
        if (controller.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
          itemCount: controller.usersList.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Get.to(() => UsersPostsScreen(
                        userId: controller.usersList[index].id ?? 0));
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Name: ${controller.usersList[index].name ?? ""}",
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          )),
                      Text("Email: ${controller.usersList[index].email ?? ""}"),
                      Text(
                          "Company: ${controller.usersList[index].company?.name ?? ""}"),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
