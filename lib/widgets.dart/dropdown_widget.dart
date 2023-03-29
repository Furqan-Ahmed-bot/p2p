import 'package:p2ptraffic/export_all.dart';

class DropdownWigdet extends StatefulWidget {
  final String labelText;
  final String? hintText;
  final List<DropdownMenuItem<String>> list;
  final void Function(String?)? onChanged;
  final String? Function(String?)? validator;

  const DropdownWigdet(
      {super.key,
      this.validator,
      required this.labelText,
      required this.onChanged,
      required this.list,
      this.hintText});

  @override
  State<DropdownWigdet> createState() => _DropdownWigdetState();
}

class _DropdownWigdetState extends State<DropdownWigdet> {
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
        DropdownButtonFormField(
          hint: Text(
            widget.hintText!,
            style: TextStyle(fontSize: 16.sp),
          ),
          validator: widget.validator,
          decoration: InputDecoration(
            border: textFieldDecoration,
            isDense: true,
            isCollapsed: true,
            contentPadding:
                EdgeInsets.symmetric(vertical: 16.r, horizontal: 20.r),
            enabledBorder: textFieldDecoration,
            focusedBorder: textFieldDecoration,
            filled: true,
            fillColor: Colors.white,
          ),
          items: widget.list,
          onChanged: widget.onChanged,
        )
      ],
    );
  }
}
