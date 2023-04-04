import 'dart:async';
import 'package:p2ptraffic/export_all.dart';

class MartinProfileScreen extends StatefulWidget {
  const MartinProfileScreen({super.key});

  @override
  State<MartinProfileScreen> createState() => _MartinProfileScreenState();
}

class _MartinProfileScreenState extends State<MartinProfileScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  bool _value = false;
  bool _value1 = false;
  bool _value2 = false;
  bool _value3 = false;

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
    _marker.addAll(_branch);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,

      backgroundColor: Colors.white,
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "PROFILE",
          style: TextStyle(fontSize: 16.sp),
        ),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(18),
          ),
        ),
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Container(
              child: Image.asset(
            "assets/images/Icon ionic-ios-arrow-round-back.png",
            scale: 4,
          )),
        ),
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
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.symmetric(horizontal: 10),
        //     child: Row(
        //       children: [
        //         Container(
        //           child: Image.asset(
        //             "assets/images/Icon feather-search.png",
        //             scale: 4,
        //           ),
        //         ),
        //         8.horizontalSpace,
        //         Container(
        //           child: Image.asset(
        //             "assets/images/Group 1377.png",
        //             scale: 4,
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ],
      ),
      body: DisAllowIndicatorWidget(
        // width: double.infinity,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20.r, vertical: 20.r),
          children: [
            Container(
              width: 388.w,
              padding: EdgeInsets.all(10.r),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 85.w,
                        height: 85.h,
                        child: Image.asset("assets/images/4.png"),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Martin Smith",
                                style: TextStyle(
                                    color: Color(0xff3A3A3A), fontSize: 20.sp),
                              ),
                              79.horizontalSpace,
                              Text(
                                "Friend",
                                style: TextStyle(
                                    color: Color(0xff878B9E), fontSize: 12.sp),
                              ),
                            ],
                          ),
                          Text(
                            "22 - Female",
                            style: TextStyle(
                                color: Color(0xff3A3A3A), fontSize: 16.sp),
                          ),
                          Text(
                            "New York",
                            style: TextStyle(
                                color: Color(0xff3A3A3A), fontSize: 16.sp),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            22.verticalSpace,
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.7,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: 388.w,
                      height: 392,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),

                              spreadRadius: 5,

                              blurRadius: 7,

                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          20.verticalSpace,
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 47.w,
                                  height: 47.h,
                                  child: Image.asset("assets/images/4.png"),
                                ),
                                5.horizontalSpace,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Martin Smith",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.sp),
                                    ),
                                    Text(
                                      "50min ago",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 12.sp),
                                    ),
                                    15.verticalSpace,
                                    Text(
                                      "Lorem ipsum dolor sit amet.",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 14.sp),
                                    ),
                                  ],
                                ),
                                DropdownButton<String>(
                                  dropdownColor: Color(0xffDFE1EC),
                                  menuMaxHeight: 120.h,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(
                                      10,
                                    ),
                                    topLeft: Radius.circular(
                                      10,
                                    ),
                                    bottomRight: Radius.circular(
                                      10,
                                    ),
                                  ),
                                  onTap: () {},
                                  underline: Container(),
                                  items: <String>['Report', 'Block']
                                      .map((String value) {
                                    return DropdownMenuItem<String>(
                                      // alignment: AlignmentDirectional.Cen,
                                      onTap: () {},
                                      value: value,
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 13.w,
                                            height: 13.h,
                                            child: Image.asset(value == 'Report'
                                                ? "assets/images/Icon material-report.png"
                                                : "assets/images/Icon metro-blocked.png"),
                                          ),
                                          8.horizontalSpace,
                                          Text(
                                            value,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14.sp),
                                          ),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    print("value is : " + value.toString());
                                    if (value.toString() == "Report") {
                                      Report();
                                    } else {
                                      Block();
                                    }
                                  },
                                  icon: Padding(
                                    padding: const EdgeInsets.only(bottom: 30),
                                    child: Icon(
                                      Icons.more_vert,
                                      size: 25,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          30.verticalSpace,
                          Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Row(
                                  children: [
                                    Container(
                                      child: Image.asset(
                                        "assets/images/Icon material-location-on.png",
                                        scale: 5,
                                      ),
                                    ),
                                    10.horizontalSpace,
                                    Container(
                                      child: Text(
                                        "Lorem ipsum dolor sit amet.",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 14.sp),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              10.verticalSpace,
                              GestureDetector(
                                // onTap: () {

                                //   Get.toNamed("/FeedUPDATESDETAILSScreen");

                                // },

                                child: Container(
                                  child: Image.asset(
                                    "assets/images/Rectangle 1339.png",
                                    scale: 1,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    15.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              child: Icon(
                                Icons.thumb_up,
                                color: Color(0xff21CDFB),
                              ),
                            ),
                            7.horizontalSpace,
                            Container(
                              child: Text(
                                "Like",
                                style: TextStyle(fontSize: 14.sp),
                              ),
                            )
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed("/FeedUPDATESDETAILSScreen");
                          },
                          child: Row(
                            children: [
                              Container(
                                  child: Image.asset(
                                "assets/images/Icon awesome-comment-dots.png",
                                scale: 5,
                              )),
                              7.horizontalSpace,
                              Container(
                                child: Text(
                                  "326 Comments",
                                  style: TextStyle(fontSize: 14.sp),
                                ),
                              )
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Share();
                          },
                          child: Row(
                            children: [
                              Container(
                                  child: Image.asset(
                                "assets/images/Icon awesome-share.png",
                                scale: 5,
                              )),
                              7.horizontalSpace,
                              Container(
                                child: Text(
                                  "Share",
                                  style: TextStyle(fontSize: 14.sp),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    15.verticalSpace,
                    Dividerr(),
                    20.verticalSpace,
                    Column(
                      children: [
                        20.verticalSpace,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            20.verticalSpace,
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 47.w,
                                    height: 47.h,
                                    child: Image.asset("assets/images/4.png"),
                                  ),
                                  5.horizontalSpace,
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Martin Smith",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.sp),
                                      ),
                                      Text(
                                        "50min ago",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 12.sp),
                                      ),
                                      15.verticalSpace,
                                      Text(
                                        "Lorem ipsum dolor sit amet.",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 14.sp),
                                      ),
                                    ],
                                  ),
                                  DropdownButton<String>(
                                    dropdownColor: Color(0xffDFE1EC),
                                    menuMaxHeight: 120.h,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(
                                        10,
                                      ),
                                      topLeft: Radius.circular(
                                        10,
                                      ),
                                      bottomRight: Radius.circular(
                                        10,
                                      ),
                                    ),
                                    onTap: () {},
                                    underline: Container(),
                                    items: <String>['Report', 'Block']
                                        .map((String value) {
                                      return DropdownMenuItem<String>(
                                        // alignment: AlignmentDirectional.Cen,
                                        onTap: () {},
                                        value: value,
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 13.w,
                                              height: 13.h,
                                              child: Image.asset(value ==
                                                      'Report'
                                                  ? "assets/images/Icon material-report.png"
                                                  : "assets/images/Icon metro-blocked.png"),
                                            ),
                                            8.horizontalSpace,
                                            Text(
                                              value,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14.sp),
                                            ),
                                          ],
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      print("value is : " + value.toString());
                                      if (value.toString() == "Report") {
                                        Report();
                                      } else {
                                        Block();
                                      }
                                    },
                                    icon: Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 30),
                                      child: Icon(
                                        Icons.more_vert,
                                        size: 25,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            30.verticalSpace,
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Row(
                                  children: [
                                    Container(
                                      child: Image.asset(
                                        "assets/images/Icon material-location-on.png",
                                        scale: 5,
                                      ),
                                    ),
                                    10.horizontalSpace,
                                    Container(
                                      child: Text(
                                        "Lorem ipsum dolor sit amet.",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 14.sp),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Stack(
                          children: [
                            Container(
                              width: 388.w,
                              height: 369.h,
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
                          ],
                        ),
                      ],
                    ),
                    17.verticalSpace,
                    15.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              child: Icon(
                                Icons.thumb_up,
                                color: Color(0xff21CDFB),
                              ),
                            ),
                            7.horizontalSpace,
                            Container(
                              child: Text(
                                "Like",
                                style: TextStyle(fontSize: 14.sp),
                              ),
                            )
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed("/FeedUPDATESDETAILSScreen");
                          },
                          child: Row(
                            children: [
                              Container(
                                  child: Image.asset(
                                "assets/images/Icon awesome-comment-dots.png",
                                scale: 5,
                              )),
                              7.horizontalSpace,
                              Container(
                                child: Text(
                                  "326 Comments",
                                  style: TextStyle(fontSize: 14.sp),
                                ),
                              )
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Share();
                          },
                          child: Row(
                            children: [
                              Container(
                                  child: Image.asset(
                                "assets/images/Icon awesome-share.png",
                                scale: 5,
                              )),
                              7.horizontalSpace,
                              Container(
                                child: Text(
                                  "Share",
                                  style: TextStyle(fontSize: 14.sp),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    15.verticalSpace,
                    Dividerr(),
                    22.verticalSpace,
                    Container(
                      width: 388.w,
                      height: 392,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),

                              spreadRadius: 5,

                              blurRadius: 7,

                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          20.verticalSpace,
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 47.w,
                                  height: 47.h,
                                  child: Image.asset("assets/images/4.png"),
                                ),
                                5.horizontalSpace,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Martin Smith",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.sp),
                                    ),
                                    Text(
                                      "50min ago",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 12.sp),
                                    ),
                                    15.verticalSpace,
                                    Text(
                                      "Lorem ipsum dolor sit amet.",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 14.sp),
                                    ),
                                  ],
                                ),
                                DropdownButton<String>(
                                  dropdownColor: Color(0xffDFE1EC),
                                  menuMaxHeight: 120.h,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(
                                      10,
                                    ),
                                    topLeft: Radius.circular(
                                      10,
                                    ),
                                    bottomRight: Radius.circular(
                                      10,
                                    ),
                                  ),
                                  onTap: () {},
                                  underline: Container(),
                                  items: <String>['Report', 'Block']
                                      .map((String value) {
                                    return DropdownMenuItem<String>(
                                      // alignment: AlignmentDirectional.Cen,
                                      onTap: () {},
                                      value: value,
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 13.w,
                                            height: 13.h,
                                            child: Image.asset(value == 'Report'
                                                ? "assets/images/Icon material-report.png"
                                                : "assets/images/Icon metro-blocked.png"),
                                          ),
                                          8.horizontalSpace,
                                          Text(
                                            value,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14.sp),
                                          ),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    print("value is : " + value.toString());
                                    if (value.toString() == "Report") {
                                      Report();
                                    } else {
                                      Block();
                                    }
                                  },
                                  icon: Padding(
                                    padding: const EdgeInsets.only(bottom: 30),
                                    child: Icon(
                                      Icons.more_vert,
                                      size: 25,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          30.verticalSpace,
                          Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Row(
                                  children: [
                                    Container(
                                      child: Image.asset(
                                        "assets/images/Icon material-location-on.png",
                                        scale: 5,
                                      ),
                                    ),
                                    10.horizontalSpace,
                                    Container(
                                      child: Text(
                                        "Lorem ipsum dolor sit amet.",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 14.sp),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              10.verticalSpace,
                              Image.asset(
                                "assets/images/Rectangle 1339.png",
                                scale: 1,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    15.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              child: Icon(
                                Icons.thumb_up,
                                color: Color(0xff21CDFB),
                              ),
                            ),
                            7.horizontalSpace,
                            Container(
                              child: Text(
                                "Like",
                                style: TextStyle(fontSize: 14.sp),
                              ),
                            )
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed("/FeedUPDATESDETAILSScreen");
                          },
                          child: Row(
                            children: [
                              Container(
                                  child: Image.asset(
                                "assets/images/Icon awesome-comment-dots.png",
                                scale: 5,
                              )),
                              7.horizontalSpace,
                              Container(
                                child: Text(
                                  "326 Comments",
                                  style: TextStyle(fontSize: 14.sp),
                                ),
                              )
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Share();
                          },
                          child: Row(
                            children: [
                              Container(
                                  child: Image.asset(
                                "assets/images/Icon awesome-share.png",
                                scale: 5,
                              )),
                              7.horizontalSpace,
                              Container(
                                child: Text(
                                  "Share",
                                  style: TextStyle(fontSize: 14.sp),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    15.verticalSpace,
                    Dividerr(),
                    50.verticalSpace,
                  ],
                ),
              ),
            ),

            // Dividerr()
          ],
        ),
      ),
    );
  }

  Report() {
    return showDialog(
      barrierDismissible: true,
      // barrierColor: Colors.white,
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, setState) {
            return AlertDialog(
              backgroundColor: Color(0xff000000B8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.r),
              ),
              contentPadding: EdgeInsets.all(0),
              actionsPadding: EdgeInsets.all(0),
              actions: [
                Container(
                  width: 388.w,
                  height: 477.h,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(10.r),
                      color: Color(0xffFFFFFF)),
                  child: ListView(
                    children: [
                      Container(
                        width: 365.w,
                        height: 59.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.r),
                            topRight: Radius.circular(10.r),
                          ),
                          gradient: LinearGradient(
                            begin: Alignment.bottomRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              Color(0xff1CC8FB),
                              Color(0xff004DF2),
                            ],
                          ),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 140.w,
                            ),
                            Text(
                              "Report",
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 100.w,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: Icon(
                                Icons.close,
                                color: Colors.white,
                                size: 25,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3),
                        child: Column(
                          children: [
                            Text(
                              "Why are you reporting this post?",
                              style: TextStyle(
                                fontSize: 18.sp,
                                color: Colors.black,
                              ),
                            ),
                            20.verticalSpace,
                          ],
                        ),
                      ),
                      Dilogg(),
                      34.verticalSpace,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: Container(
                                width: 319.w,
                                height: 53.h,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.bottomRight,
                                    end: Alignment.bottomLeft,
                                    colors: [
                                      Color(0xff1CC8FB),
                                      Color(0xff004DF2),
                                    ],
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(0, 0),
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(30.r),
                                ),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Submit",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18.sp),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Dilogg() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _value = !_value;
                    });
                  },
                  child: Container(
                    height: 12,
                    width: 12,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color:
                                _value ? Color(0xff6A6A6A) : Color(0xff6A6A6A),
                            width: 1)),
                    child: Icon(
                      Icons.circle_rounded,
                      color: _value ? Color(0xff303030) : Colors.white,
                      size: 8,
                    ),
                  ),
                ),
              ),
              10.horizontalSpace,
              Container(
                width: 260.w,
                height: 44.h,
                child: Text("Lorem ipsum dolor sit amet  sit amet Lorem ..."),
              )
            ],
          ),
          20.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _value1 = !_value1;
                    });
                  },
                  child: Container(
                    height: 12,
                    width: 12,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color:
                                _value1 ? Color(0xff6A6A6A) : Color(0xff6A6A6A),
                            width: 1)),
                    child: Icon(
                      Icons.circle_rounded,
                      color: _value1 ? Color(0xff303030) : Colors.white,
                      size: 8,
                    ),
                  ),
                ),
              ),
              10.horizontalSpace,
              Container(
                width: 260.w,
                height: 44.h,
                child: Text("Lorem ipsum dolor sit amet  sit amet Lorem ..."),
              )
            ],
          ),
          20.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _value2 = !_value2;
                    });
                  },
                  child: Container(
                    height: 12,
                    width: 12,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color:
                                _value2 ? Color(0xff6A6A6A) : Color(0xff6A6A6A),
                            width: 1)),
                    child: Icon(
                      Icons.circle_rounded,
                      color: _value2 ? Color(0xff303030) : Colors.white,
                      size: 8,
                    ),
                  ),
                ),
              ),
              10.horizontalSpace,
              Container(
                width: 260.w,
                height: 44.h,
                child: Text("Lorem ipsum dolor sit amet  sit amet Lorem ..."),
              )
            ],
          ),
          10.verticalSpace,
          10.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _value3 = !_value3;
                    });
                  },
                  child: Container(
                    height: 12,
                    width: 12,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color:
                                _value3 ? Color(0xff6A6A6A) : Color(0xff6A6A6A),
                            width: 1)),
                    child: Icon(
                      Icons.circle_rounded,
                      color: _value3 ? Color(0xff303030) : Colors.white,
                      size: 8,
                    ),
                  ),
                ),
              ),
              10.horizontalSpace,
              Container(
                width: 260.w,
                height: 44.h,
                child: Text("Others"),
              )
            ],
          ),
        ],
      ),
    );
  }

  Block() {
    return showDialog(
      barrierDismissible: true,
      // barrierColor: Colors.white,
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, setState) {
            return AlertDialog(
              backgroundColor: Color(0xff000000B8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.r),
              ),
              contentPadding: EdgeInsets.all(0),
              actionsPadding: EdgeInsets.all(0),
              actions: [
                Container(
                  width: 388.w,
                  height: 249.h,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(10.r),
                      color: Color(0xffFFFFFF)),
                  child: ListView(
                    children: [
                      Container(
                        width: 365.w,
                        height: 59.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.r),
                            topRight: Radius.circular(10.r),
                          ),
                          gradient: LinearGradient(
                            begin: Alignment.bottomRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              Color(0xff1CC8FB),
                              Color(0xff004DF2),
                            ],
                          ),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 140.w,
                            ),
                            Text(
                              "Block",
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 110.w,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: Icon(
                                Icons.close,
                                color: Colors.white,
                                size: 25,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Column(children: [
                        Container(
                          width: 274.w,
                          height: 54.h,
                          child: Text(
                            "Are you sure you want to block Post of this user?",
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(fontSize: 16.sp, color: Colors.black),
                          ),
                        ),
                        // 30.verticalSpace,
                        54.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: Container(
                                width: 172.w,
                                height: 64.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(0.r),
                                    bottomLeft: Radius.circular(18.r),
                                  ),
                                  color: Color(0xffDCE3EE),
                                ),
                                child: Center(
                                  child: Text(
                                    "No",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                            // Container(
                            //   color: Color(0xffDCE3EE),
                            //   height: 64.h,
                            //   width: 1.6.w,
                            // ),
                            GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: Container(
                                width: 170.w,
                                height: 64.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(0.r),
                                    bottomRight: Radius.circular(18.r),
                                  ),
                                  gradient: LinearGradient(
                                    begin: Alignment.bottomRight,
                                    end: Alignment.bottomLeft,
                                    colors: [
                                      Color(0xff1CC8FB),
                                      Color(0xff004DF2),
                                    ],
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    "Yes",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ])
                    ],
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Share() {
    return showDialog(
      barrierDismissible: true,
      // barrierColor: Colors.white,
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, setState) {
            return AlertDialog(
              backgroundColor: Color(0xff000000B8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.r),
              ),
              contentPadding: EdgeInsets.all(0),
              actionsPadding: EdgeInsets.all(0),
              actions: [
                Container(
                  width: 388.w,
                  height: 423.h,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(10.r),
                      color: Color(0xffFFFFFF)),
                  child: ListView(
                    children: [
                      Container(
                        width: 365.w,
                        height: 59.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.r),
                            topRight: Radius.circular(10.r),
                          ),
                          gradient: LinearGradient(
                            begin: Alignment.bottomRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              Color(0xff1CC8FB),
                              Color(0xff004DF2),
                            ],
                          ),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 140.w,
                            ),
                            Text(
                              "Share",
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 110.w,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: Icon(
                                Icons.close,
                                color: Colors.white,
                                size: 25,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Column(children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              Container(
                                width: 350.w,
                                height: 82.h,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color: Colors.grey.withOpacity(0.2)),
                                    borderRadius: BorderRadius.circular(10)),
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
                                    contentPadding:
                                        EdgeInsets.only(left: 25, top: 9),
                                    // labelText: "Type a message",
                                    hintText: "Search here",
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.auto,
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
                              40.verticalSpace,
                              GestureDetector(
                                onTap: () {
                                  Get.back();
                                },
                                child: Container(
                                  width: 350.w,
                                  height: 53.h,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.bottomRight,
                                      end: Alignment.bottomLeft,
                                      colors: [
                                        Color(0xff1CC8FB),
                                        Color(0xff004DF2),
                                      ],
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        offset: Offset(0, 0),
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(30.r),
                                  ),
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Submit",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18.sp),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        26.verticalSpace,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Share to",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18.sp),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        26.verticalSpace,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 7),
                          child: Column(
                            children: [
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Horizontalgoing(
                                        "assets/images/Icon ionic-logo-whatsapp.png"),
                                    Horizontalgoing(
                                        "assets/images/Icon awesome-facebook-f.png"),
                                    Horizontalgoing(
                                        "assets/images/Icon simple-wechat.png"),
                                    Horizontalgoing(
                                        "assets/images/Icon feather-instagram.png"),
                                    Horizontalgoing(
                                        "assets/images/Icon awesome-twitter.png"),
                                    Horizontalgoing(
                                        "assets/images/Icon ionic-logo-whatsapp.png"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )

                        // 30.verticalSpace,
                        // 54.verticalSpace,
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     GestureDetector(
                        //       onTap: () {
                        //         Get.back();
                        //       },
                        //       child: Container(
                        //         width: 172.w,
                        //         height: 64.h,
                        //         decoration: BoxDecoration(
                        //           borderRadius: BorderRadius.only(
                        //             topLeft: Radius.circular(0.r),
                        //             bottomLeft: Radius.circular(18.r),
                        //           ),
                        //           color: Color(0xffDCE3EE),
                        //         ),
                        //         child: Center(
                        //           child: Text(
                        //             "Yes",
                        //             style: TextStyle(color: Colors.white),
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //     // Container(
                        //     //   color: Color(0xffDCE3EE),
                        //     //   height: 64.h,
                        //     //   width: 1.6.w,
                        //     // ),
                        //     GestureDetector(
                        //       onTap: () {
                        //         Get.back();
                        //       },
                        //       child: Container(
                        //         width: 170.w,
                        //         height: 64.h,
                        //         decoration: BoxDecoration(
                        //           borderRadius: BorderRadius.only(
                        //             topRight: Radius.circular(0.r),
                        //             bottomRight: Radius.circular(18.r),
                        //           ),
                        //           gradient: LinearGradient(
                        //             begin: Alignment.bottomRight,
                        //             end: Alignment.bottomLeft,
                        //             colors: [
                        //               Color(0xff1CC8FB),
                        //               Color(0xff004DF2),
                        //             ],
                        //           ),
                        //         ),
                        //         child: Center(
                        //           child: Text(
                        //             "No",
                        //             style: TextStyle(color: Colors.white),
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // )
                      ])
                    ],
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Horizontalgoing(
    Img,
  ) {
    return Row(
      children: [
        Container(
          width: 63.w,
          height: 63.h,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(
                0xffB4B4B4,
              )),
          child: Image.asset(
            Img,
            scale: 5,
          ),
        ),
        Container(
          width: 10,
        )
      ],
    );
  }
}

Dividerr() {
  return Column(
    children: [
      Container(
        width: 388.w,
        height: 1.h,
        color: Color(0xff3A3A3A).withOpacity(0.2),
      ),
    ],
  );
}
