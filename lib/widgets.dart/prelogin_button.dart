import '../export_all.dart';

class PreLoginButtonWidget extends StatelessWidget {
  final VoidCallback? onTap;
  final String? text;
  final String? iconPath;
  final Color? color;
  const PreLoginButtonWidget({super.key, this.onTap, this.text, this.color, this.iconPath});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 348.w,
        height: 60.h,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(color: Color(0xffC6C8D2)),
          // boxShadow: [
          //   BoxShadow(
          //     // color: Colors.grey.withOpacity(0.5),
          //     // spreadRadius: 5,
          //     // blurRadius: 0,
          //     offset: Offset(0, 0), // changes position of shadow
          //   ),
          // ],
          // border: Border.all(color: Colors.white, width: 3.sp),
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 17),
                child: Container(
                  width: 16.w,
                  height: 13.h,
                  child: Image.asset(
                    iconPath!,
                    color: Colors.white,
                  ),
                ),
              ),
              // SizedBox(width: 17.h),
              Text(
                text!,
                style: TextStyle(color: Colors.white, fontSize: 18.sp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
