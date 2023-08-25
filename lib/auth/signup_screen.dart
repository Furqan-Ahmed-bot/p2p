import '../export_all.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SIGNUPScreenState();
}

class _SIGNUPScreenState extends State<SignupScreen> {
  bool isChecked = false;
  bool isChecked2 = false;
  final TextEditingController emailPhoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();

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
            "SIGNUP",
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
          child: Form(
            key: formKey,
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
                  labelText: "Email / Phone",
                  controller: emailPhoneController,
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
                  labelText: "Password",
                  controller: passwordController,
                  isPassword: true,
                  validator: (txt) {
                    if (txt!.isEmpty) {
                      return "* Required";
                    } else if (txt.length < 8) {
                      return "Password should be greater than 8 characters";
                    } else
                      return null;
                  },
                ),
                20.verticalSpace,

                
                CustomTextFieldWidget(
                    labelText: "Confirm Password",
                    controller: confirmPasswordController,
                    isPassword: true,
                    validator: (txt) {
                      if (txt!.isEmpty) {
                        return "* Required";
                      } else if (txt.toString() !=
                          passwordController.text.toString()) {
                        return "* Please enter correct password";
                      } else
                        return null;
                    }),
                50.verticalSpace,
                CustomButtonWidget(
                    text: 'Signup',
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        forgotPassword = false;
                        var data = {
                          "email": emailPhoneController.text.trim(),
                          "password": passwordController.text.trim(),
                          "deviceToken": deviceToken,
                          "deviceType": deviceType,
                          "long": longitude.toString(),
                          "lat": latitude.toString()
                        };
                        email = emailPhoneController.text.trim();
                        ApiService().callRegister(context, data);
                        // Get.to(() => const VerificationScreen());
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
