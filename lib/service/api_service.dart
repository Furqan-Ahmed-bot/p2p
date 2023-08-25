import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http_parser/http_parser.dart';

import 'package:http/http.dart' as http;
import 'package:p2ptraffic/controller/feedscontroller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path/path.dart' as path;
import '../Models/UserModel.dart';
import '../controller/myfeedscontroller.dart';
import '../controller/searchuserscontroller.dart';
import '../controller/usercontroller.dart';
import '../export_all.dart';

final String apiGlobal = "https://p2p-api.thesuitchstaging.com:2700/api/v1";

//final String apiGlobal = 'http://192.168.5.53:2700/api/v1';
// String imageGlobal = "https://api1.jumppace.com:3060";
// String apiUrl = "wss://api1.jumppace.com:3060/";

final usercontroller = Get.put(UserController());

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
    // String jsonBody = json.encode(data);

    http.Response response = await http.post(
      uri,
      body: data,
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
    if (res_data['status'] == true) {
      Get.back();

      usercontroller.User(UserModel.fromJson(res_data));

      authToken = res_data['data']['authToken'];
      refreshToken = res_data['data']['refreshToken'];
      log(authToken.toString() + '\n');
      log(refreshToken.toString() + '\n');
      //  Get.to(() => const ResetPasswordScreen());
      otpId = forgotPassword == true ? res_data['data']['otpId'] : '';
      forgotPassword
          ? Get.to(() => ResetPasswordScreen())
          : Get.to(() => CreateProfileScreen());
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
      Get.to(() => VerificationScreen());
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

      if (res_data['status'] == true) {
        Get.back();

        usercontroller.User(UserModel.fromJson(res_data));
        userName = res_data['data']['userName'];
        userImageUrl = res_data['data']['image'];
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
  callLogin(context, data, isChecked) async {
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
      // if (response.statusCode == 200) {
      //   authToken = res_data['data']['authToken'];
      //   refreshToken = res_data['data']['refreshToken'];
      //   Get.back();
      //   final bottomcontroller = Get.put(BottomController());
      //   bottomcontroller.navBarChange(0);
      //   Get.to(() => MainScreen());

      //   return;
      // } else

      if (res_data['status'] == true) {
        Get.back();

        SharedPreferences sp = await SharedPreferences.getInstance();
        if (isChecked) {
          sp.remove("userEmail");
          sp.remove("userPassword");

          sp.setString("userEmail", data["email"]);
          sp.setString("userPassword", data["password"]);
        } else {
          sp.remove("userEmail");
          sp.remove("userPassword");
        }
        log('Login ${res_data.toString()}');
        userName = res_data['data']['userName'];
        userImageUrl = res_data['data']['image'];
        authToken = res_data['data']['authToken'];
        refreshToken = res_data['data']['refreshToken'];
        usercontroller.User(UserModel.fromJson(res_data));

        final bottomcontroller = Get.put(BottomController());
        bottomcontroller.navBarChange(0);
        Get.to(() => MainScreen());
      } else if (res_data['status'] == false) {
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
      if (res_data['status'] == true) {
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

  Future<void> getfeeds({searchedLat, searchedLong}) async {
    final feedscontroller = Get.put(FeedsController());
    feedscontroller.setLoading(true);
    final uri = Uri.parse('${apiGlobal}/post/getfeeds');
    final headers = {
      'Authorization': authToken.toString(),
      'refreshToken': refreshToken.toString(),
      'deviceToken': deviceToken.toString(),
      'long':
          searchedLong == null ? longitude.toString() : searchedLong.toString(),
      'lat': searchedLat == null ? latitude.toString() : searchedLat.toString(),
      'radius': '100'
    };
    http.Response response = await http.get(uri, headers: headers);
    var resData = json.decode(response.body.toString());
    if (resData['status'] == true) {
      feedscontroller.setLoading(false);
      feedscontroller.getFeeds(resData['data']);
    }
  }

  searchuser(username) async {
    final searchusercontroller = Get.put(SearchUserController());
    searchusercontroller.setLoading(true);
    final uri = Uri.parse('${apiGlobal}/user/search/${username}');
    final headers = {
      'Authorization': authToken.toString(),
      'refreshToken': refreshToken.toString(),
      'deviceToken': deviceToken.toString(),
    };

    http.Response response = await http.get(uri, headers: headers);
    var resData = json.decode(response.body.toString());
    if (resData['status'] == true) {
      searchusercontroller.setLoading(false);
      searchusercontroller.searchUser(resData['data']);

      return resData['data'];
    } else {
      List Users = [];
      return Users;
    }
  }

  addfriend(data) async {
    final uri = Uri.parse('${apiGlobal}/friend');
    final headers = {
      'Authorization': authToken.toString(),
      'refreshToken': refreshToken.toString(),
      'deviceToken': deviceToken.toString(),
    };

    http.Response response = await http.post(uri, headers: headers, body: data);
    var res_data = json.decode(response.body.toString());

    if (res_data['status'] == true) {
      print('Friend Added');
      Get.snackbar('Success', res_data['message']);
    } else {
      Get.snackbar('Failed', res_data['message']);
    }
  }

  updateuserprofile(userdata, context) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return const SpinKitRotatingCircle(
            color: Colors.white,
            size: 50.0,
          );
        });
    final uri = Uri.parse('${apiGlobal}/profile');
    final headers = {
      'Authorization': authToken.toString(),
      'refreshToken': refreshToken.toString(),
      'deviceToken': deviceToken.toString(),
    };

    var request = http.MultipartRequest('PUT', uri);

    request.fields.addAll({
      'fullName': userdata['fullName'],
      'gender': userdata['gender'],
      'mobile': userdata['mobile'],
      'state': userdata['state'],
      'city': userdata['city'],
    });
    var MyFilename;
    if (userdata['profile'] != null) {
      MyFilename = path.basename(userdata['profile']);
      var multipartFile = await http.MultipartFile.fromPath(
          'image', userdata['profile'],
          filename: MyFilename

          // contentType: MediaType("image", "jpg")
          );

      request.files.add(multipartFile);
    }

    String jsonBody = json.encode(request.fields);
    request.headers.addAll(headers);
    var response = await request.send();
    final res = await http.Response.fromStream(response);
    var res_data = json.decode(res.body.toString());

    if (res_data['status'] == true) {
      Get.snackbar("Message", res_data['message']);
      usercontroller.User(UserModel.fromJson(res_data));
      Get.to(PROFILE2Screen());
    } else {
      Get.back();
      Get.snackbar("Error", res_data['message']);
    }
  }

  sharelivelocation(data, context) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return const SpinKitRotatingCircle(
            color: Colors.white,
            size: 50.0,
          );
        });
    final uri = Uri.parse('${apiGlobal}/post');
    final headers = {
      'Authorization': authToken.toString(),
      'refreshToken': refreshToken.toString(),
      'deviceToken': deviceToken.toString(),
    };

    String jsonBody = json.encode(data);
    http.Response response = await http.post(uri, headers: headers, body: data);
    var res_data = json.decode(response.body.toString());

    if (res_data['status'] == true) {
      print('Live Location Shared');
      Get.snackbar('Success', 'Live Location Shared Successfully');
      final bottomcontroller = Get.put(BottomController());
      bottomcontroller.navBarChange(0);

      Get.to(() => MainScreen());
    } else {
      Get.snackbar('Failed', 'Live Location Shared Failed');
      Get.back();
    }
  }

  postfeeds(data, ImageList, context) async {
    final uploatTrafficImageController = Get.put(UploadTrafficeImages());
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return const SpinKitRotatingCircle(
            color: Colors.white,
            size: 50.0,
          );
        });
    var request = http.MultipartRequest('POST', Uri.parse('${apiGlobal}/post'));

    final headers = {
      'Authorization': authToken.toString(),
      'refreshToken': refreshToken.toString(),
      'deviceToken': deviceToken.toString(),
    };

    request.fields.addAll({
      'caption': data['caption'],
      'tags': data['tags'],
      'postAvailability': data['postAvailability'],
      'lat': data['lat'],
      'long': data['long'],
    });
    if (ImageList != null) {
      for (var i = 0; i < ImageList.length; i++) {
        request.files
            .add(await http.MultipartFile.fromPath('image', '${ImageList[i]}'));
      }
    }

    String jsonBody = json.encode(request.fields);
    request.headers.addAll(headers);
    var response = await request.send();
    final res = await http.Response.fromStream(response);
    var res_data = json.decode(res.body.toString());

    if (res_data['status'] == true) {
      uploatTrafficImageController.trafficImages.clear();
      Get.snackbar('Message', res_data['message']);
      final bottomcontroller = Get.put(BottomController());
      bottomcontroller.navBarChange(0);
      Get.to(() => MainScreen());
    } else {
      Get.snackbar('Message', res_data['message']);
      Get.back();
      Get.back();
    }
  }

  Future<void> getmyfeeds(context) async {
    final feedscontroller = Get.put(MyFeedsController());
    feedscontroller.setLoading(true);
    final uri = Uri.parse('${apiGlobal}/post/getmyfeeds');
    final headers = {
      'Authorization': authToken.toString(),
      'refreshToken': refreshToken.toString(),
      'deviceToken': deviceToken.toString(),
    };
    http.Response response = await http.get(uri, headers: headers);
    var resData = json.decode(response.body.toString());
    if (resData['status'] == true) {
      feedscontroller.setLoading(false);
      feedscontroller.getmyFeeds(resData['data']);
    }
  }
}
