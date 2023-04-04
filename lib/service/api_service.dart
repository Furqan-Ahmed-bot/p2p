import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http_parser/http_parser.dart';

import 'package:http/http.dart' as http;

import '../export_all.dart';

final String apiGlobal = "https://p2p-api.thesuitchstaging.com:2700";
// String imageGlobal = "https://api1.jumppace.com:3060";
// String apiUrl = "wss://api1.jumppace.com:3060/";

class ApiService {
  //REGISTERATION / SIGN UP API METHOD
  callRegister(context, data) async {
    // final usercontroller = Get.put(UserController());
    ////print(data);
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return spinkit;
        });

    final uri = Uri.parse('${apiGlobal}/register');

    final headers = {'Content-Type': 'application/json'};
    String jsonBody = json.encode(data);

    http.Response response = await http.post(
      uri,
      headers: headers,
      body: jsonBody,
    );

    var res_data = json.decode(response.body.toString());
    // Map<String, dynamic> userMap = jsonDecode(response.body.toString());
    // var user = UserModel.fromJson(userMap);
    // //print(user.userEmail);

    // old code
    if (res_data['status']!) {
      Get.back();
      Get.snackbar('Success', res_data['message'],
          snackPosition: SnackPosition.TOP,
          duration: Duration(seconds: 3),
          backgroundGradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xff1CC8FB),
              Color(0xff004DF2),
            ],
          ),
          colorText: Colors.white);
      Get.to(() => VerificationScreen());
    } else {
      Get.back();

      Get.snackbar('Error', res_data['message'],
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3),
          colorText: Colors.black);
    }
  }

  //OTP VERIFICATION API
  otpCall(context, data) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return spinkit;
        });

    final uri = Uri.parse('${apiGlobal}/verify_otp');

    final headers = {'Content-Type': 'application/json'};
    String jsonBody = json.encode(data);

    http.Response response = await http.post(
      uri,
      headers: headers,
      body: jsonBody,
    );

    var res_data = json.decode(response.body.toString());
    // Map<String, dynamic> userMap = jsonDecode(response.body.toString());
    // var user = UserModel.fromJson(userMap);
    // //print(user.userEmail);

    // old code
    if (res_data['status']!) {
      Get.back();
      Get.snackbar('Success', res_data['message'],
          snackPosition: SnackPosition.TOP,
          duration: Duration(seconds: 3),
          backgroundGradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xff1CC8FB),
              Color(0xff004DF2),
            ],
          ),
          colorText: Colors.white);
      authToken = res_data['data']['authToken'];
      refreshToken = res_data['data']['refreshToken'];
      log(authToken.toString() + '\n');
      log(refreshToken.toString() + '\n');
      otpId = forgotPassword ? res_data['data']['otpId'] : '';
      forgotPassword
          ? Get.to(() => const ResetPasswordScreen())
          : Get.to(() => const CreateProfileScreen());
    } else {
      Get.back();

      Get.snackbar('Error', res_data['message'],
          snackPosition: SnackPosition.TOP,
          duration: Duration(seconds: 3),
          backgroundGradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xff1CC8FB),
              Color(0xff004DF2),
            ],
          ),
          colorText: Colors.white);
    }
  }

  //RESEND OTP API
  resendOtpCall(context, data) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return spinkit;
        });

    final uri = Uri.parse('${apiGlobal}/resend_otp');

    final headers = {'Content-Type': 'application/json'};
    String jsonBody = json.encode(data);

    http.Response response = await http.post(
      uri,
      headers: headers,
      body: jsonBody,
    );

    var res_data = json.decode(response.body.toString());
    // Map<String, dynamic> userMap = jsonDecode(response.body.toString());
    // var user = UserModel.fromJson(userMap);
    // //print(user.userEmail);

    // old code
    if (res_data['status']!) {
      Get.back();
      Get.snackbar('Success', res_data['message'],
          snackPosition: SnackPosition.TOP,
          duration: Duration(seconds: 3),
          backgroundGradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xff1CC8FB),
              Color(0xff004DF2),
            ],
          ),
          colorText: Colors.white);
      Get.close(1);
      Get.to(() => const VerificationScreen());
    } else {
      Get.back();

      Get.snackbar('Error', res_data['message'],
          snackPosition: SnackPosition.TOP,
          duration: Duration(seconds: 3),
          backgroundGradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xff1CC8FB),
              Color(0xff004DF2),
            ],
          ),
          colorText: Colors.white);
    }
  }

  //CREATE PROFILE API
  callCreateProfile(context, data, File file) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return spinkit;
        });
    final uri = Uri.parse('${apiGlobal}/profile');
    try {
      var request = http.MultipartRequest('PUT', uri);
      final headers = {
        'Authorization': authToken.toString(),
        'refreshtoken': refreshToken.toString(),
        'Content-Type': 'multipart/form-data',
        'deviceToken': deviceToken.toString(),
        'extname': file.path.split('.').last.toString()
      };

      request.fields.addAll(data);

      var multipartFile = await http.MultipartFile.fromPath(
        'image',
        file.path,
        filename: file.path.split('/').last,

        contentType: MediaType(
            'image',
            file.path
                .split('.')
                .last
                .toString()), //${file.path.split('.').last}
      );
      request.files.add(multipartFile);
      log('Before add header');
      request.headers.addAll(headers);
      log('After add header');

      request.headers.addAll(headers);
      var response = await request.send();

      final res = await http.Response.fromStream(response);
      var res_data = json.decode(res.body.toString());

      if (res_data['status'] == 200) {
        Get.back();

        final bottomcontroller = Get.put(BottomController());
        bottomcontroller.navBarChange(0);
        Get.to(() => MainScreen());
      } else {
        Get.back();
        Get.snackbar('Error', res_data['message'],
            snackPosition: SnackPosition.TOP,
            colorText: Colors.white,
            backgroundGradient: LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xff1CC8FB),
                Color(0xff004DF2),
              ],
            ));
      }
    } catch (e) {
      Get.back();
      // log(e.toString());
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.TOP,
        backgroundGradient: LinearGradient(
          begin: Alignment.bottomRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xff1CC8FB),
            Color(0xff004DF2),
          ],
        ),
        colorText: Colors.white,
      );
    }
  }

  ///LOGIN API
  callLogin(context, data) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return spinkit;
        });

    final uri = Uri.parse('${apiGlobal}/login');
    final headers = {'Content-Type': 'application/json'};
    String jsonBody = json.encode(data);

    http.Response response = await http.post(
      uri,
      headers: headers,
      body: jsonBody,
    );
    var res_data = json.decode(response.body.toString());
    try {
      if (response.statusCode == 301) {
        authToken = res_data['data']['authToken'];
        refreshToken = res_data['data']['refreshToken'];
        Get.back();
        Get.to(() => const CreateProfileScreen());
        return;
      } else if (res_data['status'] == true) {
        Get.back();
        log('Login ${res_data.toString()}');

        final bottomcontroller = Get.put(BottomController());
        bottomcontroller.navBarChange(0);
        Get.to(() => MainScreen());
      } else if (!res_data['status'] == true) {
        Get.back();
        Get.snackbar('Error', res_data['message'],
            snackPosition: SnackPosition.TOP,
            colorText: Colors.white,
            backgroundGradient: LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xff1CC8FB),
                Color(0xff004DF2),
              ],
            ));
      }
    } catch (e) {
      log(e.toString());
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.TOP,
        backgroundGradient: LinearGradient(
          begin: Alignment.bottomRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xff1CC8FB),
            Color(0xff004DF2),
          ],
        ),
        colorText: Colors.white,
      );
    }
  }

  ///FORGOT PASSWORD API
  callForgetPassword(context, data) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return spinkit;
        });

    final uri = Uri.parse('${apiGlobal}/forget_password');
    final headers = {'Content-Type': 'application/json'};
    String jsonBody = json.encode(data);

    http.Response response = await http.post(
      uri,
      headers: headers,
      body: jsonBody,
    );
    var res_data = json.decode(response.body.toString());
    try {
      if (res_data['status']) {
        Get.back();
        log('ForgetPass ${res_data.toString()}');

        // refreshToken = res_data['data']['refreshToken'];
        Get.snackbar(
          'Success',
          res_data['message'],
          snackPosition: SnackPosition.TOP,
          backgroundGradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xff1CC8FB),
              Color(0xff004DF2),
            ],
          ),
          colorText: Colors.white,
        );
        forgotPassword = true;
        Get.to(() => VerificationScreen());
      }
      if (!res_data['status']) {
        Get.back();

        Get.snackbar(
          'Error',
          res_data['message'],
          snackPosition: SnackPosition.TOP,
          backgroundGradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xff1CC8FB),
              Color(0xff004DF2),
            ],
          ),
          colorText: Colors.white,
        );
      }
    } catch (e) {
      log(e.toString());
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.TOP,
        backgroundGradient: LinearGradient(
          begin: Alignment.bottomRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xff1CC8FB),
            Color(0xff004DF2),
          ],
        ),
        colorText: Colors.white,
      );
    }
  }

  ///RESET PASSWORD API
  callResetPassword(context, data) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return spinkit;
        });

    final uri = Uri.parse('${apiGlobal}/resetpassword');
    final headers = {
      'Authorization': authToken.toString(),
      'refreshtoken': refreshToken.toString(),
      'Content-Type': 'application/json',
    };
    String jsonBody = json.encode(data);

    http.Response response = await http.post(
      uri,
      headers: headers,
      body: jsonBody,
    );
    var res_data = json.decode(response.body.toString());
    try {
      if (res_data['status']) {
        Get.back();

        Get.snackbar(
          'Success',
          res_data['message'],
          snackPosition: SnackPosition.TOP,
          backgroundGradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xff1CC8FB),
              Color(0xff004DF2),
            ],
          ),
          colorText: Colors.white,
        );
        Get.to(() => LoginScreen());
      }
      if (!res_data['status']) {
        Get.back();

        Get.snackbar(
          'Error',
          res_data['message'],
          snackPosition: SnackPosition.TOP,
          backgroundGradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xff1CC8FB),
              Color(0xff004DF2),
            ],
          ),
          colorText: Colors.white,
        );
      }
    } catch (e) {
      log(e.toString());
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.TOP,
        backgroundGradient: LinearGradient(
          begin: Alignment.bottomRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xff1CC8FB),
            Color(0xff004DF2),
          ],
        ),
        colorText: Colors.white,
      );
    }
  }
}
