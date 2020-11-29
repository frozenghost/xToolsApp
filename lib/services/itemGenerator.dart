import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xtools/constants/consts.dart';
import 'package:xtools/entities/tabItem.dart';
import 'package:xtools/widgets/iconButtonWithText.dart';
import 'package:xtools/widgets/toolCard.dart';

class ItemGenerator {
  List<BottomNavigationBarItem> getHomePageBottomNavigationBarItem(
      List<TabItem> items) {
    return homePageTabIcons
        .map((item) => BottomNavigationBarItem(
              icon: Icon(item.icon),
              title: Text(item.text),
            ))
        .toList();
  }

  List<Padding> getToolModules(BuildContext context) {
    return toolModules
        .map(
          (item) => Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1.2,
                ),
              ),
              child: ToolCard(
                item: item,
              ),
            ),
          ),
        )
        .toList();
  }
}
