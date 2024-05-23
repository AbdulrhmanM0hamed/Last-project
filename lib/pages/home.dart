import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:doctor_app/Common/Color_extentions.dart';
import 'package:doctor_app/generated/l10n.dart';
import 'package:doctor_app/pages/account_page.dart';
import 'package:doctor_app/pages/chat_page.dart';
import 'package:doctor_app/pages/home_page%20copy.dart';
import 'package:doctor_app/pages/setting_page.dart';
import 'package:doctor_app/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'doctor_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> _pages = [
    HomePage_F(),
    DoctorPage(),
    ChatPage(),
    SettingsPage()
  ];

  int _currentIndex = 0;
  PageController _pageController = new PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() => _currentIndex = index);
            },
            children: _pages),
      ),
      bottomNavigationBar: BottomNavyBar(
        backgroundColor: Colors.white,
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
              activeColor: Color.fromARGB(235, 5, 142, 240),
              inactiveColor: Colors.black,
              title: Text(
                S.of(context).home,
                style: TextStyle(color: Colors.black),
              ),
              icon: Icon(Icons.home)),
          BottomNavyBarItem(
              activeColor: Color.fromARGB(236, 4, 131, 221),
              inactiveColor: Colors.black,
              title: Text(
                S.of(context).doctor,
                style: TextStyle(color: Colors.black),
              ),
              icon: Icon(Icons.medical_services_rounded)),
          BottomNavyBarItem(
              activeColor: Color.fromARGB(236, 4, 131, 221),
              inactiveColor: Colors.black,
              title: Text(
                S.of(context).chat,
                style: TextStyle(color: Colors.black),
              ),
              icon: Icon(CupertinoIcons.chat_bubble_2_fill)),
          BottomNavyBarItem(
              activeColor: Color.fromARGB(236, 4, 131, 221),
              inactiveColor: Colors.black,
              title: Text(
                S.of(context).account,
                style: TextStyle(color: Colors.black),
              ),
              icon: Icon(Icons.manage_accounts_rounded)),
        ],
      ),
    );
  }
}
