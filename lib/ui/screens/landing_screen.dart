import 'package:flutter/material.dart';
import 'package:lovelife/ui/screens/home_screens/matches_screen.dart';
import 'package:lovelife/ui/screens/home_screens/payment_screen.dart';
import 'package:lovelife/ui/screens/home_screens/profile_screen.dart';

import '../themes/constants.dart';
import 'home_screens/home_screen.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  int selectedIndex = 0;
  List<Widget> screens = [
    const HomeScreen(),
    const MatchesScreen(),
    PaymentScreen(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double maxHeight = constraints.maxHeight;
      double maxWidth = constraints.maxWidth;
      double h1p = maxHeight * 0.01;
      double h10p = maxHeight * 0.1;
      double w10p = maxWidth * 0.1;
      double w1p = maxWidth * 0.01;
      return Scaffold(
        body: screens[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: kPrimaryColor,
          unselectedItemColor: Colors.blueGrey,
          selectedLabelStyle: TextStylez.textStyle9,
          unselectedLabelStyle: TextStylez.textStyle10,
          currentIndex: selectedIndex,
          elevation: 4,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Container(
                height: h1p * 7,
                width: w1p * 8,
                child: Icon(Icons.home,
                    color:
                        selectedIndex == 0 ? kPrimaryColor : Colors.blueGrey),
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
                icon: Container(
                  height: h1p * 7,
                  width: w1p * 8,
                  child: Icon(Icons.favorite,
                      color:
                          selectedIndex == 1 ? kPrimaryColor : Colors.blueGrey),
                ),
                label: "Matches"),
            BottomNavigationBarItem(
                icon: Container(
                  height: h1p * 7,
                  width: w1p * 8,
                  child: Icon(Icons.payment,
                      color:
                          selectedIndex == 2 ? kPrimaryColor : Colors.blueGrey),
                ),
                label: "Payment"),
            BottomNavigationBarItem(
              icon: Container(
                height: h1p * 7,
                width: w1p * 8,
                child: Icon(Icons.person,
                    color:
                        selectedIndex == 3 ? kPrimaryColor : Colors.blueGrey),
              ),
              label: "Profile",
            ),
          ],
        ),
      );
    });
  }
}
