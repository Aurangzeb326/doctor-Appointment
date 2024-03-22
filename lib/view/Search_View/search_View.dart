import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_appointment/const/consts.dart';
import 'package:doctor_appointment/controller/home_Controller.dart';

class search_View extends StatefulWidget {
  final String searchQuery;
  const search_View({super.key, required this.searchQuery});

  @override
  State<search_View> createState() => _search_ViewState();
}

class _search_ViewState extends State<search_View> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appcolor.bluecolor,
        title: Appstyle.bold(title: "Search List", color: Appcolor.whitecolor),
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance.collection('doctors').get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            // var data = snapshot.data!.docs;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 170,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8),
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  var doc = snapshot.data!.docs[index];
                  return !doc['docName']
                          .toString()
                          .toLowerCase()
                          .contains(widget.searchQuery)
                      ? const SizedBox.shrink()
                      : Container(
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                              color: Appcolor.bgDarkColor,
                              borderRadius: BorderRadius.circular(8)),
                          margin: const EdgeInsets.all(8.0),
                          height: 100,
                          width: 150,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 185,
                                alignment: Alignment.center,
                                color: Appcolor.bluecolor,
                                child: Image.asset(
                                  AppAssets.doctor1,
                                  fit: BoxFit.cover,
                                  width: 100,
                                ),
                              ),
                              5.heightBox,
                              Appstyle.normal(
                                title: doc['docName'],
                              ),
                              5.heightBox,
                              VxRating(
                                maxRating: 5,
                                count: 5,
                                value:
                                    double.parse(doc['docRating'].toString()),
                                selectionColor: Appcolor.yellowColor,
                                onRatingUpdate: (value) {},
                                stepInt: true,
                              ),
                            ],
                          ),
                        ).onTap(
                          () => Get.to(Doctor_Profile_View(doc: doc)),
                        );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
