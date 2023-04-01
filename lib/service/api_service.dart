import 'dart:convert';

import 'package:http/http.dart' as http;

import '../export_all.dart';

String apiGlobal = "https://p2p-api.thesuitchstaging.com:2700";
// String imageGlobal = "https://api1.jumppace.com:3060";
// String apiUrl = "wss://api1.jumppace.com:3060/";

class ApiService{

  //REGISTERATION / SIGN UP API METHOD
  callRegister(context, data) async {
    print(data);
    // final usercontroller = Get.put(UserController());
    ////print(data);
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return spinkit;
        });

    final uri = Uri.parse('${apiGlobal}/register');
    print(uri);
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
    if (res_data['success']) {
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
    }
    if (!res_data['success']) {
      Get.back();

      Get.snackbar('Error', res_data['message'],
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3),
          colorText: Colors.black);
    }
  }

  //LOGIN SCREEN API


}