import 'package:bringin_assesment/data/models/comments_models.dart';
import 'package:bringin_assesment/presentation/state_holders/comments_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommentsScreen extends StatefulWidget {
  final int postId;
  const CommentsScreen({super.key, required this.postId});

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  List<CommentsModel> postComments = []; // List to hold comments

  @override
  void initState() {
    super.initState();

    postComments = getUserPostCommentsForPost(widget.postId);
  }

  List<CommentsModel> getUserPostCommentsForPost(int postId) {
    return Get.find<CommentsController>()
        .commentsList
        .where((comment) => comment.postId == postId)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Comments"),
        ),
        body: ListView.builder(
          itemCount: postComments.length,
          itemBuilder: (context, index) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "User: ${postComments[index].email ?? " "}",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Comments: ${postComments[index].body ?? " "}",
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
