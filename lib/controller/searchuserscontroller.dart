import 'package:p2ptraffic/export_all.dart';

class SearchUserController extends GetxController {
  bool isLoading = false;

  setLoading(bool val) {
    isLoading = val;
    update();
  }

  List Users = [];
  searchUser(data) {
    Users = data;
    print('User ${Users}');
  }
}
