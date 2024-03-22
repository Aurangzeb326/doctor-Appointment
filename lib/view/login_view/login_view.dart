import 'package:doctor_appointment/const/consts.dart';
import 'package:doctor_appointment/controller/auth_Controller.dart';

class loginView extends StatefulWidget {
  const loginView({super.key});

  @override
  State<loginView> createState() => _loginViewState();
}

class _loginViewState extends State<loginView> {
  var isdoctor = false;
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
                child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/login.png",
                    width: 250,
                  ),
                  10.heightBox,
                  Appstyle.bold(
                      title: Appstring.wellcomeBack, size: Appsize.size18),
                  Appstyle.bold(
                    title: Appstring.wellcomeBack,
                  )
                ],
              ),
            )),
            Expanded(
                child: Form(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                    20.heightBox,
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Appstyle.normal(
                          title: Appstring.forgotpassword, color: Colors.red),
                    ),
                    10.heightBox,
                    SwitchListTile(
                        value: isdoctor,
                        onChanged: (newValue) {
                          setState(() {
                            isdoctor = newValue;
                          });
                        },
                        title: "sing in as a Doctor".text.make()),
                    20.heightBox,
                    customButton(
                        buttoncolor: Appcolor.bluecolor,
                        buttontext: Appstring.login,
                        ontap: () async {
                          await controller.sigIn();
                          if (controller.userCredential != null) {
                            if (isdoctor) {
                              Get.to(() => const appointment_View());
                            } else {
                              Get.to(() => const home());
                            }
                          }
                        }),
                    20.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Appstyle.normal(title: Appstring.dontHaveAccount),
                        8.widthBox,
                        GestureDetector(
                          onTap: () => Get.to(const signup_view()),
                          child: Appstyle.bold(
                            title: Appstring.Signup,
                          ),
                        )
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
