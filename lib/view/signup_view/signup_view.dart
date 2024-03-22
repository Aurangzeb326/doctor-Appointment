import 'package:doctor_appointment/const/consts.dart';
import 'package:doctor_appointment/controller/auth_Controller.dart';

class signup_view extends StatefulWidget {
  const signup_view({super.key});

  @override
  State<signup_view> createState() => _signup_viewState();
}

class _signup_viewState extends State<signup_view> {
  var isDoctor = false;
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
                flex: 30,
                child: Container(
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/signup.png",
                        width: 250,
                      ),
                      10.heightBox,
                      Appstyle.bold(
                        title: Appstring.WaAreExcited,
                        size: Appsize.size16,
                      ),
                    ],
                  ),
                )),
            Expanded(
                flex: 70,
                child: Form(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        customtextfield(
                          textcontroller: controller.fullnameController,
                          hint: Appstring.fullname,
                        ),
                        10.heightBox,
                        customtextfield(
                          textcontroller: controller.emailController,
                          hint: Appstring.emailHint,
                        ),
                        10.heightBox,
                        customtextfield(
                          textcontroller: controller.passwordController,
                          hint: Appstring.paswordHint,
                        ),
                        10.heightBox,
                        SwitchListTile(
                          title: "Sign as a Doctor".text.make(),
                          value: isDoctor,
                          onChanged: (newValue) {
                            setState(() {
                              isDoctor = newValue;
                            });
                          },
                        ),
                        Visibility(
                          visible: isDoctor,
                          child: Column(
                            children: [
                              customtextfield(
                                textcontroller: controller.aboutController,
                                hint: "About",
                              ),
                              10.heightBox,
                              customtextfield(
                                textcontroller: controller.categoryController,
                                hint: "Category",
                              ),
                              10.heightBox,
                              customtextfield(
                                textcontroller: controller.serviesController,
                                hint: "Services",
                              ),
                              10.heightBox,
                              customtextfield(
                                textcontroller: controller.addressController,
                                hint: "Address",
                              ),
                              10.heightBox,
                              customtextfield(
                                textcontroller: controller.phoneController,
                                hint: "Phone Number",
                              ),
                              10.heightBox,
                              customtextfield(
                                textcontroller: controller.timingController,
                                hint: "Timing",
                              ),
                            ],
                          ),
                        ),
                        20.heightBox,
                        customButton(
                          buttoncolor: Appcolor.bluecolor,
                          buttontext: Appstring.login,
                          ontap: () async {
                            await controller.signupUser(isDoctor);
                            if (controller.userCredential != null) {
                              if (isDoctor) {
                                Get.off(const appointment_View());
                              } else {
                                Get.offAll(const home());
                              }
                            }
                          },
                        ),
                        20.heightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Appstyle.normal(
                                title: Appstring.alreadyHaveAccount),
                            8.widthBox,
                            GestureDetector(
                              onTap: () => Get.to(const loginView()),
                              child: Appstyle.bold(title: Appstring.login),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
