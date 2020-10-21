import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:xtools/entities/tabItem.dart';
import 'package:xtools/entities/toolModuleItem.dart';
import 'package:xtools/enums/homePageTab.dart';

const int daysOfYear = 365;
const int defaultGridColumn = 3;

const TextStyle defaultIconTextStyle = TextStyle(fontSize: 16.0);

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
  ToolModuleItem(
      moduleId: 10001,
      moduleName: 'profitCalculator',
      displayText: '收益计算器',
      iconData: FontAwesomeIcons.dollarSign),
  ToolModuleItem(
      moduleId: 10001,
      moduleName: 'profitCalculator',
      displayText: '收益计算器',
      iconData: FontAwesomeIcons.dollarSign),
];
