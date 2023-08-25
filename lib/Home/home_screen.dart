import 'dart:async';

import 'package:geocoding/geocoding.dart';
import 'package:p2ptraffic/Home/trafficupdates.dart';

import '../controller/feedscontroller.dart';
import '../export_all.dart';
import 'searchLocationScreen.dart';

class HomeScreen extends StatefulWidget {
  final SearchedLat;
  final SearchedLong;
  HomeScreen({super.key, this.SearchedLat, this.SearchedLong});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> key = GlobalKey();
  final feedscontroller = Get.put(FeedsController());
  final Completer<GoogleMapController> _mapcontroller = Completer();
  static CameraPosition _center =
      CameraPosition(target: LatLng(latitude, longitude), zoom: 15);

  final List<Marker> _marker = [];

  List<Marker> _mybranch = [];
  List<Marker> _mybranch2 = [];
  List<Marker> mymarkers = [];
  Set<Marker> _testmarkers = {};
  LatLng? _selectedLatLng;
  List groupedData = [];

  List anotherdata = [];
  var grouped = {};
  var completeAddress;

  // final List<Marker> _branch = [
  //   Marker(
  //     markerId: MarkerId("1"),
  //     position: LatLng(latitude, longitude),

  //     // position: LatLng(40.721424, -73.873540),
  //     infoWindow:
  //         InfoWindow(title: "My Location110 W 3rd St, New York, NY 10012"),
  //   ),
  //   Marker(
  //     markerId: MarkerId("2"),
  //     position: LatLng(24.882437559674443, 67.08191164011063),
  //     infoWindow: InfoWindow(
  //       title: "testing 1",
  //       snippet: 'My Location\n110 W 3rd St, New York, NY 10012',
  //     ),
  //   ),
  //   Marker(
  //     markerId: MarkerId("3"),
  //     position: LatLng(24.88084135203814, 67.08148248669605),
  //     infoWindow: InfoWindow(
  //       title: "testing 1",
  //       snippet: 'My Location\n110 W 3rd St, New York, NY 10012',
  //     ),
  //   ),
  //   Marker(
  //     markerId: MarkerId("4"),
  //     position: LatLng(24.883511883354934, 67.07684359877905),
  //     infoWindow: InfoWindow(
  //       title: "testing 1",
  //       snippet: 'My Location\n110 W 3rd St, New York, NY 10012',
  //     ),
  //   ),
  //   Marker(
  //     markerId: MarkerId("5"),
  //     position: LatLng(24.883994904090244, 67.08350478772742),
  //     infoWindow: InfoWindow(
  //       title: "testing 1",
  //       snippet: 'My Location\n110 W 3rd St, New York, NY 10012',
  //     ),
  //   ),
  // ];
  getAddressFromLatLng(lat, long) async {
    dynamic longitudee = long;
    dynamic latitudee = lat;
    final placemarks = await placemarkFromCoordinates(latitudee, longitudee);
    if (placemarks.isNotEmpty) {
      final placemark = placemarks[0];
      completeAddress =
          '${placemark.street},${placemark.subLocality},${placemark.locality}';

      UserAddress = completeAddress;
      print('Location is ${UserAddress}');
      return completeAddress;
    }
    return "Unable to get address";
  }

