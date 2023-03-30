import 'dart:async';
import '../export_all.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  final Completer<GoogleMapController> _mapcontroller = Completer();
  static const CameraPosition _center =
      CameraPosition(target: LatLng(40.721424, -73.873540), zoom: 15);
  final List<Marker> _marker = [];
  final List<Marker> _branch = const [
    Marker(
      markerId: MarkerId("1"),
      position: LatLng(40.721424, -73.873540),
      infoWindow:
          InfoWindow(title: "My Location110 W 3rd St, New York, NY 10012"),
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
// Add the InfoWindow to a list of InfoWindows

    _marker.addAll(_branch);
    return Stack(
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
            child: ListView(
          padding: EdgeInsets.all(20.r),
          children: [
            // 21.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                GestureDetector(
                  onTap: () {
                    Get.toNamed('/SHARELIVELOCATIONsCREEN');
                  },
                  child: Container(
                    width: 50.r,
                    height: 50.r,
                    alignment: Alignment.center,
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
                      '${imagePath}/Group 1383.svg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            // 267.verticalSpace,

            // 296.verticalSpace,
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
            //     Container(
            //       width: 50.w,
            //       height: 50.h,
            //       child: Image.asset("assets/images/Group 1384.png"),
            //     )
            //   ],
            // )
          ],
        )),
        Align(
          alignment: Alignment.center,
          child: GestureDetector(
            onTap: () {
              Get.toNamed("/TRAFFICUPDATESScreen");
            },
            child: Container(
              width: 124.w,
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
                            shape: BoxShape.circle, color: Colors.red),
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
        )
      ],
    );
  }
}
