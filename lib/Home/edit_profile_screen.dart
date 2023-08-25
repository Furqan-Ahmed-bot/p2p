import 'dart:io';

import 'package:geocoding/geocoding.dart';
import 'package:image_picker/image_picker.dart';

import '../controller/usercontroller.dart';
import '../export_all.dart';

class EditProfileScreen extends StatefulWidget {
  final username;
  final emailaddress;
  final phone;
  final gender;
  final address;
  final city;
  final state;
  EditProfileScreen(
      {super.key,
      this.username,
      this.emailaddress,
      this.phone,
      this.gender,
      this.address,
      this.city,
      this.state});

  @override
  State<EditProfileScreen> createState() => _CREATEPROFILEStateScreen();
}

class _CREATEPROFILEStateScreen extends State<EditProfileScreen> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController genderController = new TextEditingController();
  TextEditingController locationController = new TextEditingController();
  TextEditingController cityController = new TextEditingController();
  TextEditingController stateController = new TextEditingController();
  var userGender;

  final picker = ImagePicker();
  dynamic UserProfileImage;

  Future getImage() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      UserProfileImage = pickedFile;
      if (pickedFile != null) {
      } else {
        print('No image selected.');
      }
    });
  }

  Position? _currentPosition;
  @override
  void initState() {
    nameController.text = UserController.user.data!.fullName.toString();
    emailController.text = email.toString();
    phoneController.text = UserController.user.data!.mobile.toString();
    cityController.text = UserController.user.data!.city.toString();
    stateController.text = UserController.user.data!.state.toString();
    userGender = UserController.user.data!.gender.toString();
    locationController.text = UserAddress;

    _getCurrentPosition();

    // TODO: implement initState
    super.initState();
  }

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition().then((Position position) {
      setState(() {
        _currentPosition = position;

        latitude = _currentPosition!.latitude;
        longitude = _currentPosition!.longitude;
      });

      _getAddressFromLatLng(_currentPosition!);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  var currentAddress;
  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
            _currentPosition!.latitude, _currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      setState(() {
        currentAddress =
            '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
      });
    }).catchError((e) {
      debugPrint(e);
    });
  }

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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  clipBehavior: Clip.none,
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
                      child: UserProfileImage != null
                          ? CircleAvatar(
                              backgroundColor: Colors.transparent,
                              radius: 65,
                              // backgroundColor: Color(0xff004DF2),
                              child: CircleAvatar(
                                backgroundImage:
                                    FileImage(File(UserProfileImage!.path)),
                                // backgroundColor: Color(0xff21CDFB),

                                radius: 60,
                              ),
                            )
                          : CircleAvatar(
                              backgroundColor: Colors.transparent,
                              radius: 65,
                              // backgroundColor: Color(0xff004DF2),
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    'https://p2p-api.thesuitchstaging.com:2700/public/uploads/${UserController.user.data!.image}'),
                                // backgroundColor: Color(0xff21CDFB),

                                radius: 60,
                              ),
                            ),
                    ),
                    Positioned(
                      bottom: 10,
                      right: -30,
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
                          onPressed: () {
                            getImage();
                          },
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
              ],
            ),
            49.verticalSpace,
            TextField("Julie Smith", "Full Name",
                "assets/images/Icon awesome-user.png", nameController, false),
            20.verticalSpace,
            TextField("Julie.smith@domain.com", "Email Address",
                "assets/images/Icon material-email.png", emailController, true),
            20.verticalSpace,
            TextField("Julie.smith@domain.com", "Phone",
                "assets/images/Icon feather-phone.png", phoneController, true),
            20.verticalSpace,
            TextFieldDropdown(
              "Female",
              "Gender",
              "assets/images/Icon awesome-transgender.png",
            ),
            // 20.verticalSpace,
            // TextField(
            //     "20 Cooper Square",
            //     "Address",
            //     "assets/images/Icon material-location-onn.png",
            //     locationController,
            //     false),
            20.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmallTextField("", "City", cityController),
                SmallTextFieldDropdown("", "NY", stateController)
              ],
            ),
            40.verticalSpace,
            GestureDetector(
              onTap: () {
                print('Hello');
                var updateProfiledata = {
                  "fullName": nameController.text,
                  'email': emailController.text,
                  "mobile": phoneController.text,
                  "gender": userGender.toString(),
                  "city": cityController.text,
                  "state": stateController.text,
                  "profile":
                      UserProfileImage != null ? UserProfileImage.path : null,

                  // "email": uniqieemail.toString(),
                };
                ApiService().updateuserprofile(updateProfiledata, context);
                ;
                // final bottomcontroller = Get.put(BottomController());
                // bottomcontroller.navBarChange(0);
                // Get.to(() => MainScreen());
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

  TextField(txt, txt2, img, textcontroller, isReadAble) {
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
        readOnly: isReadAble,
        controller: textcontroller,
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
        child: DropdownButtonFormField<String>(
          validator: (value) {
            if (userGender.isEmpty) {
              return "Select Gender";
            }
            return null;
          },
          icon: Icon(
            Icons.keyboard_arrow_down_outlined,
            color: kDefaultIconDarkColor.withOpacity(.5),
          ),
          isExpanded: true,
          // style: TextStyle(
          //   fontWeight: FontWeight.w500,
          //   fontSize: 20.sp,
          //   color: kButtonColor.withOpacity(.5),
          // ),
          decoration: InputDecoration(
            prefixIcon: Image.asset(
              'assets/images/Icon awesome-transgender.png',
              scale: 4,
            ),
            contentPadding: EdgeInsets.all(16),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(color: Colors.white, width: 3),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(color: Colors.white, width: 3),
            ),
            // prefixIcon: Icon(Icons.person,color: kTransparent,),
          ),
          hint: Text(
            '${userGender}',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
              color: Colors.black,
            ),
          ),
          items: <String>[
            'male',
            'female',
          ].map((String gender) {
            return DropdownMenuItem<String>(
              value: gender,
              child: Text(gender),
              onTap: () {
                userGender = gender;
                print('Gender is ${userGender}');
              },
            );
          }).toList(),
          onChanged: (newValue) {},
        ));
  }

  SmallTextField(
    txt,
    txt2,
    textcontroller,
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
        controller: textcontroller,
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

  SmallTextFieldDropdown(txt, txt2, textcontroller) {
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
        controller: textcontroller,
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
