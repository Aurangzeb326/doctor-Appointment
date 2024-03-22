import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_appointment/const/consts.dart';

class appointment_Detail extends StatelessWidget {
  final DocumentSnapshot doc;
  const appointment_Detail({super.key, required this.doc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appcolor.bluecolor,
        title: Appstyle.bold(title: "Doctor Name ", color: Appcolor.whitecolor),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Appstyle.bold(
                title: "Select Appointment day ", color: Appcolor.textcolor),
            5.heightBox,
            Appstyle.normal(title: doc['appDay'], color: Appcolor.textcolor),
            10.heightBox,
            Appstyle.bold(
                title: "Select Appointment Time ", color: Appcolor.textcolor),
            5.heightBox,
            Appstyle.normal(title: doc['appTime'], color: Appcolor.textcolor),
            10.heightBox,
            Appstyle.bold(title: "Mobile Number ", color: Appcolor.textcolor),
            5.heightBox,
            Appstyle.normal(title: doc['appMobile'], color: Appcolor.textcolor),
            10.heightBox,
            Appstyle.bold(title: "Full Name ", color: Appcolor.textcolor),
            5.heightBox,
            Appstyle.normal(title: doc['appName'], color: Appcolor.textcolor),
            10.heightBox,
            Appstyle.bold(title: "Message ", color: Appcolor.textcolor),
            5.heightBox,
            Appstyle.normal(
                title: doc['appMessage'], color: Appcolor.textcolor),
            10.heightBox,
          ],
        ),
      ),
    );
  }
}
