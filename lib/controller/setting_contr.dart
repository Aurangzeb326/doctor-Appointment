import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_appointment/const/consts.dart';
import 'package:firebase_auth/firebase_auth.dart';

class settingController extends GetxController {
  @override
  void onInit() {
    getData = getUserData();
    super.onInit();
  }

  var currentUser = FirebaseAuth.instance.currentUser;
  var isloading = false.obs;
  var username = "".obs;
  var email = "".obs;
  Future? getData;

  getUserData() async {
    isloading(true);
    DocumentSnapshot<Map<String, dynamic>> user = await FirebaseFirestore
        .instance
        .collection('user')
        .doc(currentUser!.uid)
        .get();

    var userdata = user.data();
    username.value = userdata!['fullname'];
    email.value = currentUser!.email!;
    isloading(false);
  }
}
