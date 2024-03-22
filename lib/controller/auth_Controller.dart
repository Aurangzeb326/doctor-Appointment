import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_appointment/const/consts.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController extends GetxController {
  var fullnameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  // Add New Doctor
  var aboutController = TextEditingController();
  var categoryController = TextEditingController();
  var serviesController = TextEditingController();
  var addressController = TextEditingController();
  var phoneController = TextEditingController();
  var timingController = TextEditingController();

  UserCredential? userCredential;

  isAlredyLogin() async {
    await FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        Get.offAll(const home());
      } else {
        Get.off(const loginView());
      }
    });
  }

  sigIn() async {
    userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text, password: passwordController.text);
  }

  signupUser(bool isDoctor) async {
    userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text, password: passwordController.text);
    await userstoreData(userCredential!.user!.uid, fullnameController.text,
        emailController.text, passwordController.text, isDoctor);
  }

  userstoreData(String uid, String fullname, String email, String password,
      bool isDoctor) async {
    var store = FirebaseFirestore.instance
        .collection(isDoctor ? 'doctors' : "user")
        .doc(uid);
    if (isDoctor) {
      await store.set({
        'docAbout': aboutController.text.trim(),
        'doctorAddress': addressController.text.trim(),
        'docCategory': categoryController.text.trim(),
        'docName': fullname,
        'docServices': serviesController.text.trim(),
        'docPhone': phoneController.text.trim(),
        'docTiming': timingController.text.trim(),
        'docId': FirebaseAuth.instance.currentUser!.uid,
        'docRating': 4,
        'docemail': email
      });
    } else {
      store.set({'fullname': fullname, 'email': email, 'password': password});
    }
  }

  signOut() {
    FirebaseAuth.instance.signOut();
  }
}
