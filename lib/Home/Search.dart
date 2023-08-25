import '../export_all.dart';
import 'MartinProfile.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final searchTextController = TextEditingController();
  @override
  List Users = [];
  bool? _userFound;
  bool? _isLoading;
  List SearchedUsers = [];
  void searchUser(username) async {
    setState(() {
      _isLoading = false;
    });

    Users = await ApiService().searchuser(username);

    setState(() {
      SearchedUsers = Users;
      _isLoading = true;
    });
    print('MYUsers  ${Users}');
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "SEARCH",
          style: TextStyle(fontSize: 16.sp),
        ),
        centerTitle: true,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                width: 18.w,
                height: 18.h,
                child: Image.asset("assets/images/Icon ionic-ios-close.png"),
              ),
            ),
          )
        ],
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Colors.black,
                Colors.black,
              ],
            ),
            // backgroundBlendMode: BlendMode.colorBurn,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: searchTextController,
                  onChanged: (value) {
                    print(value.isEmpty);
                    if (value == "") {
                      print("hello");
                      Users = [];
                      SearchedUsers = [];
                      setState(() {});
                    } else {
                      searchUser(value);
                    }
                    // ApiService().searchuser(value);
                  },
                  style: TextStyle(color: Color(0xff010231), fontSize: 16.sp),
                  decoration: InputDecoration(
                    enabledBorder: textFieldDecoration,
                    errorBorder: textFieldDecoration,
                    focusedBorder: textFieldDecoration,
                    focusedErrorBorder: textFieldDecoration,
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.symmetric(horizontal: 20.r),
                    hintText: 'Search Here....',
                    hintStyle: TextStyle(
                        color: Color(0xff010231).withOpacity(0.2),
                        fontSize: 16.sp),
                    border: InputBorder.none,
                  ),
                )),
            Container(
                height: 0.9.sh,
                width: 1.sw,
                child: _isLoading == false
                    ? Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: SearchedUsers.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              // Padding(
                              //   padding: const EdgeInsets.all(8.0),
                              //   child: Container(
                              //     height: 100,
                              //     width: 100,
                              //     color: Colors.blue,
                              //   ),
                              // )
                              33.verticalSpace,
                              Container(
                                width: double.infinity,
                                child: SingleChildScrollView(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            // Get.toNamed("/MartinProfileScreen");
                                            Get.to(MartinProfileScreen(
                                              name: SearchedUsers[index]
                                                  ['userName'],
                                              age: '22',
                                              gender: SearchedUsers[index]
                                                  ['gender'],
                                              country: SearchedUsers[index]
                                                  ['country'],
                                            ));
                                          },
                                          child: Row(
                                            children: [
                                              Container(
                                                height: 60.h,
                                                width: 60.w,
                                                child: SearchedUsers[index]
                                                            ['image'] !=
                                                        null
                                                    ? CircleAvatar(
                                                        radius: 25,
                                                        backgroundImage:
                                                            NetworkImage(
                                                                'https://p2p-api.thesuitchstaging.com:2700/public/uploads/${SearchedUsers[index]['image']}'))
                                                    : CircleAvatar(
                                                        radius: 25,
                                                        backgroundImage: AssetImage(
                                                            "assets/images/1.png")),
                                              ),
                                              22.horizontalSpace,
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    SearchedUsers[index]
                                                        ['userName'],
                                                    style: TextStyle(
                                                        fontSize: 18.sp,
                                                        color:
                                                            Color(0xffFFFFFF)),
                                                  ),
                                                  Text(
                                                    SearchedUsers[index]
                                                        ['country'],
                                                    style: TextStyle(
                                                        fontSize: 14.sp,
                                                        color:
                                                            Color(0xffFFFFFF)),
                                                  ),
                                                ],
                                              ),
                                              Spacer(),
                                              SearchedUsers[index]['friend'] ==
                                                      'pending'
                                                  ? Container(
                                                      decoration: BoxDecoration(
                                                          color: Colors.blue,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5)),
                                                      height: 30,
                                                      width: 80,
                                                      child: Center(
                                                          child: Text(
                                                        'Pending',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      )),
                                                    )
                                                  : SearchedUsers[index]
                                                              ['friend'] ==
                                                          'accepted'
                                                      ? Container(
                                                          decoration: BoxDecoration(
                                                              color:
                                                                  Colors.blue,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5)),
                                                          height: 30,
                                                          width: 80,
                                                          child: Center(
                                                              child: Text(
                                                            'Friend',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white),
                                                          )),
                                                        )
                                                      : InkWell(
                                                          onTap: () {
                                                            var data = {
                                                              'user': SearchedUsers[
                                                                          index]
                                                                      ['id']
                                                                  .toString(),
                                                            };
                                                            ApiService()
                                                                .addfriend(
                                                                    data);
                                                          },
                                                          child: Container(
                                                            height: 26.h,
                                                            width: 26.w,
                                                            child: Image.asset(
                                                              "assets/images/Group 1683.png",
                                                            ),
                                                          ),
                                                        ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      )),
          ],
        ),
      ),
    );
  }

  // martin(
  //   img,
  // ) {
  //   return GestureDetector(
  //     onTap: () {
  //       Get.toNamed("/MartinProfileScreen");
  //     },
  //     child: Row(
  //       children: [
  //         Container(
  //           height: 60.h,
  //           width: 60.w,
  //           child: Image.asset(
  //             img,
  //           ),
  //         ),
  //         22.horizontalSpace,
  //         Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Text(
  //               "Martin Smith",
  //               style: TextStyle(fontSize: 18.sp, color: Color(0xffFFFFFF)),
  //             ),
  //             Text(
  //               "New York",
  //               style: TextStyle(fontSize: 14.sp, color: Color(0xffFFFFFF)),
  //             ),
  //           ],
  //         ),
  //         151.horizontalSpace,
  //         Container(
  //           height: 26.h,
  //           width: 26.w,
  //           child: Image.asset(
  //             "assets/images/Group 1683.png",
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // Dividerr() {
  //   return Column(
  //     children: [
  //       Container(
  //         width: 388.w,
  //         height: 1.h,
  //         color: Color(0xff707070),
  //       ),
  //     ],
  //   );
  // }
}