  getmarkerts(context) {
    var data = {};
    bool _isFound = false;

    for (var i = 0; i < feedscontroller.Feeds.length; i++) {
      // double Key = feedscontroller.Feeds[i]['lat'];
      // for (var j = i + 1; j < feedscontroller.Feeds.length; j++) {
      //   if (feedscontroller.Feeds[i]['lat'] ==
      //       feedscontroller.Feeds[j]['lat']) {
      //     groupedData.add({
      //       'name': feedscontroller.Feeds[i]['user']['userName'],
      //       'caption': feedscontroller.Feeds[i]['caption'],
      //     });
      //     if (grouped[feedscontroller.Feeds[i]['lat']] != null) {
      //       grouped[feedscontroller.Feeds[i]['lat']].add({
      //         'name': feedscontroller.Feeds[i]['user']['userName'],
      //         'caption': feedscontroller.Feeds[i]['caption']
      //       });
      //     } else {
      //       grouped[feedscontroller.Feeds[i]['lat']] = [
      //         {
      //           'name': feedscontroller.Feeds[i]['user']['userName'],
      //           'caption': feedscontroller.Feeds[i]['caption']
      //         }
      //       ];
      //     }
      //   }
      // }

      if (grouped[feedscontroller.Feeds[i]['lat']] != null) {
        grouped[feedscontroller.Feeds[i]['lat']].add({
          "name": feedscontroller.Feeds[i]['user']['userName'],
          "caption": feedscontroller.Feeds[i]['caption'],
          'lat': feedscontroller.Feeds[i]['lat'],
          'long': feedscontroller.Feeds[i]['long'],
          'createdAt': feedscontroller.Feeds[i]['createdAt'],
        });
      } else {
        grouped[feedscontroller.Feeds[i]['lat']] = [
          {
            "name": feedscontroller.Feeds[i]['user']['userName'],
            "caption": feedscontroller.Feeds[i]['caption'],
            'lat': feedscontroller.Feeds[i]['lat'],
            'long': feedscontroller.Feeds[i]['long'],
            'createdAt': feedscontroller.Feeds[i]['createdAt'],
          }
        ];
      }

      _mybranch2.add(
        Marker(
          onTap: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () {
                        // groupedData.add(data = {
                        //   'Name': feedscontroller.Feeds[i]['user']['userName'],
                        //   'Caption': feedscontroller.Feeds[i]['caption']
                        // });
                        // print("grouped: ${grouped}");
                        // print(
                        //     'Munibs data ${grouped[feedscontroller.Feeds[i]['lat']]}');

                        Get.to(() => TrafficUpdateScreen(
                            userdata:
                                grouped[feedscontroller.Feeds[i]['lat']]));
                        // Get.toNamed("/TRAFFICUPDATESScreen");
                      },
                      child: Container(
                        width: 130.w,
                        height: 64.h,
                        padding: EdgeInsets.symmetric(horizontal: 10.r),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 6.w,
                                  height: 6.h,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.red),
                                ),
                                Text(
                                  "Traffic Notification",
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(
                                  "assets/images/Icon material-notifications-active.png",
                                  width: 17.r,
                                ),
                                4.horizontalSpace,
                                Text(
                                  "Updates",
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                });
          },
          markerId: MarkerId(i.toString()),
          position: LatLng(feedscontroller.Feeds[i]['lat'],
              feedscontroller.Feeds[i]['long']),

          // position: LatLng(40.721424, -73.873540),
        ),
      );
    }

    print('Markers are ${_mybranch2}');
    print('Markers are ${_mybranch2.length}');
    // print('Groups are ${grouped}');
    // print('GroupedData ${groupedData}');

    mymarkers = _mybranch2;
    print('My Markers Aree ${mymarkers}');
  }

  @override
  void initState() {
    ApiService().getfeeds();
    getAddressFromLatLng(latitude, longitude);

    // _marker.addAll(_branch);
    // print('Markers are  ${_marker}');

    super.initState();
  }

  @override
  void dispose() {
    groupedData.clear();
    print('Hellooooo');
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // setState(() {
    //   for (var i = 0; i < feedscontroller.Feeds.length; i++) {ch
    //     feedsLatLong.add(mydata = {
    //       'lat': feedscontroller.Feeds[i]['lat'],
    //       'long': feedscontroller.Feeds[i]['long'],
    //     });
    //   }
    //   print('MyFeeds ${feedsLatLong}');
    // });

// Add the InfoWindow to a list of InfoWindows

    return GetBuilder<FeedsController>(builder: (myfeedscontroller) {
      getmarkerts(context);
      return mymarkers.isEmpty
          ? Center(child: CircularProgressIndicator())
          : Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: GoogleMap(
                    onTap: (lat) {
                      setState(() {
                        _selectedLatLng = lat;
                        // mymarkers.add(
                        //   Marker(
                        //     markerId: MarkerId('selected_location'),
                        //     position: lat,
                        //   ),
                        // );
                      });

                      Get.to(SearchLocationScreen(
                        SearchedLat: _selectedLatLng!.latitude,
                        SearchedLong: _selectedLatLng!.longitude,
                      ));

                      print('Lat is ${_selectedLatLng!.latitude}');
                      print('Lat is ${_selectedLatLng!.longitude}');
                    },
                    compassEnabled: true,
                    myLocationEnabled: true,
                    myLocationButtonEnabled: true,
                    zoomGesturesEnabled: true,
                    initialCameraPosition: _center,
                    markers: Set<Marker>.of(mymarkers),
                    onMapCreated: (GoogleMapController controller) {
                      _mapcontroller.complete(controller);
                    },
                  ),
                ),

                // Container(
                //   width: double.infinity,
                //   child: SingleChildScrollView(
                //     child: Column(
                //       children: [],
                //     ),
                //   ),
                // ),
                Positioned(
                    child: Padding(
                  padding: EdgeInsets.all(20.r),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Material(
                          elevation: 10.0,
                          borderRadius: BorderRadius.circular(25.r),
                          shadowColor: Colors.black.withOpacity(0.3),
                          child: TextFormField(
                            style: TextStyle(
                              fontSize: 15.sp,
                              color: Colors.black,
                            ),
                            textAlignVertical: TextAlignVertical.center,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                isDense: true,
                                isCollapsed: true,
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding: EdgeInsets.zero,
                                hintText: "Search here",
                                hintStyle: TextStyle(color: Color(0xffA7B1BF)),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(25.r)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(25.r)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(25.r)),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(25.r)),
                                errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(25.r)),
                                labelStyle: TextStyle(
                                  fontSize: 14.sp,
                                  color: Color(0xffA7B1BF),
                                  fontFamily: "Inter, Regular",
                                ),
                                prefixIcon: Image.asset(
                                  "assets/images/Icon feather-search.png",
                                  scale: 5,
                                  color: Color(0xffA7B1BF),
                                ),
                                // prefix: Image.asset(
                                //   "assets/images/Icon feather-search.png",
                                //   scale: 5,
                                //   color: Color(0xffA7B1BF),
                                // ),
                                prefixIconConstraints: BoxConstraints(
                                  maxWidth: 50.r,
                                  minWidth: 50.r,
                                )),
                          ),
                        ),
                      ),
                      10.horizontalSpace,
                      GestureDetector(
                        onTap: () {
                          Get.toNamed('/SHARELIVELOCATIONsCREEN');
                        },
                        child: Container(
                          width: 50.r,
                          height: 50.r,
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(15.r),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    blurRadius: 2,
                                    spreadRadius: 0.3)
                              ]),
                          child: SvgPicture.asset(
                            '${imagePath}/Icon awesome-share.svg',
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
                // Align(
                //   alignment: Alignment.center,
                //   child: GestureDetector(
                //     onTap: () {
                //       Get.toNamed("/TRAFFICUPDATESScreen");
                //     },
                //     child: Container(
                //       width: 130.w,
                //       height: 64.h,
                //       padding: EdgeInsets.symmetric(horizontal: 10.r),
                //       decoration: BoxDecoration(
                //         color: Colors.white,
                //         borderRadius: BorderRadius.circular(10),
                //       ),
                //       child: Column(
                //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //         crossAxisAlignment: CrossAxisAlignment.center,
                //         children: [
                //           Row(
                //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //             children: [
                //               Container(
                //                 width: 6.w,
                //                 height: 6.h,
                //                 decoration: BoxDecoration(
                //                     shape: BoxShape.circle, color: Colors.red),
                //               ),
                //               Text(
                //                 "Traffic Notification",
                //                 style: TextStyle(
                //                   fontSize: 10.sp,
                //                   fontWeight: FontWeight.bold,
                //                 ),
                //               ),
                //             ],
                //           ),
                //           Row(
                //             mainAxisSize: MainAxisSize.min,
                //             children: [
                //               Image.asset(
                //                 "assets/images/Icon material-notifications-active.png",
                //                 width: 17.r,
                //               ),
                //               4.horizontalSpace,
                //               Text(
                //                 "(5) Updates",
                //                 style: TextStyle(
                //                   fontSize: 10.sp,
                //                   fontWeight: FontWeight.bold,
                //                 ),
                //               ),
                //             ],
                //           ),
                //         ],
                //       ),
                //     ),
                //   ),
                // )
              ],
            );
    });
  }
}
