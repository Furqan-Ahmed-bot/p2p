import 'package:p2ptraffic/export_all.dart';

class FeedsController extends GetxController {
  bool isLoading = false;
  BuildContext? contexty;

  setLoading(bool val) {
    isLoading = val;
    update();
  }

  List Feeds = [];

  getFeeds(data) {
    Feeds = data;
    print('MyFeeds ${Feeds}');
    // getmarkerts(context);
  }

  List<Marker> marker = [];
  List<Marker> mybranch = [];

  // getmarkerts(context) {
  //   for (var i = 0; i < Feeds.length; i++) {
  //     mybranch.add(
  //       Marker(
  //         onTap: () {
  //           showDialog(
  //               context: context,
  //               builder: (BuildContext context) {
  //                 return AlertDialog(
  //                   actions: [
  //                     Container(
  //                       height: 50,
  //                       width: 50,
  //                       color: Colors.blue,
  //                     )
  //                   ],
  //                 );
  //               });
  //         },
  //         markerId: MarkerId(i.toString()),
  //         position: LatLng(
  //           Feeds[i]['long'],
  //           Feeds[i]['lat'],
  //         ),

  //         // position: LatLng(40.721424, -73.873540),
  //         infoWindow:
  //             InfoWindow(title: "My Location110 W 3rd St, New York, NY 10012"),
  //       ),
  //     );
  //   }
  //   print('Markers are ${mybranch}');
  //   marker = mybranch;

  //   print('mymarkersa ${marker}');
  // }
}
