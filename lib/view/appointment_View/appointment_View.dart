import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_appointment/const/consts.dart';
import 'package:doctor_appointment/controller/appointment_Controller.dart';
import 'package:doctor_appointment/controller/auth_Controller.dart';

class appointment_View extends StatelessWidget {
  const appointment_View({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDoctor = false;
    var controller = Get.put(AppointmentController());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Appstyle.bold(title: "Appointments", color: Colors.white),
          leading: const Text(''),
          actions: [
            IconButton(
                onPressed: () {
                  AuthController().signOut();
                },
                icon: const Icon(Icons.power_settings_new_rounded))
          ],
        ),
        body: FutureBuilder<QuerySnapshot>(
          future: controller.getappointment(isDoctor),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            } else {
              var data = snapshot.data!.docs;
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView.builder(
                  itemCount: data.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      onTap: () {
                        Get.to(
                            appointment_Detail(
                              doc: data[index],
                            ),
                            duration: const Duration(seconds: 1),
                            transition: Transition.leftToRight);
                      },
                      leading: CircleAvatar(
                        radius: 25,
                        child: Image.asset(
                          AppAssets.doctor1,
                          height: 35,
                        ),
                      ),
                      title: Appstyle.bold(title: data[index]['appwithName']),
                      subtitle: Appstyle.normal(
                          title:
                              "${data[index]['appDay']}-${data[index]['appTime']}",
                          color: Appcolor.textcolor.withOpacity(0.5)),
                    );
                  },
                ),
              );
            }
          },
        ));
  }
}
