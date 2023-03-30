import 'dart:async';
import 'dart:io';
import 'dart:math' as math;

import '../export_all.dart';

class ShareLiveLocationScreen extends StatefulWidget {
  const ShareLiveLocationScreen({super.key});

  @override
  State<ShareLiveLocationScreen> createState() =>
      _ShareLiveLocationScreenState();
}

class _ShareLiveLocationScreenState extends State<ShareLiveLocationScreen> {
  late List<CameraDescription> cameras; //list out the camera available
  late CameraController controller; //controller for camera
  XFile? image;
  File? imageFile;
  final uploatTrafficImageController = Get.put(UploadTrafficeImages());
  final TextEditingController captionTextController = TextEditingController();
  final TextEditingController selectTimeController = TextEditingController();
  final TextfieldTagsController tagController = TextfieldTagsController();
  double? _distanceToField;
  var photos; //for caputred image
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
    startCamera();
    super.initState();
  }

  void startCamera() async {
    cameras = await availableCameras();
    if (cameras != null) {
      controller = CameraController(cameras[0], ResolutionPreset.max);
//cameras[0] = first camera, change to 1 to another camera

      controller.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {});
      });
    } else {
      print("NO any camera found");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "SHARE LIVE LOCATION",
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
      body: DisAllowIndicatorWidget(
        child: ListView(
          children: [
            Container(
              width: double.infinity,
              height: 483.h,
              child: GoogleMap(
                compassEnabled: true,
                myLocationButtonEnabled: true,
                zoomGesturesEnabled: true,
                initialCameraPosition: _center,
                markers: Set<Marker>.of(_marker),
                // onMapCreated: (GoogleMapController controller) {
                //   _mapcontroller.complete(controller);
                // },
              ),
            ),
            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(20.r),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 15.w,
                      height: 21.h,
                      child: Image.asset(
                          "assets/images/Icon material-location-onn.png"),
                    ),
                    15.horizontalSpace,
                    Text("20 Cooper Square, New York"),
                  ],
                ),
                26.verticalSpace,
                GetBuilder(
                    init: uploatTrafficImageController,
                    builder: (controller) {
                      return uploatTrafficImageController
                                  .trafficImages.length !=
                              0
                          ? GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.zero,
                              itemCount: controller.trafficImages.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      childAspectRatio: 1,
                                      crossAxisSpacing: 19.5,
                                      mainAxisSpacing: 12.5),
                              itemBuilder: (context, index) => Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Container(
                                    width: 117.w,
                                    height: 125.h,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                        image: controller.trafficImages[index]
                                                .contains('http')
                                            ? DecorationImage(
                                                image: NetworkImage(controller
                                                    .trafficImages[index]
                                                    .toString()),
                                                fit: BoxFit.cover)
                                            : DecorationImage(
                                                image: FileImage(File(controller
                                                    .trafficImages[index])),
                                                fit: BoxFit.cover),
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.3),
                                              blurRadius: 4)
                                        ]),
                                  ),
                                  Positioned(
                                      top: -5,
                                      right: -1,
                                      child: GestureDetector(
                                        onTap: () =>
                                            uploatTrafficImageController
                                                .removeImage(index),
                                        child: Container(
                                          width: 21.r,
                                          height: 21.r,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.white),
                                          child: Icon(
                                            Icons.cancel,
                                            color: Colors.red,
                                            size: 21.r,
                                          ),
                                        ),
                                      )),
                                ],
                              ),
                            )
                          : SizedBox.shrink();
                    }),
                15.verticalSpace,
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CameraCamera(
                          onFile: (file) {
                            uploatTrafficImageController.addImage(file.path);
                            // photos.add(file);
                            //When take foto you should close camera
                            Navigator.pop(context);
                            setState(() {});
                          },
                        ),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        child: Image.asset(
                          "assets/images/Group 16588.png",
                          scale: 4,
                        ),
                      ),
                      8.horizontalSpace,
                      Text(
                        "More Photo",
                        style: TextStyle(
                          fontSize: 12.sp,
                        ),
                      )
                    ],
                  ),
                ),
                29.verticalSpace,
                Text(
                  "Caption",
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: Color(0xff010231),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                20.verticalSpace,
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xffEAEAEE),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xff66708026).withOpacity(0.06),
                        spreadRadius: 0,
                        blurRadius: 2,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  child: TextFormField(
                    maxLines: 3,
                    style: TextStyle(fontSize: 15.sp),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(
                        20.r,
                      ),
                      hintText: "Write Caption",
                      helperMaxLines: 3,
                      hintStyle:
                          TextStyle(color: Color(0xff878B9E), fontSize: 15.sp),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                29.verticalSpace,
                Text(
                  "Past Availabilty",
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: Color(0xff010231),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                20.verticalSpace,
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xffEAEAEE),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xff66708026).withOpacity(0.06),
                        spreadRadius: 0,
                        blurRadius: 2,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  child: TextFormField(
                    maxLines: 1,
                    readOnly: true,
                    textAlignVertical: TextAlignVertical.center,
                    controller: selectTimeController,
                    style: TextStyle(fontSize: 14.sp),
                    onTap: () async {
                      TimeOfDay? pickedTime = await showTimePicker(
                        initialTime: TimeOfDay.now(),
                        context: context,
                      );

                      if (pickedTime != null) {
                        print(pickedTime.format(context)); //output 10:51 PM
                        // DateTime parsedTime = DateFormat.jm()
                        //     .parse(pickedTime.format(context).toString());
                        //converting to DateTime so that we can further format on different pattern.
                        // print(parsedTime);
                        //output 1970-01-01 22:53:00.000
                        // String formattedTime =
                        //     DateFormat('HH:mm').format(parsedTime);
                        // print(formattedTime); //output 14:59:00
                        //DateFormat() is from intl package, you can format the time on any pattern you need.

                        setState(() {
                          selectTimeController.text = pickedTime
                              .format(context); //set the value of text field.
                        });
                      } else {
                        print("Time is not selected");
                      }
                    },
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 20.r, vertical: 17.r),
                      hintText: "Select Time",
                      suffixIcon: Transform.rotate(
                          angle: (538.7 * math.pi / 360),
                          child: Icon(
                            Icons.arrow_back_ios_new,
                            color: Color(0xff010231),
                            size: 18.r,
                          )),
                      hintStyle:
                          TextStyle(color: Color(0xff878B9E), fontSize: 15.sp),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                29.verticalSpace,
                Text(
                  "Tag People",
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: Color(0xff010231),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                29.verticalSpace,
                TextFieldTags(
                  textfieldTagsController: tagController,
                  initialTags: const ['William Smith', 'Amelia'],
                  textSeparators: const [' ', ','],
                  letterCase: LetterCase.normal,
                  validator: (String tag) {
                    if (tag == 'php') {
                      return 'No, please just no';
                    } else if (tagController.getTags!.contains(tag)) {
                      return 'you already entered that';
                    }
                    return null;
                  },
                  inputfieldBuilder:
                      (context, tec, fn, error, onChanged, onSubmitted) {
                    return ((context, sc, tags, onTagDelete) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Color(0xffEAEAEE),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xff66708026).withOpacity(0.06),
                              spreadRadius: 0,
                              blurRadius: 2,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                        child: TextField(
                          controller: tec,
                          focusNode: fn,
                          style: TextStyle(
                              fontSize: 12.sp, fontWeight: FontWeight.w600),
                          decoration: InputDecoration(
                            isDense: true,
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 25.r, vertical: 18.r),
                            hintText:
                                tagController.hasTags ? '' : "Enter tag...",
                            errorText: error,
                            prefixIconConstraints: BoxConstraints(
                                maxWidth: Get.width, minWidth: Get.width * 0.1),
                            prefixIcon: tags.isNotEmpty
                                ? SingleChildScrollView(
                                    controller: sc,
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                        children: tags.map((String tag) {
                                      return Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(20.0),
                                          ),
                                          color: Color(0xff878B9E)
                                              .withOpacity(0.5),
                                        ),
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 10.r),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0, vertical: 5.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            InkWell(
                                              child: Text(
                                                '$tag',
                                                style: TextStyle(
                                                    fontSize: 12.sp,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              onTap: () {
                                                print("$tag selected");
                                              },
                                            ),
                                            const SizedBox(width: 4.0),
                                            InkWell(
                                              child: Icon(
                                                Icons.cancel,
                                                size: 22.r,
                                                color: Color.fromARGB(
                                                    255, 230, 9, 9),
                                              ),
                                              onTap: () {
                                                onTagDelete(tag);
                                              },
                                            )
                                          ],
                                        ),
                                      );
                                    }).toList()),
                                  )
                                : null,
                          ),
                          onChanged: onChanged,
                          onSubmitted: onSubmitted,
                        ),
                      );
                    });
                  },
                ),
                30.verticalSpace,
                CustomButtonWidget(
                    text: 'Post',
                    onTap: () {
                      final bottomcontroller = Get.put(BottomController());
                      bottomcontroller.navBarChange(1);
                      Get.to(() => MainScreen());
                    }),
                20.verticalSpace,
              ],
            ),
          ],
        ),
      ),
    );
  }

  Imgss() {
    return Container(
      width: double.infinity,
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                width: 117.w,
                height: 125.h,
                child: Image.asset(
                  "assets/images/NoPath - Copy (29).png",
                ),
              ),
              Positioned(
                  top: 0,
                  left: 93,
                  child: Container(
                    width: 21.w,
                    height: 21.h,
                    child: Image.asset("assets/images/Group 1005.png"),
                  )),
            ],
          ),
          15.horizontalSpace,
          Stack(
            children: [
              Container(
                width: 117.w,
                height: 125.h,
                child: Image.asset(
                  "assets/images/NoPath - Copy (30).png",
                ),
              ),
              Positioned(
                  top: 0,
                  left: 93,
                  child: Container(
                    width: 21.w,
                    height: 21.h,
                    child: Image.asset("assets/images/Group 1005.png"),
                  )),
            ],
          ),
          15.horizontalSpace,

          Stack(
            children: [
              Container(
                width: 117.w,
                height: 125.h,
                child: Image.asset(
                  "assets/images/NoPath - Copy (32).png",
                ),
              ),
              Positioned(
                  top: 0,
                  left: 93,
                  child: Container(
                    width: 21.w,
                    height: 21.h,
                    child: Image.asset("assets/images/Group 1005.png"),
                  )),
            ],
          ),
          // Container(
          //   width: 87.w,
          //   height: 97.h,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(5.r),
          //   ),
          //   child: DottedBorder(
          //     borderType: BorderType.RRect,
          //     radius: Radius.circular(2.r),
          //     dashPattern: [3, 8],
          //     color: Colors.grey,
          //     strokeWidth: 2,
          //     child: Center(
          //       child: Container(
          //         child: Image.asset(
          //           "assets/images/Icon ionic-ios-add-circle.png",
          //           height: 29.h,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
