import 'package:flutter/material.dart';
import '../../const/consts.dart';

class customButton extends StatelessWidget {
  final Function() ontap;
  final String buttontext;
  final Color buttoncolor;
  const customButton(
      {super.key, required this.buttontext,required this.buttoncolor, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.screenWidth - 80,
      height: 43,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(), backgroundColor: buttoncolor),
          onPressed: ontap,
          child: buttontext.text.bold.white.make()),
    );
  }
}
