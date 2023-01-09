import 'package:dangnhap_lms/schedule_page.dart';
import 'package:flutter/material.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import 'package:dangnhap_lms/dashboard.dart';
import 'package:dangnhap_lms/notification_page.dart';
import 'package:dangnhap_lms/phone_book_page.dart';
import 'Message_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyHomPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomePage();
  }
}

class HomePage extends State<MyHomPage> {
  TabController? _tabController;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
        child: DefaultTabController(
      length: 5,
      child: Scaffold(
          backgroundColor: Color.fromRGBO(229, 229, 229, 1),
          body: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _tabController,
            children: [
              DashBoard(),
              MySchedule(),
              MyPhoneBookPage(),
              Notification_Page(),
              MyMessagePage(),
            ],
          ),
          bottomNavigationBar: Container(
              height: 60,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(10))),
              child: TabBar(
                controller: _tabController,
                physics: const NeverScrollableScrollPhysics(),
                indicatorWeight: 3,
                indicator: MaterialIndicator(
                  color: Color.fromRGBO(248, 129, 37, 1),
                  topRightRadius: 10,
                  topLeftRadius: 10,
                  paintingStyle: PaintingStyle.fill,
                ),
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                indicatorPadding: EdgeInsets.fromLTRB(4, 0, 4, 0),
                onTap: (index) {
                  setState(() {
                    _selectedPageIndex = index;
                  });
                },
                tabs: [
                  Tab(
                    icon: SvgPicture.asset(
                      "assets/Images/icon_Dashbroad.svg",
                      color: _selectedPageIndex == 0
                          ? Color.fromRGBO(248, 129, 37, 1)
                          : Color.fromRGBO(177, 177, 177, 1),
                    ),
                  ),
                  Tab(
                      icon: SvgPicture.asset(
                    "assets/Images/iconSchedule.svg",
                    color: _selectedPageIndex == 1
                        ? Color.fromRGBO(248, 129, 37, 1)
                        : Color.fromRGBO(177, 177, 177, 1),
                  )),
                  Tab(
                      icon: _selectedPageIndex == 2
                          ? SvgPicture.asset(
                              "assets/Images/iconDiligence_active.svg")
                          : SvgPicture.asset(
                              "assets/Images/iconDiligence.svg",
                            )),
                  Tab(
                      icon: _selectedPageIndex == 3
                          ? SvgPicture.asset(
                              "assets/Images/iconNotification_active.svg")
                          : SvgPicture.asset("assets/Images/iconNotification.svg")),
                  Tab(
                      icon: _selectedPageIndex == 4
                          ? SvgPicture.asset("assets/Images/iconMessage_active.svg")
                          : SvgPicture.asset("assets/Images/iconMessage.svg")),
                ],
              ))),
    ));
  }
}
