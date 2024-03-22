import 'package:doctor_appointment/const/consts.dart';
import 'package:doctor_appointment/firebase_options.dart';
import 'package:doctor_appointment/resores/components/splashScreen.dart';
import 'package:doctor_appointment/view/changePassword/changePassword.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: splash_Scren(),
    );
  }
}
