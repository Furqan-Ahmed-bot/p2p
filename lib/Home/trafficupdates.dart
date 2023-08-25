import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TrafficUpdateScreen extends StatefulWidget {
  List userdata;
  TrafficUpdateScreen({required this.userdata});

  @override
  State<TrafficUpdateScreen> createState() => _TrafficUpdateScreenStateScreen();
}

class _TrafficUpdateScreenStateScreen extends State<TrafficUpdateScreen> {
  bool _isLoading = false;
  @override
  void initState() {
    getAddressFromLatLng();
    formatTimeAndData();
    // TODO: implement initState
    super.initState();
  }

  var completeAddress;
  String humanReadableTime = '';
  getAddressFromLatLng() async {
    dynamic longitudee = widget.userdata[0]['long'];
    dynamic latitudee = widget.userdata[0]['lat'];
    final placemarks = await placemarkFromCoordinates(latitudee, longitudee);
    if (placemarks.isNotEmpty) {
      final placemark = placemarks[0];
      completeAddress =
          '${placemark.street},${placemark.subLocality},${placemark.locality}, ${placemark.administrativeArea}  ${placemark.country}';

      print('Location is ${completeAddress}');

      if (completeAddress != null) {
        setState(() {
          _isLoading = true;
        });
      }
      return completeAddress;
    }
    return "Unable to get address";
  }

