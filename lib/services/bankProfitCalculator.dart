import 'package:flutter/cupertino.dart';

import '../constants/consts.dart';

class BankProfitCalculator {
  BankProfitCalculator(
      {@required this.fundAmount,
      @required this.profitRate,
      @required this.requestDate,
      @required this.buyBackDate,
      this.defaultDelayDate = 1,
      this.defaultDaysOfYear = daysOfYear});

  final double profitRate;
  final DateTime requestDate;
  final DateTime buyBackDate;
  final int defaultDelayDate;
  final double fundAmount;
  final int defaultDaysOfYear;

  double calculateProfit() {
    double result;

    result = fundAmount *
        profitRate *
        buyBackDate.difference(requestDate).inDays /
        defaultDaysOfYear;

    return result;
  }
}
