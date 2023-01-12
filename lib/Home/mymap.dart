import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class Mymap extends StatefulWidget {
  const Mymap({super.key});

  @override
  State<Mymap> createState() => _MymapState();
}

class _MymapState extends State<Mymap> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  final Completer<GoogleMapController> _mapcontroller = Completer();
  static const CameraPosition _center = CameraPosition(target: LatLng(40.721424, -73.873540), zoom: 15);
  final List<Marker> _marker = [];
  final List<Marker> _branch = const [
    Marker(
      markerId: MarkerId("1"),
      position: LatLng(40.721424, -73.873540),
      infoWindow: InfoWindow(title: "My Location110 W 3rd St, New York, NY 10012"),
    ),
    Marker(
      markerId: MarkerId("2"),
      position: LatLng(40.5721, 73.9793),
      infoWindow: InfoWindow(
        title: "testing 1",
        snippet: 'My Location\n110 W 3rd St, New York, NY 10012',
      ),
    ),
  ];
  @override
  void initState() {
// TODO: implement initState
    super.initState();
    _marker.addAll(_branch);
  }

  @override
  Widget build(BuildContext context) {
    final infoWindow = InfoWindow(
      title: 'My InfoWindow',
      snippet: 'This is my InfoWindow',
    );

// Add the InfoWindow to a list of InfoWindows
    final infoWindows = <InfoWindow>[infoWindow];

    _marker.addAll(_branch);
    return Scaffold(
      key: _key,
      backgroundColor: Colors.transparent,
      // extendBodyBehindAppBar: true,

      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: GoogleMap(
              compassEnabled: true,
              myLocationButtonEnabled: true,
              zoomGesturesEnabled: true,
              initialCameraPosition: _center,
              markers: Set<Marker>.of(_marker),
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
              child: Container(
            width: double.infinity,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    21.verticalSpace,
                    Row(
                      children: [
                        Container(
                          width: 328.w,
                          height: 50.h,
                          decoration: BoxDecoration(
                            // border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(25.r),
                            color: Colors.white,
                          ),
                          child: TextFormField(
                            style: TextStyle(
                              fontSize: 15.sp,
                              color: Colors.black,
                            ),
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              disabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(left: 25, top: 9),
                              // labelText: "Type a message",
                              hintText: "Search here",
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
                              labelStyle: TextStyle(
                                fontSize: 14.sp,
                                color: Color(0xffA7B1BF),
                                fontFamily: "Inter, Regular",
                              ),
                              prefixIcon: Container(
                                width: 50.w,
                                height: 30.h,
                                child: Row(
                                  children: [
                                    7.horizontalSpace,
                                    Container(
                                      width: 40.w,
                                      height: 40.h,
                                      // decoration: BoxDecoration(
                                      //   shape: BoxShape.circle,
                                      //   color: Color(0xff00DBFA),
                                      // ),
                                      child: Center(
                                        child: Image.asset(
                                          "assets/images/Icon feather-search.png",
                                          scale: 5,
                                          color: Color(0xffA7B1BF),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 50.w,
                          height: 50.h,
                          child: Image.asset("assets/images/Group 1383.png"),
                        ),
                      ],
                    ),
                    267.verticalSpace,
                    Container(
                      width: 124.w,
                      height: 64.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            10.verticalSpace,
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 6.w,
                                    height: 6.h,
                                    decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.red),
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
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  width: 15.w,
                                  height: 14.h,
                                  child: Image.asset("assets/images/Icon material-notifications-active.png"),
                                ),
                                Text(
                                  "(5) Updates",
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
                    296.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 50.w,
                          height: 50.h,
                          child: Image.asset("assets/images/Group 1384.png"),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ))
        ],
      ),
    
    
    );
  }
}
