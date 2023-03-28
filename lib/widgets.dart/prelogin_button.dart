import '../export_all.dart';

class PreLoginButtonWidget extends StatelessWidget {
  final VoidCallback? onTap;
  final String? text;
  final String? iconPath;
  final Color? color;
  const PreLoginButtonWidget(
      {super.key, this.onTap, this.text, this.color, this.iconPath});

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
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.centerRight,
                constraints: BoxConstraints(
                    minWidth: Get.width * 0.12, maxWidth: Get.width * 0.20),
                child: SvgPicture.asset(
                  iconPath!,
                ),
              ),
              20.horizontalSpace,
              // SizedBox(width: 17.h),
              Expanded(
                child: Text(
                  text!,
                  style: TextStyle(color: Colors.white, fontSize: 18.sp),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
