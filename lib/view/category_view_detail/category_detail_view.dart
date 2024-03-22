import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_appointment/const/consts.dart';

class Category_detail extends StatelessWidget {
  final String catName;
  const Category_detail({super.key, required this.catName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Appcolor.bluecolor,
          title: Appstyle.bold(title: catName, color: Appcolor.whitecolor),
        ),
        body: FutureBuilder(
          future: FirebaseFirestore.instance
              .collection('doctors')
              .where('docCategory', isEqualTo: catName)
              .get(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              var data = snapshot.data!.docs;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 170,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Container(
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
                            title: "Doctor Name",
                          ),
                          5.heightBox,
                          VxRating(
                            maxRating: 5,
                            count: 5,
                            value: 4,
                            selectionColor: Appcolor.yellowColor,
                            onRatingUpdate: (value) {},
                            stepInt: true,
                          ),
                        ],
                      ),
                    ).onTap(
                      () => Get.to(Doctor_Profile_View(doc: data[index])),
                    );
                  },
                ),
              );
            }
          },
        ));
  }
}
