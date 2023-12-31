import 'package:bringin_assesment/data/models/posts_models.dart';
import 'package:bringin_assesment/presentation/screen/user_comments_screen.dart';
import 'package:bringin_assesment/presentation/state_holders/post_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UsersPostsScreen extends StatefulWidget {
  final int userId;

  const UsersPostsScreen({super.key, required this.userId});

  @override
  State<UsersPostsScreen> createState() => _UsersPostsScreenState();
}

class _UsersPostsScreenState extends State<UsersPostsScreen> {
  List<JsonPosts> userPosts = [];

  @override
  void initState() {
    super.initState();
    userPosts = getUsersPostsForUser(widget.userId);
  }

  List<JsonPosts> getUsersPostsForUser(int userId) {
    return Get.find<PostsController>()
        .postsList
        .where((post) => post.userId == userId)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Posts"),
      ),
      body: GetBuilder<PostsController>(builder: (controller) {
        if (controller.getPostsInProgress) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
          itemCount: userPosts.length,
          // Use the actual number of user posts
          itemBuilder: (context, index) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Title: ${userPosts[index].title ?? " "}",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Get.to(() => CommentsScreen(
                                postId: userPosts[index].id ?? 0));
                          },
                          child: const Text("View Comments"),
                        )
                      ],
                    ),
                    Text(
                      "Post: ${userPosts[index].body ?? " "}",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
