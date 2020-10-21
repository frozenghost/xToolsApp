import 'package:flutter/material.dart';

import 'modules/profitCalculationPage.dart';

Function onGenerateRoute = (RouteSettings settings) {
  var routes = <String, WidgetBuilder>{
    "/profit": (ctx) => ProfitCalculationPage(),
  };
  WidgetBuilder builder = routes[settings.name];
  return MaterialPageRoute(builder: (ctx) => builder(ctx));
};
