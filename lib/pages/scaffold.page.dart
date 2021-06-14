import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ingress_key_manager/pages/dashboard.page.dart';
import 'package:ingress_key_manager/pages/home.page.dart';
import 'package:ingress_key_manager/pages/operations.page.dart';
import 'package:ingress_key_manager/pages/profile.page.dart';
import 'package:ingress_key_manager/pages/routes.page.dart';
import 'package:ingress_key_manager/util/utils.dart';

class ScaffoldPage extends StatefulWidget {
  Utils utils;

  ScaffoldPage(Utils utils) {
    this.utils = utils;
  }

  @override
  _ScaffoldPageState createState() => _ScaffoldPageState(utils);
}

PageController pageController;

class _ScaffoldPageState extends State<ScaffoldPage> {
  int _page = 0;
  Utils utils;

  _ScaffoldPageState(Utils utils) {
    this.utils = utils;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: PageView(
          children: [
            Container(
              child: HomePage(utils),
              color: Colors.white,
              //homepage
            ),
            // Container(
            //   child: RoutesPage(utils),
            //   color: Colors.white,
            //   //routes
            // ),
            Container(
              child: OperationPage(utils),
              color: Colors.white,
              //operations
            ),
            // Container(
            //   child: DashboardPage(utils),
            //   color: Colors.white,
            //   //dashboard
            // ),
            Container(
              child: ProfilePage(utils),
              color: Colors.white,
            ),
          ],
          controller: pageController,
          physics: NeverScrollableScrollPhysics(),
          onPageChanged: onPageChanged,
        ),
        bottomNavigationBar: CupertinoTabBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: (_page == 0) ? Colors.white : Colors.grey),
            ),
            // BottomNavigationBarItem(
            //     icon: Icon(Icons.alt_route,
            //         color: (_page == 1) ? Colors.black : Colors.grey),
            //     title: Container(height: 0.0),
            //     backgroundColor: Colors.white),
            BottomNavigationBarItem(
              icon: Icon(Icons.vpn_key_sharp, color: (_page == 1) ? Colors.white : Colors.grey),
            ),
            // BottomNavigationBarItem(
            //     icon: Icon(Icons.dashboard,
            //         color: (_page == 3) ? Colors.black : Colors.grey),
            //     title: Container(height: 0.0),
            //     backgroundColor: Colors.white),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, color: (_page == 2) ? Colors.white : Colors.grey),
            ),
          ],
          onTap: navigationTapped,
          currentIndex: _page,
        ),
      ),
    );
  }

  void navigationTapped(int page) {
    //Animating Page
    pageController.jumpToPage(page);
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    utils.initiateUser();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }
}
