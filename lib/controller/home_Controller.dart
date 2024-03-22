import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_appointment/const/consts.dart';
import 'package:firebase_core/firebase_core.dart';

class homeController extends GetxController {
var  searchQueryController= TextEditingController();
  var isloading = false.obs;

  Future<QuerySnapshot<Map<String, dynamic>>> getDoctorlist() async {
    var doctors = FirebaseFirestore.instance.collection("doctors").get();
    return doctors;
  }
}
