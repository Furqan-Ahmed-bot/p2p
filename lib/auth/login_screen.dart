import 'package:shared_preferences/shared_preferences.dart';

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
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    loadUserEmailPassword();
    super.initState();
  }

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
          child: GestureDetector(
            onTap: () {
              Get.to(() => SignupScreen());
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
        ),
        body: DisAllowIndicatorWidget(
          child: Form(
            key: formKey,
            child: ListView(
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
                  validator: (txt) {
                    if (txt!.isEmpty) {
                      return "* Required";
                    } else if (!(isEmail(txt.toString()))) {
                      return "* Please enter valid email address";
                    } else
                      return null;
                  },
                ),
                20.verticalSpace,
                CustomTextFieldWidget(
                  controller: passwordController,
                  labelText: "Password",
                  isPassword: true,
                  validator: (txt) {
                    if (txt!.isEmpty) {
                      return "* Required";
                    } else
                      return null;
                  },
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
                          onChanged: (value) {
                            isChecked = value!;
                            SharedPreferences.getInstance().then(
                              (prefs) {
                                prefs.setBool("remember_me", value);
                                prefs.setString('email', emailController.text);
                                prefs.setString(
                                    'password', passwordController.text);
                              },
                            );
                            setState(() {
                              isChecked = value;
                            });
                          },
                        ),
                        Text(
                          "Remember Me",
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.white,
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
                      if (formKey.currentState!.validate()) {
                      
                        final Map<String, String> data = {
                          "email": emailController.text.trim(),
                          "password": passwordController.text.trim(),
                          "deviceType": deviceType.toString(),
                          "deviceToken": deviceToken.toString()
                        };
                        ApiService().callLogin(context, data);
                      }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }

  void handleRemeberme(bool value) {
    print("Handle Rember Me");
    isChecked = value;
    SharedPreferences.getInstance().then(
      (prefs) {
        prefs.setBool("remember_me", value);
        prefs.setString('email', emailController.text);
        prefs.setString('password', passwordController.text);
      },
    );
    setState(() {
      isChecked = value;
    });
  }

  void loadUserEmailPassword() async {
    print("Load Email");
    try {
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      var email = _prefs.getString("email") ?? "";
      var password = _prefs.getString("password") ?? "";
      var remeberMe = _prefs.getBool("remember_me") ?? false;

      if (remeberMe) {
        setState(() {
          isChecked = true;
        });
        emailController.text = email;
        passwordController.text = password;
      }
    } catch (e) {
      print(e);
    }
  }
}
