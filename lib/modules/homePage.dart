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
  PageController _controller;
  final List<Widget> tabViews = [
    ToolTabPage(),
    FavouriteTabPage(),
    SettingsTabPage(),
  ];
  int _index;

  @override
  void initState() {
    super.initState();
    _index = 0;
    _controller = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/day/1.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: _index != 0 ? Colors.white : Colors.transparent,
        appBar: _index == 0
            ? PreferredSize(
                preferredSize: Size.fromHeight(150.0),
                child: AppBar(
                  title: Text('欢迎使用XTools'),
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.grey.withOpacity(0.3),
                ))
            : AppBar(
                title: Text('欢迎使用XTools'),
              ),
        body: SafeArea(
          child: PageView.builder(
            physics: NeverScrollableScrollPhysics(),
            controller: _controller,
            itemCount: tabViews.length,
            itemBuilder: (context, index) {
              return tabViews[index];
            },
            onPageChanged: (index) {
              if (index != _index) {
                setState(() {
                  _index = index;
                });
              }
            },
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.amber.shade900,
          selectedLabelStyle: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
          ),
          iconSize: 26.0,
          backgroundColor: Colors.white.withOpacity(0.4),
          currentIndex: _index,
          selectedFontSize: 14.0,
          unselectedFontSize: 14.0,
          items: ItemGenerator()
              .getHomePageBottomNavigationBarItem(homePageTabIcons),
          onTap: (index) {
            _controller.animateToPage(index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.ease);
          },
        ),
      ),
    );
  }
}
