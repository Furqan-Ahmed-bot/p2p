import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http_parser/http_parser.dart';

import 'package:http/http.dart' as http;

import '../export_all.dart';

String apiGlobal = "https://p2p-api.thesuitchstaging.com:2700";
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
      var request = http.MultipartRequest('POST', uri);
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

      // var response = await request.send();
      log('After send request');

      final http.StreamedResponse res = await request.send();
      ;
      // var res_data = json.decode(res.body.toString());

      if (res.statusCode == 200) {
        Get.back();
        print("PRofile picture" + file.toString());
        print("CreateProfile" + res.toString());
        final bottomcontroller = Get.put(BottomController());
        bottomcontroller.navBarChange(0);
        Get.to(() => MainScreen());
      } else {
        Get.snackbar('Error', 'Error',
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
}
