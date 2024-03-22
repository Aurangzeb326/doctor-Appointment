import 'package:doctor_appointment/const/consts.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  int selectetedItem = 0;
  List screenList = [
    const home_view(),
    const appointment_View(),
    const categoryList(),
    // const loginView(),
    const Setting_View()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screenList.elementAt(selectetedItem),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Appcolor.whitecolor,
          selectedFontSize: Appsize.size16,
          unselectedItemColor: Appcolor.whitecolor.withOpacity(0.5),
          selectedIconTheme: IconThemeData(color: Appcolor.whitecolor),
          type: BottomNavigationBarType.fixed,
          backgroundColor: Appcolor.bluecolor,
          currentIndex: selectetedItem,
          onTap: (value) {
            setState(() {
              selectetedItem = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "home",
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.book), label: "Appointment"),
            BottomNavigationBarItem(
                icon: Icon(Icons.category), label: "Category"),
            // BottomNavigationBarItem(icon: Icon(Icons.person), label: "doctor"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "Setting")
          ]),
    );
  }
}
