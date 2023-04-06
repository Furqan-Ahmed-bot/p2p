import 'dart:async';
import '../export_all.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> key = GlobalKey();

  final Completer<GoogleMapController> _mapcontroller = Completer();
  static CameraPosition _center =
      CameraPosition(target: LatLng(latitude, longitude), zoom: 15);
  final List<Marker> _marker = [];
  final List<Marker> _branch = [
    Marker(
      markerId: MarkerId("1"),
      position: LatLng(latitude, longitude),

      // position: LatLng(40.721424, -73.873540),
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
    _marker.addAll(_branch);
    super.initState();
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
                        floatingLabelBehavior: FloatingLabelBehavior.never,
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
        Align(
          alignment: Alignment.center,
          child: GestureDetector(
            onTap: () {
              Get.toNamed("/TRAFFICUPDATESScreen");
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
