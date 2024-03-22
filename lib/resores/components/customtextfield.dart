import 'package:doctor_appointment/const/colors.dart';
import 'package:flutter/material.dart';

class customtextfield extends StatefulWidget {
  final String hint;
  final TextEditingController? textcontroller;
  final Color textxolor;
  final Color bordercolor;
  final Color inputcolor;
  const customtextfield(
      {super.key,
      required this.hint,
      this.textcontroller,
      this.inputcolor=Colors.black,
      this.textxolor = Colors.black,
      this.bordercolor = Colors.black});
  @override
  State<customtextfield> createState() => _customtextfieldState();
}

class _customtextfieldState extends State<customtextfield> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textcontroller,
      cursorColor: Appcolor.bluecolor,
      style: TextStyle(color: widget.inputcolor),
      decoration: InputDecoration(
        
          isDense: true,
          hintStyle: TextStyle(color: widget.textxolor),
          hintText: widget.hint,
          border: OutlineInputBorder(
              borderSide: BorderSide(color: widget.bordercolor)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: widget.bordercolor))),
    );
  }
}
