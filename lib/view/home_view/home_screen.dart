import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_appointment/const/consts.dart';
import 'package:doctor_appointment/controller/home_Controller.dart';
import 'package:doctor_appointment/view/Search_View/search_View.dart';

class home_view extends StatelessWidget {
  const home_view({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(homeController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appcolor.bluecolor,
        elevation: 0.0,
        title: Appstyle.bold(
            title: "${Appstring.welcome} User", color: Appcolor.whitecolor),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(15.0),
            height: 100,
            color: Appcolor.bluecolor,
            child: Row(
              children: [
                Expanded(
                  child: customtextfield(
                    textcontroller: controller.searchQueryController,
                    hint: Appstring.search,
                    textxolor: Appcolor.whitecolor,
                    bordercolor: Appcolor.whitecolor,
                    inputcolor: Colors.white,
                  ),
                ),
                10.widthBox,
                IconButton(
                  onPressed: () => Get.to(search_View(
                    searchQuery: controller.searchQueryController.text,
                  )),
                  icon: const Icon(Icons.search),
                  color: Appcolor.whitecolor,
                )
              ],
            ),
          ),
          20.heightBox,
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                SizedBox(
                  height: 80,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () =>
                            Get.to(Category_detail(catName: listTitle[index])),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Appcolor.bluecolor),
                          margin: const EdgeInsets.only(right: 8.0),
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Image.asset(
                                listicon[index],
                                width: 30,
                              ),
                              5.heightBox,
                              Appstyle.normal(
                                  title: listTitle[index],
                                  color: Appcolor.whitecolor)
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                15.heightBox,
                Align(
                  alignment: Alignment.centerLeft,
                  child: Appstyle.bold(
                      title: "popular doctor",
                      color: Appcolor.bluecolor,
                      size: Appsize.size18),
                ),
                10.heightBox,
                FutureBuilder<QuerySnapshot>(
                  future: controller.getDoctorlist(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      var data = snapshot.data?.docs;
                      return SizedBox(
                        height: 170,
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: data!.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Get.to(Doctor_Profile_View(doc: data[index]));
                              },
                              child: Container(
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                    color: Appcolor.bgDarkColor,
                                    borderRadius: BorderRadius.circular(8)),
                                margin: const EdgeInsets.all(8.0),
                                height: 100,
                                width: 150,
                                child: Column(
                                  children: [
                                    Container(
                                      width: 150,
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
                                        title: data[index]['docName']),
                                    5.heightBox,
                                    Appstyle.normal(
                                        title: data[index]['docCategory'],
                                        color: Colors.black54),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    }
                  },
                ),
                5.heightBox,
                GestureDetector(
                  onTap: () {},
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Appstyle.normal(
                        title: "View",
                        color: Appcolor.bluecolor,
                        size: Appsize.size18),
                  ),
                ),
                10.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                      4,
                      (index) => Container(
                            decoration: BoxDecoration(
                                color: Appcolor.bluecolor,
                                borderRadius: BorderRadius.circular(9.0)),
                            padding: const EdgeInsets.all(21.0),
                            child: Column(
                              children: [
                                Image.asset(
                                  AppAssets.body,
                                  color: Appcolor.whitecolor,
                                  width: 35,
                                ),
                                5.heightBox,
                                Appstyle.normal(
                                    title: "Lab_1", color: Appcolor.whitecolor)
                              ],
                            ),
                          )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
