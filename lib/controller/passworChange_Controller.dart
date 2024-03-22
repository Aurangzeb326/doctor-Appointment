import 'package:doctor_appointment/const/consts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class passwordChange_controller extends GetxController {
  var oldpassword = TextEditingController();
  var newpassword = TextEditingController();

  var auth = FirebaseAuth.instance;
  var currentuser = FirebaseAuth.instance.currentUser;

  changePassword({email, oldpassword, newpassword}) {
    var cred =
        EmailAuthProvider.credential(email: email, password: oldpassword);

    currentuser!.reauthenticateWithCredential(cred).then((value) {
      currentuser!.updatePassword(newpassword);
    });
  }
}
RxString currentPassword = ''.obs;
  RxString newPassword = ''.obs;
  RxString confirmPassword = ''.obs;
  RxString errorMessage = ''.obs;
