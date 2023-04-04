import 'package:p2ptraffic/export_all.dart';

class FORGOTPASSWORDScreen extends StatefulWidget {
  const FORGOTPASSWORDScreen({super.key});

  @override
  State<FORGOTPASSWORDScreen> createState() => _FORGOTPASSWORDScreenState();
}

class _FORGOTPASSWORDScreenState extends State<FORGOTPASSWORDScreen> {
  bool isChecked = false;
  bool isChecked2 = false;
  final userNamePhoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      decoration: pageDecoration,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
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
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Text(
            "FORGOT PASSWORD",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 16.sp),
          ),
          centerTitle: true,
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.all(20.r),
          child: GestureDetector(
            onTap: () {
              Get.to(() => LoginScreen());
            },
            child: RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.black,
                ),
                children: <TextSpan>[
                  TextSpan(
                      text: 'Already have an account? ',
                      style: TextStyle(color: Colors.white, fontSize: 14)),
                  TextSpan(
                      text: 'Login',
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
        body: DisAllowIndicatorWidget(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 40.r, vertical: 20.r),
            children: [
              78.verticalSpace,
              Container(
                width: 184.w,
                height: 66.h,
                child: Image.asset("assets/images/Group 1370.png"),
              ),
              119.verticalSpace,
              CustomTextFieldWidget(
                  labelText: 'Username / Phone',
                  controller: userNamePhoneController),
              50.verticalSpace,
              CustomButtonWidget(
                  text: "Continue",
                  onTap: () {
                    final Map<String, String> data = {
                      "email": userNamePhoneController.text.trim()
                    };
                    email = userNamePhoneController.text.trim();
                    ApiService().callForgetPassword(context, data);
                  }),
            ],
          ),
        ),
      ),
    );
  }

  TextField() {
    return Container(
      width: 348.w,
      height: 55.h,
      decoration: BoxDecoration(
        color: Colors.white,
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.grey.withOpacity(0.2),
        //     spreadRadius: 5,
        //     blurRadius: 7,
        //     offset: Offset(0, 3), // changes position of shadow
        //   ),
        // ],
        border: Border.all(color: Color(0xffDCDFE2), width: 2.sp),
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 30),
          // hintText: txt,
          hintStyle: TextStyle(color: Colors.black, fontSize: 16.sp),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Names(
    txt,
  ) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Text(
            txt,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
            ),
          ),
        )
      ],
    );
  }

  TextField1(
    txt,
    Img,
  ) {
    return Container(
      width: 348.w,
      height: 55.h,
      decoration: BoxDecoration(
        color: Colors.white,
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.grey.withOpacity(0.2),
        //     spreadRadius: 5,
        //     blurRadius: 7,
        //     offset: Offset(0, 3), // changes position of shadow
        //   ),
        // ],
        border: Border.all(color: Color(0xffDCDFE2), width: 2.sp),
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 30, top: 10),
          hintText: txt,
          suffixIcon: Container(
            child: Image.asset(
              Img,
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
