import '../export_all.dart';

class FriendRequestsScreen extends StatefulWidget {
  const FriendRequestsScreen({super.key});

  @override
  State<FriendRequestsScreen> createState() => _FriendRequestsScreenState();
}

class _FriendRequestsScreenState extends State<FriendRequestsScreen> {
  final List<FriendRequestsUserDataModel> friendRequestList = [
    FriendRequestsUserDataModel('Martin', user1, 'New York', false),
    FriendRequestsUserDataModel('Martin', user2, 'New York', false),
    FriendRequestsUserDataModel('Martin', user3, 'New York', false),
    FriendRequestsUserDataModel('Martin', user4, 'New York', false),
    FriendRequestsUserDataModel('Martin', user5, 'New York', false),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "FRIEND REQUESTS",
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
        child: ListView.separated(
          itemCount: friendRequestList.length,
          padding: EdgeInsets.all(20.r),
          itemBuilder: (context, index) => ListTile(
            horizontalTitleGap: 30.0,
            visualDensity: const VisualDensity(
              horizontal: -4.0,
            ),
            contentPadding: EdgeInsets.zero,
            leading: Container(
              height: 60.r,
              width: 60.r,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xff00DBFA),
                  border: Border.all(
                      color: Color(0xff00DBFA),
                      width: 1,
                      strokeAlign: BorderSide.strokeAlignOutside),
                  image: DecorationImage(
                      image: NetworkImage(friendRequestList[index].userImage),
                      fit: BoxFit.cover)),
            ),
            title: Text(
              friendRequestList[index].userName,
              style: TextStyle(fontSize: 18.sp, color: Color(0xff3A3A3A)),
            ),
            subtitle: Text(
              friendRequestList[index].city,
              style: TextStyle(fontSize: 14.sp, color: Color(0xff3A3A3A)),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    Rejected();
                  },
                  child: Container(
                    height: 26.h,
                    width: 50.w,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(
                          20,
                        )),
                    child: Center(
                      child: Text(
                        "Reject",
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                10.horizontalSpace,
                GestureDetector(
                  onTap: () {
                    Accepted();
                  },
                  child: Container(
                    height: 26.h,
                    width: 50.w,
                    decoration: BoxDecoration(
                        color: Color(0xff00E5FE),
                        borderRadius: BorderRadius.circular(
                          20,
                        )),
                    child: Center(
                      child: Text(
                        "Accept",
                        style: TextStyle(
                          fontSize: 10.sp,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          separatorBuilder: (context, index) => Dividerr(),
        ),
      ),
    );
  }

  Rejected() {
    return showDialog(
      barrierDismissible: true,
      // barrierColor: Colors.white,
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, setState) {
            return AlertDialog(
              backgroundColor: Color(0xff000000B8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.r),
              ),
              contentPadding: EdgeInsets.all(0),
              actionsPadding: EdgeInsets.all(0),
              actions: [
                Container(
                  width: 388.w,
                  height: 200.h,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(10.r),
                      color: Color(0xffFFFFFF)),
                  child: Container(
                    width: 500.w,
                    height: 100.h,
                    child: Center(
                      child: Text(
                        "Request has been rejected",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 30.sp, color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Accepted() {
    return showDialog(
      barrierDismissible: true,
      // barrierColor: Colors.white,
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, setState) {
            return AlertDialog(
              backgroundColor: Color(0xff000000B8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.r),
              ),
              contentPadding: EdgeInsets.all(0),
              actionsPadding: EdgeInsets.all(0),
              actions: [
                Container(
                  width: 388.w,
                  height: 200.h,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(10.r),
                      color: Color(0xffFFFFFF)),
                  child: Container(
                    width: 500.w,
                    height: 100.h,
                    child: Center(
                      child: Text(
                        "Request has been accepted successfully",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 30.sp, color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Dividerr() {
    return Column(
      children: [
        Container(
          width: 388.w,
          height: 1.h,
          color: Color(0xff010231).withOpacity(0.1),
        ),
      ],
    );
  }
}

class FriendRequestsUserDataModel {
  String userName;
  String userImage;
  String city;
  bool requestStatus;

  FriendRequestsUserDataModel(
      this.userName, this.userImage, this.city, this.requestStatus);
}
