import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ingress_key_manager/pages/profile.page.dart';
import 'package:ingress_key_manager/util/utils.dart';

class HomePage extends StatefulWidget {
  Utils utils;

  HomePage(Utils utils) {
    this.utils = utils;
  }

  @override
  _HomePageState createState() => _HomePageState(utils);
}

PageController pageController;

class _HomePageState extends State<HomePage> {
  int _page = 0;
  Utils utils;

  _HomePageState(Utils utils) {
    this.utils = utils;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          Container(
            color: Colors.white,
            //homepage
          ),
          Container(
            color: Colors.white,
            //dashboard
          ),
          Container(
            color: Colors.white,
            //operations
          ),
          Container(
            color: Colors.white,
            //routes
          ),
          Container(
            child: ProfilePage(utils),
            color: Colors.white,
            //profile
          ),
        ],
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: Colors.white,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home,
                  color: (_page == 0) ? Colors.black : Colors.grey),
              title: Container(height: 0.0),
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.alt_route,
                  color: (_page == 1) ? Colors.black : Colors.grey),
              title: Container(height: 0.0),
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.vpn_key_sharp,
                  color: (_page == 2) ? Colors.black : Colors.grey),
              title: Container(height: 0.0),
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard,
                  color: (_page == 3) ? Colors.black : Colors.grey),
              title: Container(height: 0.0),
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.person,
                  color: (_page == 4) ? Colors.black : Colors.grey),
              backgroundColor: Colors.white),
        ],
        onTap: navigationTapped,
        currentIndex: _page,
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
