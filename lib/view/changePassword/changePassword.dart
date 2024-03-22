import 'package:doctor_appointment/const/consts.dart';
import 'package:doctor_appointment/controller/passworChange_Controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class changePassword extends StatefulWidget {
  const changePassword({super.key});

  @override
  State<changePassword> createState() => _changePasswordState();
}

class _changePasswordState extends State<changePassword> {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(passwordChange_controller());
    return Scaffold(
        backgroundColor: Appcolor.bgDarkColor,
        appBar: AppBar(
          backgroundColor: Appcolor.bluecolor,
          title: Appstyle.bold(
              title: "Change Password", color: Appcolor.whitecolor),
        ),
        body: Card(
          color: Appcolor.bluecolor,
          margin:
              const EdgeInsets.only(top: 55, bottom: 55, left: 15, right: 15),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: customtextfield(
                      textcontroller: controller.oldpassword,
                      inputcolor: Appcolor.whitecolor,
                      textxolor: Appcolor.whitecolor,
                      hint: "Enter Old PAssword"),
                ),
                10.heightBox,
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: customtextfield(
                      textcontroller: controller.newpassword,
                      inputcolor: Appcolor.whitecolor,
                      textxolor: Appcolor.whitecolor,
                      hint: "Enter New PAssword"),
                ),
                15.heightBox,
                customButton(
                  buttoncolor: Colors.green,
                  buttontext: "Click",
                  ontap: () {
                    controller.changePassword(
                        email: controller.currentuser!.email);
                    controller.oldpassword.text;
                    controller.newpassword.text;
                  },
                )
              ],
            ),
          ),
        ));
  }
}
