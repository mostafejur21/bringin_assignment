import 'package:bringin_assesment/data/models/network_response.dart';
import 'package:bringin_assesment/data/models/users.dart';
import 'package:bringin_assesment/data/services/network_caller.dart';
import 'package:bringin_assesment/data/utils/urls.dart';
import 'package:get/get.dart';

class UsersController extends GetxController {
  bool isLoading = false;
  String message = '';
  List<UsersModel> usersList = <UsersModel>[];

  Future<void> getUsers() async {
    isLoading = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(
        Urls.usersUrl);
    isLoading = false;
    update();
    if(response.isSuccess){
      var map = response.responseJson as List<dynamic>;
      for(Map<String, dynamic> userMap in map){
        usersList.add(UsersModel.fromJson(userMap));
      }
    }else{
      message = "data get failed";
    }
  }
}