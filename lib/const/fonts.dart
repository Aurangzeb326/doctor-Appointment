import 'package:doctor_appointment/const/consts.dart';

class Appsize {
  static const size12 = 12.0,
      size14 = 14.0,
      size16 = 16.0,
      size18 = 18.0,
      size20 = 20.0,
      size22 = 22.0,
      size34 = 34.0;
}

class Appstyle {
  static normal({String? title, Color? color = Colors.black, double? size}) {
    return title!.text.color(color).size(size).make();
  }

  static bold({String? title, Color? color = Colors.black, double? size}) {
    return title!.text
        .color(color)
        .size(size)
        .fontWeight(FontWeight.bold)
        .make();
  }
}
