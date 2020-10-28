import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:xtools/entities/tabItem.dart';
import 'package:xtools/entities/toolModuleItem.dart';
import 'package:xtools/enums/homePageTab.dart';

const int daysOfYear = 365;
const int defaultGridColumn = 3;
const double bottomContainerHeight = 70.0;

const TextStyle kdefaultIconTextStyle = TextStyle(fontSize: 16.0);
const TextStyle kDefaultFormLabelTextStyle = TextStyle(
  fontSize: 16.0,
  color: Colors.grey,
);

final List<TabItem> homePageTabIcons = [
  TabItem(
      tabType: HomePageTab.Tools.index,
      text: '工具',
      icon: FontAwesomeIcons.tools),
  TabItem(
      tabType: HomePageTab.Favourites.index,
      text: '收藏',
      icon: FontAwesomeIcons.star),
  TabItem(
      tabType: HomePageTab.Settings.index,
      text: '设置',
      icon: FontAwesomeIcons.cog),
];

final List<ToolModuleItem> toolModules = [
  ToolModuleItem(
      moduleId: 10001,
      moduleName: 'profitCalculator',
      displayText: '收益计算器',
      iconData: FontAwesomeIcons.dollarSign),
];
