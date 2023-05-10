import '../export_all.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _CREATEPROFILEStateScreen();
}

class _CREATEPROFILEStateScreen extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "EDIT PROFILE",
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
          padding:
              EdgeInsets.only(top: 75.r, bottom: 30.r, left: 20.r, right: 20.r),
          children: [
            Stack(
              children: [
                Container(
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
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 70,
                    // backgroundColor: Color(0xff004DF2),
                    child: CircleAvatar(
                      // backgroundColor: Color(0xff21CDFB),
                      child: Padding(
                        padding: EdgeInsets.all(0),
                        child: Image(
                          image: AssetImage("assets/images/NoPath.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      radius: 60,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: -20,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        begin: Alignment.bottomRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Color(0xff1CC8FB),
                          Color(0xff004DF2),
                        ],
                      ),
                      border: Border.all(color: Color(0xffF6F6F6)),
                    ),
                    height: 40.h,
                    child: RawMaterialButton(
                      // highlightColor: Color(0xff21CDFB),
                      onPressed: () {},
                      elevation: 1,
                      // fillColor: Color(0xff21CDFB),

                      child: Image.asset(
                        "assets/images/Icon ionic-ios-reverse-camera.png",
                        scale: 4,
                      ),
                      // padding: EdgeInsets.all(2),
                      // shape: CircleBorder(),
                    ),
                  ),
                ),
              ],
            ),
            49.verticalSpace,
            TextField(
              "Julie Smith",
              "Full Name",
              "assets/images/Icon awesome-user.png",
            ),
            20.verticalSpace,
            TextField(
              "Julie.smith@domain.com",
              "Email Address",
              "assets/images/Icon material-email.png",
            ),
            20.verticalSpace,
            TextField(
              "Julie.smith@domain.com",
              "Email Address",
              "assets/images/Icon feather-phone.png",
            ),
            20.verticalSpace,
            TextFieldDropdown(
              "Female",
              "Gender",
              "assets/images/Icon awesome-transgender.png",
            ),
            20.verticalSpace,
            TextField(
              "20 Cooper Square",
              "Address",
              "assets/images/Icon material-location-onn.png",
            ),
            20.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmallTextField(
                  "New York",
                  "City",
                ),
                SmallTextFieldDropdown(
                  "State",
                  "NY",
                )
              ],
            ),
            40.verticalSpace,
            GestureDetector(
              onTap: () {
                final bottomcontroller = Get.put(BottomController());
                bottomcontroller.navBarChange(0);
                Get.to(() => MainScreen());
              },
              child: Container(
                width: 388.w,
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
                        "Save",
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

  TextField(
    txt,
    txt2,
    img,
  ) {
    return Container(
      width: 388.w,
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
      child: TextFormField(
        decoration: InputDecoration(
          // contentPadding: EdgeInsets.only(left: 1),
          contentPadding: EdgeInsets.only(
            top: 6,
            bottom: 10,
          ),
          hintText: txt,
          label: Text(
            txt2,
            style: TextStyle(color: Color(0xffA2A5B7), fontSize: 12.sp),
          ),
          prefixIcon: Container(
            width: 30,
            child: Image.asset(
              img,
              scale: 5,
            ),
          ),
          hintStyle: TextStyle(color: Colors.black, fontSize: 16.sp),
          border: InputBorder.none,
        ),
      ),
    );
  }

  TextFieldDropdown(
    txt,
    txt2,
    img,
  ) {
    return Container(
      width: 388.w,
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
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(
            top: 6,
            bottom: 10,
          ),
          hintText: txt,
          label: Text(
            txt2,
            style: TextStyle(color: Color(0xffA2A5B7), fontSize: 12.sp),
          ),
          prefixIcon: Container(
            width: 30,
            child: Image.asset(
              img,
              scale: 5,
            ),
          ),
          suffixIcon: Container(
            child: Image.asset(
              "assets/images/Icon ionic-ios-arrow-down.png",
              scale: 5,
            ),
          ),
          hintStyle: TextStyle(color: Colors.black, fontSize: 16.sp),
          border: InputBorder.none,
        ),
      ),
    );
  }

  SmallTextField(
    txt,
    txt2,
  ) {
    return Container(
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
      child: TextFormField(
        decoration: InputDecoration(
          // contentPadding: EdgeInsets.only(left: 1),
          contentPadding: EdgeInsets.only(
            top: 6,
            bottom: 10,
            left: 15,
          ),
          hintText: txt,
          label: Text(
            txt2,
            style: TextStyle(color: Color(0xffA2A5B7), fontSize: 12.sp),
          ),
          // prefixIcon: Container(
          //   width: 5,
          //   // child: Image.asset(
          //   //   img,
          //   //   scale: 5,
          //   // ),
          // ),
          hintStyle: TextStyle(color: Colors.black, fontSize: 16.sp),
          border: InputBorder.none,
        ),
      ),
    );
  }

  SmallTextFieldDropdown(
    txt,
    txt2,
  ) {
    return Container(
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
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(
            top: 6,
            bottom: 10,
            left: 15,
          ),
          hintText: txt,
          label: Text(
            txt2,
            style: TextStyle(color: Color(0xffA2A5B7), fontSize: 12.sp),
          ),
          // prefixIcon: Container(
          //   width: 30,
          //   child: Image.asset(
          //     img,
          //     scale: 5,
          //   ),
          // ),
          suffixIcon: Container(
            child: Image.asset(
              "assets/images/Icon ionic-ios-arrow-down.png",
              scale: 5,
            ),
          ),

          hintStyle: TextStyle(color: Colors.black, fontSize: 16.sp),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
