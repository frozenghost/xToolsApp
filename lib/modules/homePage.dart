import 'package:flutter/material.dart';
import 'package:xtools/modules/favouriteTabPage.dart';
import 'package:xtools/modules/settingsTabPage.dart';
import 'package:xtools/modules/toolTabPage.dart';
import 'package:xtools/services/itemGenerator.dart';
import '../constants/consts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> tabViews = [
    ToolTabPage(),
    FavouriteTabPage(),
    SettingsTabPage(),
  ];
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('欢迎使用XTools'),
      ),
      body: SafeArea(
        child: tabViews[_index],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        selectedFontSize: 14.0,
        unselectedFontSize: 14.0,
        items: ItemGenerator()
            .getHomePageBottomNavigationBarItem(homePageTabIcons),
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
      ),
    );
  }
}
