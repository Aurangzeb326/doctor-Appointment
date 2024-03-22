import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_appointment/const/consts.dart';
import 'package:doctor_appointment/controller/auth_Controller.dart';
import 'package:doctor_appointment/controller/setting_contr.dart';

class Setting_View extends StatelessWidget {
  const Setting_View({super.key, required});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(settingController());
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Appcolor.bluecolor,
          elevation: 0.0,
          title: Appstyle.bold(
              title: "Settings",
              color: Appcolor.whitecolor,
              size: Appsize.size18)),
      body: Obx(
        () => controller.isloading.value
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                        child: Image.asset(
                      AppAssets.doctor2,
                      height: 30,
                      fit: BoxFit.cover,
                    )),
                    title: Appstyle.bold(title: controller.username.value),
                    subtitle: Appstyle.normal(title: controller.email.value),
                  ),
                  Divider(),
                  20.heightBox,
                  ListView(
                      shrinkWrap: true,
                      children: List.generate(
                          ListSetting.length,
                          (index) => ListTile(
                                onTap: () async {
                                  if (index == 2) {
                                    Get.defaultDialog(
                                        title: "Are You Sure want to SignOut",
                                        middleText: "",
                                        textConfirm: "Confirm",
                                        textCancel: "Cancel",
                                        onConfirm: () {
                                          AuthController().signOut();
                                          Get.offAll(const loginView());
                                        });
                                  }
                                },
                                leading: listIconsetting[index],
                                iconColor: Appcolor.bluecolor,
                                title: Appstyle.bold(
                                  title: ListSetting[index],
                                ),
                              )))
                ],
              ),
      ),
    );
  }
}
