import 'dart:async';

import 'package:doctor_appointment/controller/auth_Controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class splash_Scren extends StatefulWidget {
  const splash_Scren({super.key});

  @override
  State<splash_Scren> createState() => _splash_ScrenState();
}

class _splash_ScrenState extends State<splash_Scren> {
  @override
  void initState() {
    
    AuthController().isAlredyLogin();
    super.initState();
  }

  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
