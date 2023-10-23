import 'package:bringin_assesment/data/models/comments_models.dart';
import 'package:bringin_assesment/data/models/network_response.dart';
import 'package:bringin_assesment/data/services/network_caller.dart';
import 'package:bringin_assesment/data/utils/urls.dart';
import 'package:get/get.dart';

class CommentsController extends GetxController {
  bool isLoading = false;
  List<CommentsModel> commentsList = [];
  String errorMessage = '';
  Future<void> getComments() async {
    isLoading = true;
    update();
    final NetworkResponse response =
        await NetworkCaller.getRequest(Urls.commentsUrl);
    isLoading = false;
    update();
    if (response.isSuccess) {
      var data = response.responseJson as List<dynamic>;
      commentsList.clear();
      for (Map<String, dynamic> commentsMap in data) {
        commentsList.add(CommentsModel.fromJson(commentsMap));
      }
    } else {
      errorMessage = 'Comments data fetch failed!';
    }
  }
}
