import 'package:flutter/material.dart';
import 'package:weight_tracker_app/views/add_records.dart';
import 'package:weight_tracker_app/views/graph.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:get/get.dart';
import 'package:weight_tracker_app/views/history.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentTab = 0;
  Widget _currScreen = GraphScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //appBar: AppBar(title: Text("Weight Tracker")),
      body: _currScreen,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.black,
        onPressed: () {
          Get.to(() => AddRecordView());
        },
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar(
        height: Get.height / 11,
        gapLocation: GapLocation.center,
        activeColor: Colors.white,
        inactiveColor: Colors.yellow,
        backgroundColor: Colors.black,
        icons: [Icons.show_chart, Icons.history],
        iconSize: 30,
        activeIndex: _currentTab,
        onTap: (int) {
          setState(() {
            _currentTab = int;
            _currScreen = (int == 0) ? GraphScreen() : HistoryScreen();
          });
        },
      ),
    );
  }
}
