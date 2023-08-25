import 'package:p2ptraffic/export_all.dart';

class MyFeedsController extends GetxController {
  bool isLoading = false;
  BuildContext? contexty;

  setLoading(bool val) {
    isLoading = val;
    update();
  }

  List MyFeeds = [];

  getmyFeeds(data) {
    MyFeeds = data;
    print('MyFeeds ${MyFeeds}');
  }
}
