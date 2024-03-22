import 'package:doctor_appointment/const/consts.dart';

class categoryList extends StatelessWidget {
  const categoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appcolor.bluecolor,
        title: Appstyle.bold(
            title: "Doctor Catogery",
            color: Appcolor.whitecolor,
            size: Appsize.size18),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: listicon.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              crossAxisCount: 2,
              mainAxisExtent: 170),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.to(Category_detail(
                  catName: listTitle[index],
                ));
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Appcolor.bluecolor,
                    borderRadius: BorderRadius.circular(15.0)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Image.asset(
                          listicon[index],
                          width: 60,
                          color: Appcolor.whitecolor,
                        ),
                      ),
                      Divider(
                        color: Appcolor.whitecolor,
                      ),
                      25.heightBox,
                      Appstyle.bold(
                          title: listTitle[index],
                          color: Appcolor.whitecolor,
                          size: Appsize.size16),
                      Appstyle.normal(
                          title: "13 Specialist",
                          color: Appcolor.whitecolor.withOpacity(0.5))
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
