import '../export_all.dart';

class SearchTextFieldWidget extends StatelessWidget {
  final String? hintText;
  final TextEditingController controller;
  const SearchTextFieldWidget(
      {super.key, this.hintText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: TextStyle(color: Color(0xff010231), fontSize: 16.sp),
      decoration: InputDecoration(
        enabledBorder: textFieldDecoration,
        errorBorder: textFieldDecoration,
        focusedBorder: textFieldDecoration,
        focusedErrorBorder: textFieldDecoration,
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(horizontal: 20.r),
        hintText: hintText,
        hintStyle: TextStyle(
            color: Color(0xff010231).withOpacity(0.2), fontSize: 16.sp),
        border: InputBorder.none,
      ),
    );
  }
}
