import 'package:p2ptraffic/export_all.dart';

class UploadTrafficeImages extends GetxController {
  List<String> trafficImages = [...trafficPictureImages];

  addImage(String imagePath) {
    trafficImages.add(imagePath);
    update();
  }

  removeImage(index) {
    trafficImages.removeAt(index);
    update();
  }
}