  String getTimeAgo(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays > 0) {
      return '${difference.inDays} day${difference.inDays > 1 ? 's' : ''} ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hour${difference.inHours > 1 ? 's' : ''} ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} minute${difference.inMinutes > 1 ? 's' : ''} ago';
    } else {
      return 'Just now';
    }
  }

  String formatTimeAndData() {
    String timestamp = widget.userdata[0]['createdAt'];
    DateTime dateTime = DateTime.parse(timestamp);
    DateFormat outputFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
    var formatedDateTime = outputFormat.format(dateTime);
    var localDate =
        outputFormat.parse(formatedDateTime, true).toLocal().toString();
    DateTime apiDateTime = DateTime.parse(localDate);
    humanReadableTime = getTimeAgo(apiDateTime);
    print('Timee is ${humanReadableTime}');
    return humanReadableTime;
  }

  @override
  Widget build(BuildContext context) {
    print(' User  ${widget.userdata}');
    return Scaffold(
        backgroundColor: Colors.white,
        // extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text(
            "TRAFFIC UPDATES",
            style: TextStyle(fontSize: 16.sp),
          ),
          centerTitle: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
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
                scale: 5,
              ),
            ),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30),
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
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.r, vertical: 20.r),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 6),
                      child: Text(
                        "Location",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
                17.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Image.asset(
                        "assets/images/Icon material-location-on.png",
                        scale: 5,
                      ),
                    ),
                    Container(
                      width: 250,
                      child: _isLoading == false
                          ? Text(
                              'Loading...',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.sp,
                              ),
                            )
                          : Text(
                              completeAddress,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.sp,
                              ),
                            ),
                    ),
                    Container(
                      width: 77.w,
                      height: 29.h,
                      decoration: BoxDecoration(
                        color: Color(0xffE8E8F1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          'View Map',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                    )
                  ],
                ),
                18.verticalSpace,
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 6),
                      child: Text(
                        "Updates",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
                26.verticalSpace,
                Dividerr(),
                Container(
                  width: 1.sw,
                  height: 0.65.sh,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: widget.userdata.length,
                      physics: AlwaysScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.r, vertical: 10.r),
                            child: Container(
                              width: 1.sw,
                              height: 0.07.sh,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5.r),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 47.w,
                                      height: 47.h,
                                      child: Image.asset(
                                        'assets/images/2.png',
                                      ),
                                    ),
                                    10.horizontalSpace,
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          widget.userdata[index]['name'],
                                          style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              child: Image.asset(
                                                "assets/images/Icon material-message.png",
                                                scale: 4,
                                              ),
                                            ),
                                            11.horizontalSpace,
                                            Container(
                                              // width: 240.w,
                                              // height: 50,
                                              child: Container(
                                                width: 240.w,
                                                child: Text(
                                                  widget.userdata[index]
                                                              ['caption'] ==
                                                          null
                                                      ? ''
                                                      : widget.userdata[index]
                                                          ['caption'],
                                                  style: TextStyle(
                                                      fontSize: 12.sp),
                                                ),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    Spacer(),

                                    Container(
                                      width: 0.085.sw,
                                      child: Text(
                                        humanReadableTime,
                                        overflow: TextOverflow.visible,
                                        style: TextStyle(
                                          fontSize: 10.sp,
                                          color: Color(0xff878B9E),
                                        ),
                                      ),
                                    ),

                                    // Column(
                                    //   crossAxisAlignment: CrossAxisAlignment.start,
                                    //   children: [
                                    //     Row(
                                    //       children: [
                                    //         15.verticalSpace,
                                    //         SizedBox(
                                    //           height: 50,
                                    //         ),
                                    //         Text(
                                    //           widget.userdata[index]['name'],
                                    //           style: TextStyle(
                                    //               fontSize: 16.sp,
                                    //               fontWeight: FontWeight.w600),
                                    //         ),
                                    //         Text(
                                    //           '50 min',
                                    //           style: TextStyle(
                                    //               fontSize: 10.sp,
                                    //               color: Color(0xff878B9E)),
                                    //         ),
                                    //       ],
                                    //     ),

                                    //     ///10.verticalSpace,
                                    //     Row(
                                    //       mainAxisAlignment:
                                    //           MainAxisAlignment.spaceAround,
                                    //       children: [
                                    //         Padding(
                                    //           padding:
                                    //               const EdgeInsets.only(bottom: 0),
                                    //           child: Container(
                                    //             child: Image.asset(
                                    //               "assets/images/Icon material-message.png",
                                    //               scale: 4,
                                    //             ),
                                    //           ),
                                    //         ),
                                    //         11.horizontalSpace,
                                    //         Container(
                                    //           // width: 240.w,
                                    //           // height: 50,
                                    //           child: Container(
                                    //             width: 240.w,
                                    //             child: Text(
                                    //               widget.userdata[index]
                                    //                           ['caption'] ==
                                    //                       null
                                    //                   ? ''
                                    //                   : widget.userdata[index]
                                    //                       ['caption'],
                                    //               style: TextStyle(fontSize: 12.sp),
                                    //             ),
                                    //           ),
                                    //         )
                                    //       ],
                                    //     )
                                    //   ],
                                    // )
                                  ],
                                ),
                              ),
                            ));
                      }),
                )
              ],
            ),
          ),
        )
        //  Padding(
        //   padding: EdgeInsets.symmetric(horizontal: 20),
        //   child: Column(
        //     children: [
        //       27.verticalSpace,
        //       Row(
        //         children: [
        //           Padding(
        //             padding: const EdgeInsets.only(left: 6),
        //             child: Text(
        //               "Location",
        //               style: TextStyle(
        //                   color: Colors.black,
        //                   fontSize: 22.sp,
        //                   fontWeight: FontWeight.w600),
        //             ),
        //           ),
        //         ],
        //       ),
        //       17.verticalSpace,
        //       Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceAround,
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           Container(
        //             child: Image.asset(
        //               "assets/images/Icon material-location-on.png",
        //               scale: 5,
        //             ),
        //           ),
        //           Text(
        //             "20 Cooper Square, New York",
        //             style: TextStyle(
        //               color: Colors.black,
        //               fontSize: 16.sp,
        //             ),
        //           ),
        //           Container(
        //             width: 77.w,
        //             height: 29.h,
        //             decoration: BoxDecoration(
        //               color: Color(0xffE8E8F1),
        //               borderRadius: BorderRadius.circular(20),
        //             ),
        //             child: Center(
        //               child: Text(
        //                 '',
        //                 style: TextStyle(
        //                     color: Colors.black,
        //                     fontSize: 12.sp,
        //                     fontWeight: FontWeight.w900),
        //               ),
        //             ),
        //           )
        //         ],
        //       ),
        //       18.verticalSpace,
        //       Row(
        //         children: [
        //           Padding(
        //             padding: const EdgeInsets.only(left: 6),
        //             child: Text(
        //               "Updates",
        //               style: TextStyle(
        //                   color: Colors.black,
        //                   fontSize: 22.sp,
        //                   fontWeight: FontWeight.w600),
        //             ),
        //           ),
        //         ],
        //       ),
        //       26.verticalSpace,

        //       // Row(
        //       //   children: [
        //       //     Padding(
        //       //       padding: const EdgeInsets.only(left: 6),
        //       //       child: Text(
        //       //         "Updates",
        //       //         style: TextStyle(
        //       //             color: Colors.black,
        //       //             fontSize: 22.sp,
        //       //             fontWeight: FontWeight.w600),
        //       //       ),
        //       //     ),
        //       //   ],
        //       // ),
        //       //           Container(
        //       //              height: 0.9.sh,
        //       //             width: 1.sw,

        //       //             child: ListView.builder(itemBuilder: (context , index){
        //       //               return  Container(
        //       //   width: 388.w,
        //       //   height: 97.h,
        //       //   decoration: BoxDecoration(
        //       //     borderRadius: BorderRadius.circular(10),
        //       //     color: Colors.white,
        //       //     boxShadow: [
        //       //       BoxShadow(
        //       //         color: Colors.grey.withOpacity(0.2),
        //       //         spreadRadius: 5,
        //       //         blurRadius: 7,
        //       //         offset: Offset(0, 3), // changes position of shadow
        //       //       ),
        //       //     ],
        //       //   ),
        //       //   child: Row(
        //       //     children: [
        //       //       Padding(
        //       //         padding: EdgeInsets.symmetric(horizontal: 10),
        //       //         child: Column(
        //       //           crossAxisAlignment: CrossAxisAlignment.start,
        //       //           children: [
        //       //             10.verticalSpace,
        //       //             Container(
        //       //               width: 47.w,
        //       //               height: 47.h,
        //       //               child: Image.asset(
        //       //                 'Name',
        //       //               ),
        //       //             ),
        //       //           ],
        //       //         ),
        //       //       ),
        //       //       Column(
        //       //         crossAxisAlignment: CrossAxisAlignment.start,
        //       //         children: [
        //       //           Row(
        //       //             children: [
        //       //               10.verticalSpace,
        //       //               Text(
        //       //                 "Martin Smith",
        //       //                 style:
        //       //                     TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
        //       //               ),
        //       //               130.horizontalSpace,
        //       //               Text(
        //       //                 'name',
        //       //                 style: TextStyle(fontSize: 10.sp, color: Color(0xff878B9E)),
        //       //               ),
        //       //             ],
        //       //           ),
        //       //           10.verticalSpace,
        //       //           Row(
        //       //             mainAxisAlignment: MainAxisAlignment.spaceAround,
        //       //             children: [
        //       //               Padding(
        //       //                 padding: const EdgeInsets.only(bottom: 18),
        //       //                 child: Container(
        //       //                   child: Image.asset(
        //       //                     "assets/images/Icon material-message.png",
        //       //                     scale: 5,
        //       //                   ),
        //       //                 ),
        //       //               ),
        //       //               11.horizontalSpace,
        //       //               Container(
        //       //                 // width: 240.w,
        //       //                 // height: 50,
        //       //                 child: Container(
        //       //                   width: 240.w,
        //       //                   child: Text(
        //       //                     "Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet...",
        //       //                     style: TextStyle(fontSize: 12.sp),
        //       //                   ),
        //       //                 ),
        //       //               )
        //       //             ],
        //       //           )
        //       //         ],
        //       //       )
        //       //     ],
        //       //   ),
        //       // );
        //       //             }),

        //       // ),

        //       // 19.verticalSpace,
        //       // MArtinSmit1("assets/images/1.png", "16 min. ago"),

        //       // Container(
        //       //   height: 0.9.sh,
        //       //   width: 1.sw,
        //       //   child: ListView.builder(
        //       //       shrinkWrap: true,
        //       //       itemBuilder: (context, index) {
        //       //         return Container(
        //       //           color: Colors.blue,
        //       //         );
        //       //       }),
        //       // )

        //       // 15.verticalSpace,
        //       // Martin2("assets/images/2.png", "30 min. ago"),
        //       // 15.verticalSpace,
        //       // MArtinSmit1("assets/images/3.png", "17 min. ago"),
        //       // 15.verticalSpace,
        //       // Martin2("assets/images/4.png", "28 min. ago"),
        //       // 15.verticalSpace,
        //       // Martin2("assets/images/5.png", "30 min. ago"),
        //     ],
        //   ),
        // ),

        );
  }

  Dividerr() {
    return Column(
      children: [
        Container(
          width: 388.w,
          height: 1.h,
          color: Color(0xff333333),
        ),
      ],
    );
  }

  MArtinSmit1(
    Img,
    txt,
  ) {
    return Container(
      width: 388.w,
      height: 97.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                10.verticalSpace,
                Container(
                  width: 47.w,
                  height: 47.h,
                  child: Image.asset(
                    Img,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  10.verticalSpace,
                  Text(
                    "Martin Smith",
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                  ),
                  130.horizontalSpace,
                  Text(
                    txt,
                    style: TextStyle(fontSize: 10.sp, color: Color(0xff878B9E)),
                  ),
                ],
              ),
              10.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 18),
                    child: Container(
                      child: Image.asset(
                        "assets/images/Icon material-message.png",
                        scale: 5,
                      ),
                    ),
                  ),
                  11.horizontalSpace,
                  Container(
                    // width: 240.w,
                    // height: 50,
                    child: Container(
                      width: 240.w,
                      child: Text(
                        "Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet...",
                        style: TextStyle(fontSize: 12.sp),
                      ),
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Martin2(
    img,
    txt,
  ) {
    return Container(
      width: 388.w,
      height: 85.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                10.verticalSpace,
                Container(
                  width: 47.w,
                  height: 47.h,
                  child: Image.asset(
                    img,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  10.verticalSpace,
                  Text(
                    "Martin Smith",
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                  ),
                  130.horizontalSpace,
                  Text(
                    txt,
                    style: TextStyle(fontSize: 10.sp, color: Color(0xff878B9E)),
                  ),
                ],
              ),
              10.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    child: Image.asset(
                      "assets/images/Icon awesome-image.png",
                      scale: 5,
                    ),
                  ),
                  11.horizontalSpace,
                  Container(
                    // width: 240.w,
                    // height: 50,
                    child: Container(
                      child: Text(
                        "(06) Photos Updated",
                        style: TextStyle(fontSize: 12.sp),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
