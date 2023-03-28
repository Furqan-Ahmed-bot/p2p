import '../export_all.dart';


class PreLoginScreen extends StatefulWidget {
  const PreLoginScreen({super.key});

  @override
  State<PreLoginScreen> createState() => _PRELOGINStateScreen();
}

class _PRELOGINStateScreen extends State<PreLoginScreen> {

 
  
  @override
  Widget build(BuildContext context) {
  //   final List preloginOptionList = [
  //   {
  //     'text' : "Login with Username",
  //     'icon' : '${imagePath}/Icon material-email.png',
  //     'color': Color(0xffEB6C0D),
  //     'route' :()=>function1(context)
  //   },
  //   {

  //   }
  // ];
    return Container(
      height: Get.height,
      width: Get.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/Mask Group 3.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Text(
            "PRE LOGIN",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 16.sp),
          ),
          centerTitle: true,
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              78.verticalSpace,
              Container(
                width: 184.w,
                height: 66.h,
                child: Image.asset("assets/images/Group 1370.png"),
              ),
              119.verticalSpace,
              GestureDetector(
                onTap: () {
                  // Function1();
                },
                child: Container(
                  width: 348.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                    color: Color(0xffEB6C0D),
                    border: Border.all(color: Color(0xffC6C8D2)),
                    // boxShadow: [
                    //   BoxShadow(
                    //     // color: Colors.grey.withOpacity(0.5),
                    //     // spreadRadius: 5,
                    //     // blurRadius: 0,
                    //     offset: Offset(0, 0), // changes position of shadow
                    //   ),
                    // ],
                    // border: Border.all(color: Colors.white, width: 3.sp),
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 17),
                          child: Container(
                            width: 16.w,
                            height: 13.h,
                            child: Image.asset(
                              "assets/images/Icon material-email.png",
                              color: Colors.white,
                            ),
                          ),
                        ),
                        // SizedBox(width: 17.h),
                        Text(
                          "Login with Username",
                          style:
                              TextStyle(color: Colors.white, fontSize: 18.sp),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              15.verticalSpace,
              GestureDetector(
                onTap: () {
                  final bottomcontroller = Get.put(BottomController());
                  bottomcontroller.navBarChange(0);
                  Get.to(() => MainScreen());
                },
                child: Container(
                  width: 348.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                    color: Color(0xff3155B8),
                    border: Border.all(color: Color(0xffC6C8D2)),
                    // boxShadow: [
                    //   BoxShadow(
                    //     // color: Colors.grey.withOpacity(0.5),
                    //     // spreadRadius: 5,
                    //     // blurRadius: 0,
                    //     offset: Offset(0, 0), // changes position of shadow
                    //   ),
                    // ],
                    // border: Border.all(color: Colors.white, width: 3.sp),
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 17),
                          child: Container(
                            width: 15.w,
                            height: 15.h,
                            child: Image.asset(
                                "assets/images/Icon ionic-logo-facebook.png"),
                          ),
                        ),
                        // SizedBox(width: 18.h),
                        Text(
                          "Login with Facebook",
                          style:
                              TextStyle(color: Colors.white, fontSize: 18.sp),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              15.verticalSpace,
              GestureDetector(
                onTap: () {
                  final bottomcontroller = Get.put(BottomController());
                  bottomcontroller.navBarChange(0);
                  Get.to(() => MainScreen());
                },
                child: Container(
                  width: 348.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                    color: Color(0xffCB1D1D),
                    border: Border.all(color: Color(0xffC6C8D2)),
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/Icon ionic-logo-google.png",
                          scale: 3.7,
                        ),
                        SizedBox(width: 24.h),
                        Container(
                          width: 190.w,
                          height: 30.h,
                          child: Text(
                            "Login with Google",
                            style:
                                TextStyle(color: Colors.white, fontSize: 18.sp),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              15.verticalSpace,
              GestureDetector(
                onTap: () {
                  final bottomcontroller = Get.put(BottomController());
                  bottomcontroller.navBarChange(0);
                  Get.to(() => MainScreen());
                },
                child: Container(
                  width: 348.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                    color: Color(0xff000000),
                    border: Border.all(color: Color(0xffC6C8D2)),
                    // boxShadow: [
                    //   BoxShadow(
                    //     // color: Colors.grey.withOpacity(0.5),
                    //     // spreadRadius: 5,
                    //     // blurRadius: 0,
                    //     offset: Offset(0, 0), // changes position of shadow
                    //   ),
                    // ],
                    // border: Border.all(color: Colors.white, width: 3.sp),
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/Icon metro-apple.png",
                          scale: 3.7,
                        ),
                        SizedBox(width: 25.h),
                        Container(
                          width: 190.w,
                          height: 30.h,
                          child: Text(
                            "Login with Google",
                            style:
                                TextStyle(color: Colors.white, fontSize: 18.sp),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              256.verticalSpace,
              GestureDetector(
                onTap: () {
                  Get.toNamed('/SIGNUPScreen');
                },
                child: Container(
                  child: Center(
                    child: RichText(
                      text: const TextSpan(
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Dont have an account? ',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14)),
                          TextSpan(
                              text: 'Signup',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.white,
                                decoration: TextDecoration.underline,
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  
}
