import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_appointment/const/consts.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';

class AppointmentController extends GetxController {
  var isloading = false.obs;

  var appDayController = TextEditingController();
  var appTimeController = TextEditingController();
  var appMobileController = TextEditingController();
  var appNameController = TextEditingController();
  var appMessageController = TextEditingController();

  bookAppointment(String docId, String docName, context) async {
    isloading(true);

    var store = FirebaseFirestore.instance.collection("appointment").doc();

    await store.set({
      'appBy': FirebaseAuth.instance.currentUser!.uid,
      'appDay': appDayController.text,
      'appTime': appTimeController.text,
      'appMobile': appMobileController.text,
      'appName': appNameController.text,
      'appMessage': appMessageController.text,
      'appwith': docId,
      'appwithName': docName,
    });
    isloading(false);
    VxToast.show(context, msg: "Appointment is Book SucessFully");
    Get.back();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getappointment(bool isDoctor) {
    if (isDoctor) {
      return FirebaseFirestore.instance
          .collection("appointment")
          .where('appwith', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .get();
    }else{
       return FirebaseFirestore.instance
          .collection("appointment")
          .where('appBy', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .get();
    }
  }
}
