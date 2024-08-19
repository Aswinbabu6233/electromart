import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:electromart/pages/home.dart';
import 'package:electromart/pages/order.dart';
import 'package:electromart/pages/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Bottomnav extends StatefulWidget {
  const Bottomnav({super.key});

  @override
  State<Bottomnav> createState() => _BottomnavState();
}

class _BottomnavState extends State<Bottomnav> {
  late List<Widget> pages;
  late Home home;
  late Order order;
  late Profile profile;
  int CurrentTabIndex = 0;
  @override
  void initState() {
    home = Home();
    order = Order();
    profile = Profile();
    pages = [home, order, profile];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
          height: 50,
          backgroundColor: Color.fromARGB(255, 239, 238, 238),
          color: Colors.black,
          animationDuration: Duration(milliseconds: 500),
          onTap: (index) {
            setState(() {
              CurrentTabIndex = index;
            });
          },
          items: [
            Icon(
              CupertinoIcons.home,
              color: Colors.white,
            ),
            Icon(
              Icons.shopping_bag_outlined,
              color: Colors.white,
            ),
            Icon(
              CupertinoIcons.person,
              color: Colors.white,
            ),
          ]),
      body: pages[CurrentTabIndex],
    );
  }
}
