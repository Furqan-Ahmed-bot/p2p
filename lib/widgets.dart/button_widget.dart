import '../export_all.dart';

class CustomButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const CustomButtonWidget({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 348.w,
        height: 60.h,
        alignment: Alignment.center,
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
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 18.sp),
        ),
      ),
    );
  }
}
