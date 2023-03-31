import '../export_all.dart';

class CustomTextFieldWidget2 extends StatelessWidget {
  final String? hintText;
  final TextEditingController controller;
  final void Function()? onTap;
  final int? maxLines;
  final bool? readOnly;
  final Widget? suffixIcon;
  final EdgeInsetsGeometry? contentPadding;
  const CustomTextFieldWidget2(
      {super.key,
      this.hintText,
      required this.controller,
      this.onTap,
      this.maxLines,
      this.readOnly,
      this.suffixIcon,
      this.contentPadding});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffEAEAEE),
        boxShadow: [
          BoxShadow(
            color: Color(0xff66708026).withOpacity(0.06),
            spreadRadius: 0,
            blurRadius: 2,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: TextFormField(
        maxLines: maxLines ?? 1,
        readOnly: readOnly ?? false,
        textAlignVertical: TextAlignVertical.center,
        controller: controller,
        style: TextStyle(fontSize: 14.sp),
        onTap: onTap,
        decoration: InputDecoration(
          isDense: true,
          hintMaxLines: maxLines ?? 1 ,
          contentPadding: contentPadding ??
              EdgeInsets.symmetric(horizontal: 20.r, vertical: 17.r),
          hintText: hintText,
          suffixIcon: suffixIcon,
          hintStyle: TextStyle(color: Color(0xff878B9E), fontSize: 15.sp),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
