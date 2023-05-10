import 'dart:io';

import '../export_all.dart';
import 'feeds_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final bottomcontroller = Get.put(BottomController());
  final GlobalKey<ScaffoldState> formKey = GlobalKey();
  int pageIndex = 0;

  final List<NavigationDataListModel> pages = [
    NavigationDataListModel(
        'Home', "${imagePath}/Icon awesome-home.png", HomeScreen()),
    NavigationDataListModel('Feeds', "${imagePath}/Icon material-rss-feed.png",
        const FeedsScreen()),
    NavigationDataListModel('History', "${imagePath}/Icon awesome-history.png",
        const HistoryScreen()),
    NavigationDataListModel(
        'Home', "${imagePath}/Icon awesome-spotifyGreen.png", HomeScreen()),
  ];
  List<CameraDescription>? cameras; //list out the camera available
  CameraController? controller; //controller for camera
  XFile? image;
  File? imageFile;

  var photos; //for caputred image

  @override
  void initState() {
    startCamera();
    Future.delayed(Duration.zero, () {
      if (bottomcontroller.navigationBarIndexValue == 3) {
        spotifyBottomSheetOpen();
      }
    });
    super.initState();
  }

  void startCamera() async {
    cameras = await availableCameras();
    if (cameras != null) {
      controller = CameraController(cameras![0], ResolutionPreset.max);
//cameras[0] = first camera, change to 1 to another camera

      controller!.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {});
      });
    } else {
      print("NO any camera found");
    }
  }

  void _onItemTapped(int index) {
    bottomcontroller.navBarChange(index);
  }

  void spotifyBottomSheetOpen() {
    showModalBottomSheet(
      enableDrag: true,
      clipBehavior: Clip.hardEdge,
      isDismissible: true,
      isScrollControlled: true,
      barrierColor: Colors.transparent,
      elevation: 15,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15.r),
          topRight: Radius.circular(15.r),
        ),
      ),
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (BuildContext context,
            StateSetter setState /*You can rename this!*/) {
          return SingleChildScrollView(
            // controller: ModalScrollController.of(context),
            child: Column(
              children: [
                Container(
                  width: 427.w,
                  height: 280.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.r),
                      topRight: Radius.circular(15.r),
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
                  child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 20.r),
                    children: [
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Container(
                              width: 101.w,
                              height: 18.h,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color(0xff01023163).withOpacity(0.06),
                                ),
                                color: Color(0xff002B7A).withOpacity(0.4),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(15.r),
                                  bottomRight: Radius.circular(15.r),
                                ),
                              ),
                              child: Image.asset(
                                "assets/images/Icon ionic-ios-arrow-down-1.png",
                                scale: 5,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          23.verticalSpace,
                          Row(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    child: Image.asset(
                                      "assets/images/Icon awesome-spotifyGreen.png",
                                      scale: 5,
                                    ),
                                  ),
                                  11.horizontalSpace,
                                  Container(
                                    child: Text(
                                      "Spotify",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20.sp),
                                    ),
                                  ),
                                ],
                              ),
                              255.horizontalSpace,
                              GestureDetector(
                                onTap: () {
                                  Get.back();
                                },
                                child: Icon(
                                  Icons.close,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      10.verticalSpace,
                      Container(
                        width: 280.w,
                        child: ProgressBar(
                          timeLabelType: TimeLabelType.totalTime,
                          baseBarColor: Color(0xffFFFFFF),
                          timeLabelTextStyle: TextStyle(
                            color: Colors.transparent,
                          ),
                          thumbColor: Color(0xff3E40D3),
                          progressBarColor: Color(0xff3E40D3),
                          progress: Duration(milliseconds: 5),
                          // buffered: Duration(milliseconds: 2000),
                          total: Duration(milliseconds: 50),
                          onSeek: (duration) {
                            print('User selected a new time: $duration');
                          },
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            width: 63.w,
                            height: 63.h,
                            child: Image.asset(
                                "assets/images/NoPath - Copy (14).png"),
                          ),
                          20.horizontalSpace,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Stuck With You",
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              3.verticalSpace,
                              Text(
                                "Justin Bieber",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w100,
                                ),
                              ),
                            ],
                          ),
                          30.horizontalSpace,
                          Container(
                            width: 13.w,
                            height: 13.h,
                            child: Image.asset(
                                "assets/images/Icon ionic-md-skip-forward-1.png"),
                          ),
                          16.horizontalSpace,
                          Container(
                            width: 46.w,
                            height: 46.h,
                            child: Image.asset("assets/images/Group 1439.png"),
                          ),
                          16.horizontalSpace,
                          Container(
                            width: 13.w,
                            height: 13.h,
                            child: Image.asset(
                                "assets/images/Icon ionic-md-skip-forward.png"),
                          ),
                        ],
                      ),
                      30.verticalSpace,
                      Stack(
                        alignment: Alignment.center,
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            width: 350.w,
                            height: 1,
                            color: Colors.grey,
                          ),
                          GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () {
                              Get.toNamed("/SPOTIFYScreen");
                            },
                            child: Container(
                              width: 142.w,
                              height: 37.h,
                              decoration: BoxDecoration(
                                color: Color(0xff002B7A).withOpacity(0.7),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      child: Image.asset(
                                        "assets/images/Icon awesome-spotifyGreen.png",
                                        scale: 5,
                                      ),
                                    ),
                                    5.horizontalSpace,
                                    Text(
                                      "Open Spotify",
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      20.verticalSpace,
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      key: formKey,
      drawer: DrawerScreen(),
      appBar: AppBar(
        title: GetBuilder<BottomController>(builder: (controlller) {
          return Text(
            pages[controlller.navigationBarIndexValue].title.toUpperCase(),
            style: TextStyle(fontSize: 16.sp),
          );
        }),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(18),
          ),
        ),
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            formKey.currentState!.openDrawer();
          },
          child: Container(
              child: Image.asset(
            "assets/images/Group 16.png",
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
        actions: [
          GetBuilder<BottomController>(builder: (controller) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  if (controller.navigationBarIndexValue != 2) ...[
                    GestureDetector(
                      onTap: () {
                        Get.toNamed("/SEARCHScreen");
                      },
                      child: Container(
                        child: Image.asset(
                          "assets/images/Icon feather-search.png",
                          scale: 4,
                        ),
                      ),
                    ),
                    8.horizontalSpace,
                  ],
                  GestureDetector(
                    onTap: () {
                      Get.toNamed("/NOTIFICATIONSScreen");
                    },
                    child: Container(
                      child: Image.asset(
                        "assets/images/Group 1377.png",
                        scale: 4,
                      ),
                    ),
                  ),
                ],
              ),
            );
          })
        ],
      ),
      backgroundColor: Colors.white,
      body: GetBuilder<BottomController>(
        builder: (controller) => DisAllowIndicatorWidget(
            child: pages[controller.navigationBarIndexValue].page),
      ),
      bottomNavigationBar: GetBuilder<BottomController>(
        builder: (_) => buildMyNavBar(context),
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff1CC8FB),
              Color(0xff004DF2),
            ],
          ),
        ),
        child: FloatingActionButton(
          backgroundColor: Colors.transparent,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => CameraCamera(
                  onFile: (file) {
                    photos.add(file);
                    //When take foto you should close camera
                    Navigator.pop(context);
                    setState(() {});
                  },
                ),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(),
            child: Icon(
              Icons.camera_alt_rounded,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      resizeToAvoidBottomInset: false,
    );
  }

  buildMyNavBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.r, vertical: 10.r),
      margin: EdgeInsets.only(left: 10.r, right: 10.r, bottom: 10.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff1CC8FB),
            Color(0xff004DF2),
          ],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              20.horizontalSpace,
              bottomTabItem(0),
              15.horizontalSpace,
              bottomTabItem(1),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              bottomTabItem(2),
              15.horizontalSpace,
              bottomTabItem(3),
              20.horizontalSpace
            ],
          )
        ],
      ),
    );
  }

  bottomTabItem(index) {
    return IconButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        setState(() {
          _onItemTapped(index);
        });
        if (index == 3) {
          spotifyBottomSheetOpen();
        }
        // Get.to(() => MainScreen());
      },
      icon: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            pages[index].tabIcon,
            color: bottomcontroller.navigationBarIndexValue == index
                ? Colors.white
                : Color(0xff80c1fa),
            width: 22.5.r,
            height: 22.5.r,
          ),
          Text(
            index == 3 ? 'Spotify' : pages[index].title,
            style: TextStyle(
              fontSize: 12.sp,
              color: bottomcontroller.navigationBarIndexValue == index
                  ? Colors.white
                  : Color(0xff80c1fa),
            ),
          )
        ],
      ),
    );
  }
}

class NavigationDataListModel {
  String title;
  String tabIcon;
  Widget page;
  NavigationDataListModel(this.title, this.tabIcon, this.page);
}
