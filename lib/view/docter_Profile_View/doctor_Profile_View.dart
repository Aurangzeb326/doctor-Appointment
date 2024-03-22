import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_appointment/const/consts.dart';

class Doctor_Profile_View extends StatelessWidget {
  final DocumentSnapshot doc;
  const Doctor_Profile_View({super.key, required this.doc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.bgDarkColor,
      appBar: AppBar(
        elevation: 0.0,
        title:
            Appstyle.bold(title: "Doctor_Detail", color: Appcolor.whitecolor),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10.0),
                height: 100,
                decoration: BoxDecoration(
                    color: Appcolor.whitecolor,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 45,
                      child: Image.asset(
                        AppAssets.doctor2,
                        height: 56,
                      ),
                    ),
                    10.widthBox,
                    Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Appstyle.bold(
                            title: doc['docName'],
                            color: Appcolor.textcolor,
                            size: Appsize.size14),
                        Appstyle.bold(
                            title: doc["docCategory"],
                            color: Appcolor.textcolor.withOpacity(0.5),
                            size: Appsize.size12),
                        Spacer(),
                        VxRating(
                          count: 5,
                          value: double.parse(doc['docRating'].toString()),
                          selectionColor: Appcolor.yellowColor,
                          onRatingUpdate: (value) {},
                          stepInt: true,
                        ),
                      ],
                    ),
                    25.widthBox,
                    Appstyle.bold(
                        title: "See All Review",
                        color: Appcolor.bluecolor,
                        size: Appsize.size12),
                  ],
                ),
              ),
              10.heightBox,
              Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Appcolor.whitecolor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Appstyle.bold(
                        title: "PhoneNumber",
                        color: Appcolor.textcolor,
                      ),
                      subtitle: Appstyle.normal(
                          title: doc['docPhone'],
                          color: Appcolor.textcolor.withOpacity(0.5)),
                      trailing: Container(
                        // width: 49,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Appcolor.yellowColor,
                        ),
                        child: Icon(
                          Icons.phone,
                          color: Appcolor.whitecolor,
                        ),
                      ),
                    ),
                    10.heightBox,
                    Appstyle.bold(
                        title: "Doctor_About",
                        color: Appcolor.textcolor,
                        size: Appsize.size16),
                    5.heightBox,
                    Appstyle.normal(
                      title: doc['docAbout'],
                      color: Appcolor.textcolor.withOpacity(0.5),
                    ),
                    10.heightBox,
                    Appstyle.bold(
                        title: "Address",
                        color: Appcolor.textcolor,
                        size: Appsize.size16),
                    5.heightBox,
                    Appstyle.normal(
                      title: doc["doctorAddress"],
                      color: Appcolor.textcolor.withOpacity(0.5),
                    ),
                    10.heightBox,
                    Appstyle.bold(
                        title: "Working And Time",
                        color: Appcolor.textcolor,
                        size: Appsize.size16),
                    5.heightBox,
                    Appstyle.normal(
                      title: doc["docTiming"],
                      color: Appcolor.textcolor.withOpacity(0.5),
                    ),
                    10.heightBox,
                    Appstyle.bold(
                        title: "Services",
                        color: Appcolor.textcolor,
                        size: Appsize.size16),
                    5.heightBox,
                    Appstyle.bold(
                        title: "This is Service section area",
                        color: Appcolor.textcolor.withOpacity(0.5),
                        size: Appsize.size16),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: customButton(
          buttoncolor: Appcolor.bluecolor,
          buttontext: "Book Appointment",
          ontap: () {
            Get.to(
                book_appointment(
                  docId: doc['docId'],
                  docName: doc['docName'],
                ),
                duration: Duration(seconds: 1),
                transition: Transition.zoom);
          },
        ),
      ),
    );
  }
}
