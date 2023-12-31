import 'package:flutter/services.dart';
import 'package:p2ptraffic/export_all.dart';

class CustomTextFieldWidget extends StatefulWidget {
  final String labelText;
  final TextEditingController controller;
  final String? hintText;
  final bool? isPassword;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  const CustomTextFieldWidget(
      {super.key,
      required this.labelText,
      this.validator,
      this.inputFormatters,
      this.keyboardType,
      this.hintText,
      required this.controller,
      this.isPassword = false});

  @override
  State<CustomTextFieldWidget> createState() => _CustomTextFieldWidgetState();
}

class _CustomTextFieldWidgetState extends State<CustomTextFieldWidget> {
  bool obsureText = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20.r),
          child: Text(
            widget.labelText,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
            ),
          ),
        ),
        4.verticalSpace,
        TextFormField(
          keyboardType: widget.keyboardType,
          controller: widget.controller,
          obscureText: widget.isPassword! ? obsureText : false,
          inputFormatters: widget.inputFormatters,
          validator: widget.validator,
          decoration: InputDecoration(
              suffixIcon: widget.isPassword!
                  ? IconButton(
                      padding: EdgeInsets.only(right: 10.r),
                      onPressed: () {
                        obsureText = !obsureText;
                        setState(() {});
                      },
                      icon: Icon(
                        obsureText ? Icons.visibility : Icons.visibility_off,
                        color: Color(0xff0C0D26).withOpacity(0.5),
                      ))
                  : null,
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.only(left: 20.r),
              hintText: widget.hintText,
              hintStyle: TextStyle(fontSize: 16.sp),
              border: textFieldDecoration,
              enabledBorder: textFieldDecoration,
              errorBorder: textFieldDecoration,
              focusedErrorBorder: textFieldDecoration,
              focusedBorder: textFieldDecoration),
        ),
      ],
    );
  }
}
