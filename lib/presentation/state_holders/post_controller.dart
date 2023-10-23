import 'package:bringin_assesment/data/models/network_response.dart';
import 'package:bringin_assesment/data/models/posts_models.dart';
import 'package:bringin_assesment/data/services/network_caller.dart';
import 'package:bringin_assesment/data/utils/urls.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class PostsController extends GetxController {
  bool _getPostsInProgress = false;
  String _errorMessage = '';
  final List<JsonPosts> _postsList = [];

  bool get getPostsInProgress => _getPostsInProgress;
  String get errorMessage => _errorMessage;
  List<JsonPosts> get postsList => _postsList;

  Future<void> getPostsList() async {
    _getPostsInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(Urls.postUrl);

    _getPostsInProgress = false;
    update();
    if (response.isSuccess) {
      var data = response.responseJson as List<dynamic>;
      _postsList.clear();
      for (Map<String, dynamic> postsMap in data) {
        _postsList.add(JsonPosts.fromJson(postsMap));
      }
    } else {
      _errorMessage = 'Posts data fetch failed!';
    }
  }
}