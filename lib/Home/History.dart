import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => HistoryScreenState();
}

class HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding:
            EdgeInsets.only(left: 20.r, right: 20.r, top: 20.r, bottom: 150.r),
        itemBuilder: (context, index) => Cont(),
        separatorBuilder: (context, index) => 15.verticalSpace,
        itemCount: 10);
  }

  Cont() {
    return Container(
      width: 388.w,
      padding: EdgeInsets.symmetric(horizontal: 10.r, vertical: 10.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          10.r,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Image.asset(
                "assets/images/Icon material-location-on.png",
                width: 15.r,
                height: 21.r,
              ),
              10.horizontalSpace,
              Text(
                "20 Cooper Square, New York",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
              ),
              Spacer(),
              Text(
                "28 min.ago",
                style: TextStyle(fontSize: 10.sp, color: Color(0xff878B9E)),
              )
            ],
          ),
          10.verticalSpace,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "assets/images/Icon material-message.png",
                width: 16.r,
                height: 16.r,
              ),
              10.horizontalSpace,
              Expanded(
                child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor exercitation.",
                  style: TextStyle(fontSize: 12.sp, color: Color(0xff010231)),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Cont2() {
    return Container(
      width: 388.w,
      height: 85.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          10.r,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Container(
                  width: 15.w,
                  height: 21.h,
                  child: Image.asset(
                      "assets/images/Icon material-location-on.png"),
                ),
                10.horizontalSpace,
                Container(
                  child: Text(
                    "20 Cooper Square, New York",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
                  ),
                ),
                60.horizontalSpace,
                Padding(
                  padding: const EdgeInsets.only(bottom: 14),
                  child: Container(
                    child: Text(
                      "28 min.ago",
                      style:
                          TextStyle(fontSize: 10.sp, color: Color(0xff878B9E)),
                    ),
                  ),
                )
              ],
            ),
          ),
          0.verticalSpace,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 16.w,
                  height: 16.h,
                  child: Image.asset("assets/images/Icon awesome-image.png"),
                ),
                10.horizontalSpace,
                Container(
                  width: 311.w,
                  height: 35.h,
                  child: Text(
                    "(06) Photos Updated",
                    style: TextStyle(fontSize: 12.sp, color: Color(0xff010231)),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
