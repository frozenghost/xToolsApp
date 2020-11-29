import 'package:flutter/material.dart';
import 'package:xtools/modules/homePage.dart';
import 'package:xtools/modules/indexEstimationPage.dart';

import 'modules/profitCalculationPage.dart';

Function onGenerateRoute = (RouteSettings settings) {
  var routes = <String, WidgetBuilder>{
    "/profit": (ctx) => ProfitCalculationPage(),
    "/index": (ctx) => IndexEstimationPage(),
    "/": (ctx) => HomePage(),
  };
  WidgetBuilder builder = routes[settings.name];
  return MaterialPageRoute(builder: (ctx) => builder(ctx));
};
