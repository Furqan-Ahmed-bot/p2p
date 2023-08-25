import 'dart:async';
import 'dart:convert';
import 'dart:io';

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
  final TextEditingController postAvaliblityController =
      TextEditingController();
  final TextEditingController selectTimeController = TextEditingController();
  final TextfieldTagsController tagController = TextfieldTagsController();
  TextEditingController mytextController = TextEditingController();
  double? distanceToField;
  var photos; //for caputred image
  final Completer<GoogleMapController> mapcontroller = Completer();
  static CameraPosition _center =
      CameraPosition(target: LatLng(latitude, longitude), zoom: 15);
  final List<Marker> _marker = [];

  bool? _isLoading;
  List Friends = [];
  List SearchedFriends = [];
  List FriendList = [];
  List<dynamic> taggedFriends = [];
  var data = {};
  final List<Marker> _branch = [
    Marker(
      markerId: MarkerId("1"),
      position: LatLng(latitude, longitude),
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
    // ignore: unnecessary_null_comparison
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

  void searchFriend(friendname) async {
    setState(() {
      _isLoading = false;
    });

    Friends = await ApiService().searchuser(friendname);

    setState(() {
      SearchedFriends = Friends;
      FriendList = Friends;
      _isLoading = true;
    });
    print('MYUsers  ${SearchedFriends}');
  }

  validations(context) {
    if (captionTextController.text.isEmpty) {
      Get.snackbar('Please', 'Enter Caption');
    } else if (postAvaliblityController.text.isEmpty) {
      Get.snackbar('Please', 'Enter Past Avaliblity');
    } else {
      var data = {
        'caption': captionTextController.text,
        'tags': taggedFriends.toString(),
        'postAvailability': postAvaliblityController.text,
        'lat': latitude.toString(),
        'long': longitude.toString()
      };

      ApiService().sharelivelocation(data, context);
    }
  }

  List mytags = [];
  Map<String, String> mydata = {};

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
                    Container(width: 350.w, child: Text("${UserAddress}")),
                  ],
                ),
                26.verticalSpace,
                // GetBuilder(
                //     init: uploatTrafficImageController,
                //     builder: (controller) {
                //       return uploatTrafficImageController
                //                   .trafficImages.length !=
                //               0
                //           ? GridView.builder(
                //               shrinkWrap: true,
                //               physics: const NeverScrollableScrollPhysics(),
                //               padding: EdgeInsets.zero,
                //               itemCount: controller.trafficImages.length,
                //               gridDelegate:
                //                   const SliverGridDelegateWithFixedCrossAxisCount(
                //                       crossAxisCount: 3,
                //                       childAspectRatio: 1,
                //                       crossAxisSpacing: 19.5,
                //                       mainAxisSpacing: 12.5),
                //               itemBuilder: (context, index) => Stack(
                //                 clipBehavior: Clip.none,
                //                 children: [
                //                   Container(
                //                     width: 117.w,
                //                     height: 125.h,
                //                     decoration: BoxDecoration(
                //                         color: Colors.white,
                //                         borderRadius:
                //                             BorderRadius.circular(10.r),
                //                         image: controller.trafficImages[index]
                //                                 .contains('http')
                //                             ? DecorationImage(
                //                                 image: NetworkImage(controller
                //                                     .trafficImages[index]
                //                                     .toString()),
                //                                 fit: BoxFit.cover)
                //                             : DecorationImage(
                //                                 image: FileImage(File(controller
                //                                     .trafficImages[index])),
                //                                 fit: BoxFit.cover),
                //                         boxShadow: [
                //                           BoxShadow(
                //                               color:
                //                                   Colors.black.withOpacity(0.3),
                //                               blurRadius: 4)
                //                         ]),
                //                   ),
                //                   Positioned(
                //                       top: -5,
                //                       right: -1,
                //                       child: GestureDetector(
                //                         onTap: () =>
                //                             uploatTrafficImageController
                //                                 .removeImage(index),
                //                         child: Container(
                //                           width: 21.r,
                //                           height: 21.r,
                //                           alignment: Alignment.center,
                //                           decoration: BoxDecoration(
                //                               shape: BoxShape.circle,
                //                               color: Colors.white),
                //                           child: Icon(
                //                             Icons.cancel,
                //                             color: Colors.red,
                //                             size: 21.r,
                //                           ),
                //                         ),
                //                       )),
                //                 ],
                //               ),
                //             )
                //           : SizedBox.shrink();
                //     }),
                // 15.verticalSpace,
                // GestureDetector(
                //   behavior: HitTestBehavior.translucent,
                //   onTap: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //         builder: (_) => CameraCamera(
                //           onFile: (file) {
                //             uploatTrafficImageController.addImage(file.path);
                //             // photos.add(file);
                //             //When take foto you should close camera
                //             Navigator.pop(context);
                //             setState(() {});
                //           },
                //         ),
                //       ),
                //     );
                //   },
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.end,
                //     children: [
                //       Container(
                //         child: Image.asset(
                //           "assets/images/Group 16588.png",
                //           scale: 4,
                //         ),
                //       ),
                //       8.horizontalSpace,
                //       Text(
                //         "More Photo",
                //         style: TextStyle(
                //           fontSize: 12.sp,
                //         ),
                //       )
                //     ],
                //   ),
                // ),
                // 29.verticalSpace,
                Text(
                  "Caption",
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: Color(0xff010231),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                20.verticalSpace,
                CustomTextFieldWidget2(
                    hintText: "Write Caption",
                    maxLines: 3,
                    contentPadding: EdgeInsets.all(
                      20.r,
                    ),
                    controller: captionTextController),
                29.verticalSpace,
                Text(
                  "Post Availabilty",
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
                    keyboardType: TextInputType.number,
                    maxLines: 1,
                    textAlignVertical: TextAlignVertical.center,
                    controller: postAvaliblityController,
                    style: TextStyle(fontSize: 14.sp),
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.all(
                        20.r,
                      ),
                      hintText: "Post Avaliblity",
                      hintStyle:
                          TextStyle(color: Color(0xff878B9E), fontSize: 15.sp),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                // CustomTextFieldWidget2(
                //     hintText: "Post Avaliblity",
                //     contentPadding: EdgeInsets.all(
                //       20.r,
                //     ),
                //     controller: postAvaliblityController),
                // CustomTextFieldWidget2(
                //   controller: selectTimeController,
                //   maxLines: 1,
                //   hintText: "Select Time",
                //   readOnly: true,
                //   onTap: () async {
                //     TimeOfDay? pickedTime = await showTimePicker(
                //       initialTime: TimeOfDay.now(),
                //       context: context,
                //     );

                //     if (pickedTime != null) {
                //       print(pickedTime.format(context)); //output 10:51 PM
                //       // DateTime parsedTime = DateFormat.jm()
                //       //     .parse(pickedTime.format(context).toString());
                //       //converting to DateTime so that we can further format on different pattern.
                //       // print(parsedTime);
                //       //output 1970-01-01 22:53:00.000
                //       // String formattedTime =
                //       //     DateFormat('HH:mm').format(parsedTime);
                //       // print(formattedTime); //output 14:59:00
                //       //DateFormat() is from intl package, you can format the time on any pattern you need.

                //       setState(() {
                //         selectTimeController.text = pickedTime
                //             .format(context); //set the value of text field.
                //       });
                //     } else {
                //       print("Time is not selected");
                //     }
                //   },
                //   suffixIcon: Transform.rotate(
                //       angle: (538.7 * math.pi / 360),
                //       child: Icon(
                //         Icons.arrow_back_ios_new,
                //         color: Color(0xff010231),
                //         size: 18.r,
                //       )),
                // ),
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
                  inputfieldBuilder: (
                    context,
                    tec,
                    fn,
                    error,
                    onChanged,
                    onSubmitted,
                  ) {
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
                          controller: mytextController,
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
                            prefixIcon: mytags.isNotEmpty
                                ? SingleChildScrollView(
                                    controller: sc,
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                        children: mytags.map((tag) {
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
                                                '${tag['name']}',
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
                                                mytags.removeAt(mytags
                                                    .indexWhere((element) =>
                                                        element['id'] ==
                                                        "${tag['id']}"));
                                                setState(() {});
                                              },
                                            )
                                          ],
                                        ),
                                      );
                                    }).toList()),
                                  )
                                : null,
                          ),
                          onChanged: (value) {
                            print(value.isEmpty);
                            if (value == "") {
                              print("hello");
                              Friends = [];
                              SearchedFriends = [];
                              setState(() {});
                            } else {
                              searchFriend(value);
                            }
                          },
                          onSubmitted: (value) {},
                        ),
                      );
                    });
                  },
                ),

                FriendList.isEmpty
                    ? Container()
                    : Container(
                        height: 0.3.sh,
                        width: 1.sw,
                        child: _isLoading == false
                            ? Center(child: CircularProgressIndicator())
                            : ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: SearchedFriends.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      // Padding(
                                      //   padding: const EdgeInsets.all(8.0),
                                      //   child: Container(
                                      //     height: 100,
                                      //     width: 100,
                                      //     color: Colors.blue,
                                      //   ),
                                      // )
                                      33.verticalSpace,
                                      Container(
                                        width: double.infinity,
                                        child: SingleChildScrollView(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20),
                                            child: Column(
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    print(mytags.length);
                                                    if (mytags.length > 0) {
                                                      for (var i = 0;
                                                          i < mytags.length;
                                                          i++) {
                                                        print("hghghghgh");
                                                        if (mytags[i]["name"] ==
                                                            SearchedFriends[
                                                                    index]
                                                                ['userName']) {
                                                          setState(() {
                                                            mytextController
                                                                .clear();
                                                          });
                                                        } else {
                                                          setState(() {
                                                            mytextController
                                                                .clear();
                                                            mytags.add({
                                                              'name':
                                                                  SearchedFriends[
                                                                          index]
                                                                      [
                                                                      'userName'],
                                                              'id':
                                                                  SearchedFriends[
                                                                          index]
                                                                      ['id'],
                                                            });

                                                            print(
                                                                'List is  ${mytags}');

                                                            FriendList.clear();
                                                          });
                                                        }
                                                      }
                                                    } else {
                                                      setState(() {
                                                        mytextController
                                                            .clear();
                                                        mytags.add({
                                                          'name':
                                                              SearchedFriends[
                                                                      index]
                                                                  ['userName'],
                                                          'id': SearchedFriends[
                                                              index]['id'],
                                                        });

                                                        print(
                                                            'List is  ${mytags}');

                                                        FriendList.clear();
                                                      });
                                                    }

                                                    // setState(() {
                                                    //   if (mytags.contains({
                                                    //     'name': SearchedFriends[
                                                    //         index]['userName'],
                                                    //   })) {
                                                    //     print('Already tagged');
                                                    //   } else {
                                                    //     mytextController
                                                    //         .clear();
                                                    //     mytags.add({
                                                    //       'name':
                                                    //           SearchedFriends[
                                                    //                   index]
                                                    //               ['userName'],
                                                    //       'id': SearchedFriends[
                                                    //           index]['id'],
                                                    //     });

                                                    //     print(
                                                    //         'List is  ${mytags}');

                                                    //     FriendList.clear();
                                                    //   }
                                                    // });
                                                  },
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        height: 60.h,
                                                        width: 60.w,
                                                        child: SearchedFriends[
                                                                        index]
                                                                    ['image'] !=
                                                                null
                                                            ? CircleAvatar(
                                                                radius: 25,
                                                                backgroundImage:
                                                                    NetworkImage(
                                                                        'https://p2p-api.thesuitchstaging.com:2700/public/uploads/${SearchedFriends[index]['image']}'))
                                                            : CircleAvatar(
                                                                radius: 25,
                                                                backgroundImage:
                                                                    AssetImage(
                                                                        "assets/images/1.png")),
                                                      ),
                                                      22.horizontalSpace,
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            SearchedFriends[
                                                                    index]
                                                                ['userName'],
                                                            style: TextStyle(
                                                                fontSize: 18.sp,
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                          Text(
                                                            SearchedFriends[
                                                                    index]
                                                                ['country'],
                                                            style: TextStyle(
                                                                fontSize: 14.sp,
                                                                color: Color(
                                                                    0xffFFFFFF)),
                                                          ),
                                                        ],
                                                      ),
                                                      Spacer(),
                                                      SearchedFriends[index]
                                                                  ['friend'] ==
                                                              'pending'
                                                          ? Container(
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .blue,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5)),
                                                              height: 30,
                                                              width: 80,
                                                              child: Center(
                                                                  child: Text(
                                                                'Pending',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white),
                                                              )),
                                                            )
                                                          : SearchedFriends[
                                                                          index]
                                                                      [
                                                                      'friend'] ==
                                                                  'accepted'
                                                              ? Container(
                                                                  decoration: BoxDecoration(
                                                                      color: Colors
                                                                          .blue,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5)),
                                                                  height: 30,
                                                                  width: 80,
                                                                  child: Center(
                                                                      child:
                                                                          Text(
                                                                    'Friend',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white),
                                                                  )),
                                                                )
                                                              : InkWell(
                                                                  onTap: () {
                                                                    var data = {
                                                                      'user': SearchedFriends[index]
                                                                              [
                                                                              'id']
                                                                          .toString(),
                                                                    };
                                                                    ApiService()
                                                                        .addfriend(
                                                                            data);
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    height:
                                                                        26.h,
                                                                    width: 26.w,
                                                                    child: Image
                                                                        .asset(
                                                                      "assets/images/Group 1683.png",
                                                                    ),
                                                                  ),
                                                                ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              )),
                30.verticalSpace,
                CustomButtonWidget(
                    text: 'Post',
                    onTap: () {
                      for (var i = 0; i < mytags.length; i++) {
                        taggedFriends.add(jsonEncode(mytags[i]['id']));

                        print('Tagged Friends are ${taggedFriends}');
                      }
                      validations(context);
                      // var data = {
                      //   'caption': captionTextController.text,
                      //   'tags': taggedFriends.toString(),
                      //   'postAvailability': postAvaliblityController.text,
                      //   'lat': latitude.toString(),
                      //   'long': longitude.toString()
                      // };

                      // ApiService().sharelivelocation(data, context);

                      // final bottomcontroller = Get.put(BottomController());
                      // bottomcontroller.navBarChange(1);
                      // Get.to(() => MainScreen());
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
