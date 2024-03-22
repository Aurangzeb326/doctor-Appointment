import 'package:doctor_appointment/const/consts.dart';
import 'package:doctor_appointment/controller/appointment_Controller.dart';

class book_appointment extends StatelessWidget {
  final docId;
  final docName;
  const book_appointment(
      {super.key, required this.docId, required this.docName});

  @override
  Widget build(BuildContext context) {
    var Controller = Get.put(AppointmentController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Appstyle.bold(title: docName, color: Appcolor.whitecolor),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Appstyle.bold(
              title: "Appointment day ",
              color: Appcolor.textcolor,
            ),
            5.heightBox,
            customtextfield(
                hint: "Selelct day",
                textcontroller: Controller.appDayController),
            10.heightBox,
            Appstyle.bold(
                title: "Appointment Time ", color: Appcolor.textcolor),
            5.heightBox,
            customtextfield(
                hint: "Selelct time",
                textcontroller: Controller.appTimeController),
            10.heightBox,
            Appstyle.bold(
                title: "enter Mobile Number ", color: Appcolor.textcolor),
            5.heightBox,
            customtextfield(
                hint: "Enter Mobile Number",
                textcontroller: Controller.appMobileController),
            10.heightBox,
            Appstyle.bold(title: "Full Name ", color: Appcolor.textcolor),
            5.heightBox,
            customtextfield(
                hint: "Enter Full Name",
                textcontroller: Controller.appNameController),
            10.heightBox,
            Appstyle.bold(title: "Message ", color: Appcolor.textcolor),
            5.heightBox,
            customtextfield(
                hint: "Enter Your message",
                textcontroller: Controller.appMessageController),
            10.heightBox,
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => Padding(
          padding: const EdgeInsets.all(10.0),
          child: Controller.isloading.value
              ?  const Center(
                  child: CircularProgressIndicator(),
                )
              : customButton(
                buttoncolor: Appcolor.bluecolor,
                  buttontext: "Book Appointment",
                  ontap: () {
                    Controller.bookAppointment(docId, docName, context);
                  },
                ),
        ),
      ),
    );
  }
}
