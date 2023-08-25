import 'dart:async';

import 'package:flutter/scheduler.dart';
import 'package:p2ptraffic/Home/trafficupdates.dart';

import '../controller/feedscontroller.dart';
import '../export_all.dart';

class SearchLocationScreen extends StatefulWidget {
  final SearchedLat;
  final SearchedLong;
  SearchLocationScreen({super.key, this.SearchedLat, this.SearchedLong});

  @override
  State<SearchLocationScreen> createState() => _SearchLocationScreenState();
}

class _SearchLocationScreenState extends State<SearchLocationScreen> {
  final GlobalKey<ScaffoldState> key = GlobalKey();
  final feedscontroller = Get.put(FeedsController());
  final Completer<GoogleMapController> _mapcontroller = Completer();
  static CameraPosition? _center;

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

    print('Searched Markers are ${_mybranch2}');
    print('Searched Markers are ${_mybranch2.length}');
    // print('Groups are ${grouped}');
    // print('GroupedData ${groupedData}');

    mymarkers = _mybranch2;
    print('My Markers Aree ${mymarkers}');
  }

  @override
  void initState() {
    feedscontroller.Feeds.clear();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      ApiService().getfeeds(
          searchedLat: widget.SearchedLat, searchedLong: widget.SearchedLong);

      print("SchedulerBinding");
    });

    _mybranch2.insert(
        0,
        Marker(
            markerId: MarkerId('currentLocation'),
            position: LatLng(widget.SearchedLat, widget.SearchedLong)));

    super.initState();
  }

  @override
  void dispose() {
    groupedData.clear();
    print('Hellooooo');

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FeedsController>(builder: (myfeedscontroller) {
      getmarkerts(context);
      return Scaffold(
        appBar: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(18),
            ),
          ),
          elevation: 0,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color(0xff004DF2),
                  Color(0xff1CC8FB),
                ],
              ),
              // backgroundBlendMode: BlendMode.colorBurn,
            ),
          ),
          title: Text(
            "Searchecd Location",
            style: TextStyle(fontSize: 16.sp),
          ),
          centerTitle: true,
        ),
        body: mymarkers.isEmpty
            ? Center(child: CircularProgressIndicator())
            : Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: GoogleMap(
                      // onTap: (lat) {
                      //   setState(() {
                      //     _selectedLatLng = lat;
                      //     mymarkers.add(
                      //       Marker(
                      //         markerId: MarkerId('selected_location'),
                      //         position: lat,
                      //       ),
                      //     );
                      //   });

                      //   print('Lat is ${_selectedLatLng!.latitude}');
                      //   print('Lat is ${_selectedLatLng!.longitude}');
                      // },

                      compassEnabled: true,

                      zoomGesturesEnabled: true,
                      initialCameraPosition: CameraPosition(
                          target:
                              LatLng(widget.SearchedLat, widget.SearchedLong),
                          zoom: 15),
                      markers: Set<Marker>.of(mymarkers),

                      //     {
                      //   Marker(
                      //       markerId: MarkerId('currentLocation'),
                      //       position:
                      //           LatLng(widget.SearchedLat, widget.SearchedLong))
                      // },
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
                  // Positioned(
                  //     child: Padding(
                  //   padding: EdgeInsets.all(20.r),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Expanded(
                  //         child: Material(
                  //           elevation: 10.0,
                  //           borderRadius: BorderRadius.circular(25.r),
                  //           shadowColor: Colors.black.withOpacity(0.3),
                  //           child: TextFormField(
                  //             style: TextStyle(
                  //               fontSize: 15.sp,
                  //               color: Colors.black,
                  //             ),
                  //             textAlignVertical: TextAlignVertical.center,
                  //             keyboardType: TextInputType.text,
                  //             decoration: InputDecoration(
                  //                 isDense: true,
                  //                 isCollapsed: true,
                  //                 filled: true,
                  //                 fillColor: Colors.white,
                  //                 contentPadding: EdgeInsets.zero,
                  //                 hintText: "Search here",
                  //                 hintStyle:
                  //                     TextStyle(color: Color(0xffA7B1BF)),
                  //                 floatingLabelBehavior:
                  //                     FloatingLabelBehavior.never,
                  //                 border: OutlineInputBorder(
                  //                     borderSide: BorderSide.none,
                  //                     borderRadius:
                  //                         BorderRadius.circular(25.r)),
                  //                 enabledBorder: OutlineInputBorder(
                  //                     borderSide: BorderSide.none,
                  //                     borderRadius:
                  //                         BorderRadius.circular(25.r)),
                  //                 focusedBorder: OutlineInputBorder(
                  //                     borderSide: BorderSide.none,
                  //                     borderRadius:
                  //                         BorderRadius.circular(25.r)),
                  //                 focusedErrorBorder: OutlineInputBorder(
                  //                     borderSide: BorderSide.none,
                  //                     borderRadius:
                  //                         BorderRadius.circular(25.r)),
                  //                 errorBorder: OutlineInputBorder(
                  //                     borderSide: BorderSide.none,
                  //                     borderRadius:
                  //                         BorderRadius.circular(25.r)),
                  //                 labelStyle: TextStyle(
                  //                   fontSize: 14.sp,
                  //                   color: Color(0xffA7B1BF),
                  //                   fontFamily: "Inter, Regular",
                  //                 ),
                  //                 prefixIcon: Image.asset(
                  //                   "assets/images/Icon feather-search.png",
                  //                   scale: 5,
                  //                   color: Color(0xffA7B1BF),
                  //                 ),
                  //                 prefixIconConstraints: BoxConstraints(
                  //                   maxWidth: 50.r,
                  //                   minWidth: 50.r,
                  //                 )),
                  //           ),
                  //         ),
                  //       ),
                  //       10.horizontalSpace,
                  //       GestureDetector(
                  //         onTap: () {
                  //           Get.toNamed('/SHARELIVELOCATIONsCREEN');
                  //         },
                  //         child: Container(
                  //           width: 50.r,
                  //           height: 50.r,
                  //           alignment: Alignment.center,
                  //           padding: EdgeInsets.all(15.r),
                  //           decoration: BoxDecoration(
                  //               shape: BoxShape.circle,
                  //               color: Colors.white,
                  //               boxShadow: [
                  //                 BoxShadow(
                  //                     color: Colors.black.withOpacity(0.3),
                  //                     blurRadius: 2,
                  //                     spreadRadius: 0.3)
                  //               ]),
                  //           child: SvgPicture.asset(
                  //             '${imagePath}/Icon awesome-share.svg',
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // )),
                ],
              ),
      );
    });
  }
}
