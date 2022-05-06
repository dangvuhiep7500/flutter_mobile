import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_app/screens/login/login_screen.dart';
import 'package:project_app/screens/testlistview/listview.dart';

class HomeScreen extends StatefulWidget {
  final String accesstoken;
  const HomeScreen({Key? key, required this.accesstoken}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final PageController _myPage = PageController(initialPage: 0);
  int index = 0;

  // int _selectedIndex = 0;
  // final tabs = <Widget>[
  //   const Scaffold(body: ListViewTest()),
  //   const Center(child: Text("Người thân")),
  //   const Center(child: Text("Nghĩa trang")),
  //   const Center(child: Text("Liên hệ")),
  // ];
  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  Widget buildPageView() {
    return PageView(
      controller: _myPage,
      children: const <Widget>[
        Scaffold(body: ListViewTest()),
        Center(child: Text("Người thân")),
        Center(child: Text("Nghĩa trang")),
        Center(child: Text("Liên hệ")),
      ],
    );
  }

  Widget currentScreen = const ListViewTest();
  Widget buildBottomBarItem() {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      color: Colors.white,
      child: SizedBox(
        height: 75,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Material(
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                IconButton(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  icon: Image.asset(
                    'assets/icons/iconhome.png',
                  ),
                  iconSize: 40,
                  splashRadius: 30,
                  tooltip: 'Trang chủ',
                  splashColor: Colors.red,
                  onPressed: () {
                    setState(
                      () {
                        index = 0;
                        _myPage.jumpToPage(0);
                      },
                    );
                  },
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Trang chủ",
                  style: TextStyle(
                    color: index == 0 ? Colors.red : Colors.grey,
                  ),
                ),
              ]),
            ),
            Material(
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                IconButton(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    icon: Image.asset('assets/icons/iconnguoithan.png'),
                    iconSize: 40,
                    color: Colors.green,
                    tooltip: "Người thân",
                    splashRadius: 30,
                    splashColor: Colors.red,
                    onPressed: () {
                      setState(
                        () {
                          index = 1;
                          _myPage.jumpToPage(index);
                        },
                      );
                    }),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Người thân",
                  style: TextStyle(
                    color: index == 1 ? Colors.red : Colors.grey,
                  ),
                ),
              ]),
            ),
            Material(
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                IconButton(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    icon: Image.asset('assets/icons/iconnghiatrang.png'),
                    iconSize: 40,
                    tooltip: "Nghĩa trang",
                    splashRadius: 30,
                    splashColor: Colors.red,
                    onPressed: () {
                      setState(
                        () {
                          index = 2;
                          _myPage.jumpToPage(index);
                        },
                      );
                    }),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Nghĩa trang",
                  style: TextStyle(
                    color: index == 2 ? Colors.red : Colors.grey,
                  ),
                ),
              ]),
            ),
            Material(
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                IconButton(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    icon: Image.asset('assets/icons/iconlienhe.png'),
                    iconSize: 40,
                    tooltip: "Liên hệ",
                    splashRadius: 30,
                    splashColor: Colors.red,
                    onPressed: () {
                      setState(
                        () {
                          index = 3;
                          _myPage.jumpToPage(index);
                        },
                      );
                    }),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Liên hệ",
                  style: TextStyle(
                    color: index == 3 ? Colors.red : Colors.grey,
                  ),
                ),
              ]),
            ),
            // Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            //   // buildTabItem(
            //   //   index: 1,
            //   //   icon: const Icon(Icons.search),
            //   // ),
            //   IconButton(
            //       padding: const EdgeInsets.symmetric(horizontal: 8.0),
            //       icon: Image.asset('assets/icons/iconnguoithan.png'),
            //       iconSize: 40,
            //       color: Colors.green,
            //       tooltip: "Người thân",
            //       splashRadius: 30,
            //       splashColor: Colors.red,
            //       onPressed: () {
            //         setState(
            //           () {
            //             _myPage.jumpToPage(1);
            //           },
            //         );
            //       }),
            //   const SizedBox(
            //     height: 5,
            //   ),
            //   const Text(
            //     "Người thân",
            //     style: TextStyle(color: Colors.grey),
            //   ),
            // ]),
            // Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            //   IconButton(
            //       padding: const EdgeInsets.symmetric(horizontal: 8.0),
            //       icon: Image.asset('assets/icons/iconnghiatrang.png'),
            //       iconSize: 40,
            //       tooltip: "Nghĩa trang",
            //       splashRadius: 30,
            //       splashColor: Colors.red,
            //       onPressed: () {
            //         setState(
            //           () {
            //             _myPage.jumpToPage(2);
            //           },
            //         );
            //       }),
            //   const SizedBox(
            //     height: 5,
            //   ),
            //   const Text(
            //     "Nghĩa trang",
            //     style: TextStyle(color: Colors.grey),
            //   ),
            // ]),
            // Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            //   IconButton(
            //       padding: const EdgeInsets.symmetric(horizontal: 8.0),
            //       icon: Image.asset('assets/icons/iconlienhe.png'),
            //       iconSize: 40,
            //       tooltip: "Liên hệ",
            //       splashRadius: 30,
            //       splashColor: Colors.red,
            //       onPressed: () {
            //         setState(
            //           () {
            //             _myPage.jumpToPage(3);
            //           },
            //         );
            //       }),
            //   const SizedBox(
            //     height: 5,
            //   ),
            //   const Text(
            //     "Liên hệ",
            //     style: TextStyle(color: Colors.grey),
            //   ),
            // ]),
          ],
          //   ),
          // ],
        ),
      ),
    );
  }

  void onChangedTab(int index) {
    setState(() {
      this.index = index;
    });
  }

  Widget buildTabItem({
    required int index,
    required Icon icon,
  }) {
    final isSelected = index == index;

    return IconTheme(
      data: IconThemeData(
        color: isSelected ? Colors.red : Colors.black,
      ),
      child: IconButton(
        icon: icon,
        onPressed: () => onChangedTab(index),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("BottomAppBar Example"),
      // ),
      // body: Center(child: tabs.elementAt(_selectedIndex)),
      // body: const Center(
      //   child: Text(
      //     'Flutter BottomAppBar Example',
      //   ),
      // ),
      body: buildPageView(),
      // body: tabs[index],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: buildBottomBarItem(),
      // bottomNavigationBar: BottomNavigationBar(
      //   iconSize: 30,
      //   type: BottomNavigationBarType.fixed,
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: ImageIcon(
      //         AssetImage("assets/icons/iconhome.png"),
      //       ),
      //       label: 'Trang chủ',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //         AppIcon.iconlienhe,
      //         size: 50,
      //       ),
      //       label: 'Người thân',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //         AppIcon.iconlienhe,
      //       ),
      //       label: 'Nghĩa trang',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //         FontAwesomeIcons.rocketchat,
      //         color: Colors.red,
      //       ),
      //       label: 'Liên hệ',
      //     ),
      //   ],
      //   currentIndex: _selectedIndex,
      //   selectedItemColor: Colors.red,
      //   unselectedItemColor: Colors.grey[800],
      //   onTap: _onItemTapped,
      // ),
    );
  }
}
