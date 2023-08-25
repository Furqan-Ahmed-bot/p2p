import 'package:get/get.dart';

import '../Models/UserModel.dart';

class UserController extends GetxController {
  static UserModel user = UserModel();

  // bool isLoding = false;

  // setLoading(bool val) {
  //   isLoding = val;
  //   update();
  // }

  User(UserModel data) {
    user = data;
    update();
  }
}
