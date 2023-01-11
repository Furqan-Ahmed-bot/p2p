import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:p2ptraffic/Home/BottomController.dart';
import 'package:p2ptraffic/Home/Notifications.dart';
import 'package:p2ptraffic/Home/homeS.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final bottomcontroller = Get.put(BottomController());
  int pageIndex = 0;

  final pages = [
    HomeScreen(),
    Container(),
    Container(),
    Container(),
    Container(),
  ];
  void _onItemTapped(int index) {
    bottomcontroller.navBarChange(index);
  }

  @override
  Widget build(BuildContext context) {
    double res_height = MediaQuery.of(context).size.height;
    double res_width = MediaQuery.of(context).size.width;
    return Container(
      // decoration:
      //     BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20))),
      width: double.infinity,
      child: Scaffold(
        extendBody: true,
        // backgroundColor: Colors.transparent,
        backgroundColor: Color.fromARGB(239, 218, 255, 231),
        body: GetBuilder<BottomController>(
          builder: (_) => pages[bottomcontroller.navigationBarIndexValue],
        ),
        bottomNavigationBar: GetBuilder<BottomController>(
          builder: (_) => buildMyNavBar(context),
        ),
        floatingActionButton: Padding(
          padding: EdgeInsets.only(top: 10),
          child: Container(
              height: 80.h,
              width: 80.w,
              decoration: BoxDecoration(
                // border: Border.all(color: Colors.white),
                shape: BoxShape.circle,
              ),
              child: Container(
                child: Image.asset(
                  "assets/images/Group 1382.png",
                  scale: 3.5,
                ),
              )),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  buildMyNavBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          // width: 388.w,
          height: 70.h,

          // width: double.infinity,
          decoration: BoxDecoration(
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.grey.withOpacity(0.5),
            //     spreadRadius: 2,
            //     blurRadius: 50,
            //     offset: Offset(0, -8), // changes position of shadow
            //   ),
            // ],
            borderRadius: BorderRadius.circular(15
                // topLeft: Radius.circular(70),
                // topRight: Radius.circular(70),
                ),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color(0xff004DF2),
                Color(0xff1CC8FB),
              ],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _onItemTapped(0);
                    });

                    // Get.to(() => MainScreen());
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 22.5.w,
                        height: 22.5.h,
                        child: Image.asset(
                          "assets/images/Icon awesome-home.png",
                          color: bottomcontroller.navigationBarIndexValue == 0 ? Colors.white : Colors.grey.withOpacity(0.7),
                        ),
                      ),
                      Text(
                        "Home",
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: bottomcontroller.navigationBarIndexValue == 0 ? Colors.white : Colors.grey.withOpacity(0.7),
                        ),
                      )
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _onItemTapped(1);
                        });
                      },
                      child: Container(
                        width: 22.5.w,
                        height: 22.5.h,
                        child: Image.asset(
                          "assets/images/Icon material-rss-feed.png",
                          color: bottomcontroller.navigationBarIndexValue == 1 ? Colors.white : Colors.grey.withOpacity(0.7),
                        ),
                      ),
                    ),
                    Text(
                      "Feeds",
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: bottomcontroller.navigationBarIndexValue == 1 ? Colors.white : Colors.grey.withOpacity(0.7),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: 60.w,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _onItemTapped(3);
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 22.5.w,
                        height: 22.5.h,
                        child: Image.asset(
                          "assets/images/Icon awesome-history.png",
                          color: bottomcontroller.navigationBarIndexValue == 3 ? Colors.white : Colors.grey.withOpacity(0.7),
                        ),
                      ),
                      Text(
                        "History",
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: bottomcontroller.navigationBarIndexValue == 3 ? Colors.white : Colors.grey.withOpacity(0.7),
                        ),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _onItemTapped(4);
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 22.5.w,
                        height: 22.5.h,
                        child: Image.asset(
                          "assets/images/Icon awesome-spotify.png",
                          color: bottomcontroller.navigationBarIndexValue == 4 ? Colors.white : Colors.grey.withOpacity(0.7),
                        ),
                      ),
                      Text(
                        "Spotify",
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: bottomcontroller.navigationBarIndexValue == 4 ? Colors.white : Colors.grey.withOpacity(0.7),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
