import '../export_all.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  bool isChecked = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
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
              Get.to(() => PreLoginScreen());
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
            "LOGIN",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 16.sp),
          ),
          centerTitle: true,
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.r, vertical: 20.r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () {
                  Get.to(() => SignupScreen());
                },
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Dont have an account? ',
                          style: TextStyle(color: Colors.white, fontSize: 14)),
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
            ],
          ),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 40.r),
          // physics: NeverScrollableScrollPhysics(),
          children: [
            78.verticalSpace,
            Container(
              width: 184.w,
              height: 66.h,
              child: Image.asset("assets/images/Group 1370.png"),
            ),
            119.verticalSpace,
            CustomTextFieldWidget(
              controller: emailController,
              hintText: "martin.smith@email.com",
              labelText: "Email Adress",
            ),
            20.verticalSpace,
            CustomTextFieldWidget(
              controller: passwordController,
              labelText: "Password",
              isPassword: true,
            ),
            35.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Checkbox(
                        visualDensity: const VisualDensity(horizontal: -4.0),
                        side: AlwaysActiveBorderSide2(),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                        checkColor: Colors.black,
                        fillColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                          if (states.contains(MaterialState.disabled)) {
                            return Colors.white;
                          }
                          return Colors.white;
                        }),

                        // activeColor: Colors.white,
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        }),
                    Text(
                      "Remember Me",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    // Get.toNamed("/FORGOTPASSWORDScreen");
                    Get.to(() => FORGOTPASSWORDScreen());
                  },
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
            51.verticalSpace,
            CustomButtonWidget(
                text: "Login",
                onTap: () {
                  final bottomcontroller = Get.put(BottomController());
                  bottomcontroller.navBarChange(0);
                  Get.to(() => MainScreen());
                })
          ],
        ),
      ),
    );
  }

  TextField(
    txt,
  ) {
    return Container(
      width: 348.w,
      height: 55.h,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color(0xffDCDFE2), width: 2.sp),
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 30),
          hintText: txt,
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
          padding: const EdgeInsets.only(left: 55),
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
        obscureText: true,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 30, top: 10),
          hintText: txt,
          suffixIcon: Container(
            child: Image.asset(
              "assets/images/Icon ionic-md-eye-off.png",
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
