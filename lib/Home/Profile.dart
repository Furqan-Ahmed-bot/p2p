import 'package:p2ptraffic/export_all.dart';

import '../controller/usercontroller.dart';
import 'edit_profile_screen.dart';

class PROFILE2Screen extends StatefulWidget {
  const PROFILE2Screen({super.key});

  @override
  State<PROFILE2Screen> createState() => _PROFIL2EScreenState();
}

class _PROFIL2EScreenState extends State<PROFILE2Screen> {
  final usercontroller = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          padding: EdgeInsets.symmetric(horizontal: 20.r, vertical: 20.r),
          children: [
            Container(
              width: 143.r,
              height: 143.r,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                  gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color(0xff004DF2),
                      Color(0xff1CC8FB),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 1,
                    )
                  ]),
              child: GestureDetector(
                onTap: () {
                  Get.toNamed("/DrawerProfileScreen");
                },
                child: CircleAvatar(
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
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                'https://p2p-api.thesuitchstaging.com:2700/public/uploads/${UserController.user.data!.image}'))),
                    // child: Image(
                    //     fit: BoxFit.fill,
                    //     image: NetworkImage(
                    //         'https://p2p-api.thesuitchstaging.com:2700/public/uploads/${UserController.user.data!.image}'))
                  ),
                ),
              ),
            ),
            27.verticalSpace,
            Text(
              UserController.user.data!.fullName.toString(),
              style: TextStyle(
                color: Color(
                  0xff3A3A3A,
                ),
                fontSize: 25.sp,
              ),
            ),
            27.verticalSpace,
            contts(
              "assets/images/Icon material-email.png",
              email.toString(),
            ),
            15.verticalSpace,
            contts(
              "assets/images/Icon feather-phone.png",
              UserController.user.data!.mobile.toString(),
            ),
            15.verticalSpace,
            contts(
              "assets/images/Icon awesome-transgender.png",
              UserController.user.data!.gender.toString(),
            ),
            // 15.verticalSpace,
            // contts("assets/images/Icon material-location-onn.png",
            //     '${UserAddress}'),
            15.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 188.w,
                  height: 55.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(255, 0, 0, 0.06),
                        spreadRadius: 0,
                        blurRadius: 7,
                        offset: Offset(0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      20.horizontalSpace,
                      10.horizontalSpace,
                      Text(
                        UserController.user.data!.city.toString(),
                        style: TextStyle(
                          color: Color(0xff0C0D26),
                          fontSize: 16.sp,
                        ),
                      ),
                      65.horizontalSpace,
                    ],
                  ),
                ),
                Container(
                  width: 188.w,
                  height: 55.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(255, 0, 0, 0.06),
                        spreadRadius: 0,
                        blurRadius: 7,
                        offset: Offset(0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      20.horizontalSpace,
                      10.horizontalSpace,
                      Text(
                        UserController.user.data!.state.toString(),
                        style: TextStyle(
                          color: Color(0xff0C0D26),
                          fontSize: 16.sp,
                        ),
                      ),
                      // 65.horizontalSpace,
                    ],
                  ),
                ),
              ],
            ),
            50.verticalSpace,
            GestureDetector(
              onTap: () {
                Get.to(EditProfileScreen(
                  phone: UserController.user.data!.mobile.toString(),
                ));
                //Get.toNamed("/EditProfileScreen");
              },
              child: Container(
                width: 387.w,
                height: 60.h,
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
                        "Edit Profile",
                        style: TextStyle(color: Colors.white, fontSize: 18.sp),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  contts(
    img,
    txt,
  ) {
    return Container(
      width: 1.sw,
      height: 57,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(255, 0, 0, 0.06),
            spreadRadius: 0,
            blurRadius: 7,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            20.horizontalSpace,
            Container(
              width: 20.w,
              height: 16.h,
              child: Image.asset(
                img,
              ),
            ),
            10.horizontalSpace,
            Container(
              width: 0.7.sw,
              child: Text(
                txt,
                style: TextStyle(
                    color: Color(0xff878B9E),
                    fontSize: 17.sp,
                    overflow: TextOverflow.visible),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
