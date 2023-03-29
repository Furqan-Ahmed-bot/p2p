



import '../export_all.dart';


class DrawerScreen extends StatelessWidget {
  const DrawerScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.9.sw,
      height: 0.95.sh,
      child: Drawer(
        backgroundColor: Colors.transparent,
        child: Container(
          width: 0.9.sw,
          height: 0.9.sh,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30.r),
              bottomRight: Radius.circular(30.r),
            ),
            gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Color(0xff3A74FA), Color(0xff1D3A7D)]),
          ),
          child: SingleChildScrollView(
            child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30.r),
                  ),
                ),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 50.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage("assets/images/Rectangle 1370.png"), fit: BoxFit.cover),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30.r),
                          ),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            child: Image.asset(
                              "assets/images/Icon ionic-ios-close.png",
                              scale: 5,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Padding(
                      //   padding: const EdgeInsets.only(right: 21),
                      //   child: Image.asset(
                      //     "assets/images/Path 27555.png",
                      //     scale: 1.4,
                      //   ),
                      // ),
                    ],
                  ),
                  SizedBox(
                    height: 9.h,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 143.w,
                      height: 143.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          begin: Alignment.bottomRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Color(0xff004DF2),
                            Color(0xff1CC8FB),
                          ],
                        ),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed("/DrawerProfileScreen");
                        },
                        child: Container(
                          child: Image.asset(
                            "assets/images/NoPath.png",
                            scale: 4.3,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 21.h,
                  ),
                  Text(
                    "Martin Smith",
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: Color(0xff02045C),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "martinSmith@email.com",
                    style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                  ),
                  SizedBox(height: 20.h),
                ]),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30.r),
                  ),
                  gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Color(0xff004DF2), Color(0xff21CDFB)]),
                ),
                child: Column(children: [
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: ListTile(
                      visualDensity: VisualDensity(vertical: -4),
                      leading: ImageIcon(
                        AssetImage(
                          "assets/images/Icon awesome-home.png",
                        ),
                        size: 20,
                        color: Colors.white,
                      ),
                      title: GestureDetector(
                        onTap: () {
                          final bottomcontroller = Get.put(BottomController());
                          bottomcontroller.navBarChange(0);
                          Get.to(() => MainScreen());
                        },
                        child: Text(
                          "Home",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                  5.verticalSpace,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: ListTile(
                      visualDensity: VisualDensity(vertical: -4),
                      leading: ImageIcon(
                        AssetImage(
                          "assets/images/Icon metro-user-check.png",
                        ),
                        size: 20,
                        color: Colors.white,
                      ),
                      title: GestureDetector(
                        onTap: () {
                          Get.to(() => DrawerProfileScreen());
                        },
                        child: Text(
                          "My Profile",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                  5.verticalSpace,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: ListTile(
                      visualDensity: VisualDensity(vertical: -4),
                      leading: ImageIcon(
                        AssetImage(
                          "assets/images/Icon material-rss-feed.png",
                        ),
                        size: 20,
                        color: Colors.white,
                      ),
                      title: GestureDetector(
                        onTap: () {
                          final bottomcontroller = Get.put(BottomController());
                          bottomcontroller.navBarChange(1);
                          Get.to(() => MainScreen());
                        },
                        child: Text(
                          "Feeds",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                  5.verticalSpace,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: ListTile(
                      visualDensity: VisualDensity(vertical: -4),
                      leading: ImageIcon(
                        AssetImage(
                          "assets/images/Icon awesome-spotify.png",
                        ),
                        size: 20,
                        color: Colors.white,
                      ),
                      title: GestureDetector(
                        onTap: () {
                          Get.to(() => SPOTIFYScreen());
                        },
                        child: Text(
                          "Spotify",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                  5.verticalSpace,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: ListTile(
                      visualDensity: VisualDensity(vertical: -4),
                      leading: ImageIcon(
                        AssetImage(
                          "assets/images/Icon awesome-user-friends.png",
                        ),
                        size: 20,
                        color: Colors.white,
                      ),
                      title: GestureDetector(
                        onTap: () {
                          Get.to(() => FRIENDSScreen());
                        },
                        child: Text(
                          "Friends",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                  5.verticalSpace,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: ListTile(
                      visualDensity: VisualDensity(vertical: -4),
                      leading: ImageIcon(
                        AssetImage(
                          "assets/images/Icon ionic-ios-add-circle.png",
                        ),
                        size: 20,
                        color: Colors.white,
                      ),
                      title: GestureDetector(
                        onTap: () {
                          Get.to(() => FriendRequestsScreen());
                        },
                        child: Text(
                          "Friends Request",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                  5.verticalSpace,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: ListTile(
                      visualDensity: VisualDensity(vertical: -4),
                      leading: ImageIcon(
                        AssetImage(
                          "assets/images/Icon awesome-bell.png",
                        ),
                        size: 20,
                        color: Colors.white,
                      ),
                      title: GestureDetector(
                        onTap: () {
                          Get.to(() => NOTIFICATIONSScreen());
                        },
                        child: Text(
                          "Notifications",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                  5.verticalSpace,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: ListTile(
                      visualDensity: VisualDensity(vertical: -4),
                      leading: ImageIcon(
                        AssetImage(
                          "assets/images/Icon material-subscriptions.png",
                        ),
                        size: 20,
                        color: Colors.white,
                      ),
                      title: GestureDetector(
                        onTap: () {
                          Get.to(() => SUBSCRIPTIONScreen());
                        },
                        child: Text(
                          "My Subscription",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                  5.verticalSpace,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: ListTile(
                      visualDensity: VisualDensity(vertical: -4),
                      leading: ImageIcon(
                        AssetImage(
                          "assets/images/Group 643.png",
                        ),
                        size: 20,
                        color: Colors.white,
                      ),
                      title: GestureDetector(
                        onTap: () {
                          final bottomcontroller = Get.put(BottomController());
                          bottomcontroller.navBarChange(3);
                          Get.to(() => MainScreen());
                        },
                        child: Text(
                          "My History",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                  5.verticalSpace,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: ListTile(
                      visualDensity: VisualDensity(vertical: -4),
                      leading: ImageIcon(
                        AssetImage(
                          "assets/images/Icon ionic-md-settings.png",
                        ),
                        size: 20,
                        color: Colors.white,
                      ),
                      title: GestureDetector(
                        onTap: () {
                          Get.to(() => SETTINGSScreen());
                        },
                        child: Text(
                          "Settings",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                  5.verticalSpace,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: ListTile(
                      visualDensity: VisualDensity(vertical: -4),
                      leading: ImageIcon(
                        AssetImage(
                          "assets/images/Icon material-live-help.png",
                        ),
                        size: 20,
                        color: Colors.white,
                      ),
                      title: GestureDetector(
                        onTap: () {
                          Get.to(() => HELPAndFEEDBACKScreen());
                        },
                        child: Text(
                          "Help & Feedback",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                  25.verticalSpace,
                  Row(
                    children: [
                      Container(
                        width: 268.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        child: ListTile(
                          visualDensity: VisualDensity(vertical: -4),
                          leading: Padding(
                            padding: const EdgeInsets.only(left: 35),
                            child: ImageIcon(
                              AssetImage(
                                "assets/images/Icon metro-exit.png",
                              ),
                              size: 20,
                              color: Color(0xff004DF2),
                            ),
                          ),
                          title: GestureDetector(
                            onTap: () {
                              Get.to(() => LoginScreen());
                            },
                            child: Text(
                              "Signout",
                              style: TextStyle(color: Color(0xff454750), fontSize: 15),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 85.h,
                  ),
                ]),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
