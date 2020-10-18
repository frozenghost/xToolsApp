import 'package:flutter/cupertino.dart';
import 'package:xtools/constants/consts.dart';

class BankProfitCalculator {
  BankProfitCalculator(
      {@required this.fundAmount,
      @required this.profitRate,
      @required this.requestDate,
      @required this.buyBackDate,
      this.defaultDelayDate});

  final double profitRate;
  final DateTime requestDate;
  final DateTime buyBackDate;
  final int defaultDelayDate;
  final double fundAmount;

  double calculateProfit() {
    double result;

    result = fundAmount *
        profitRate *
        buyBackDate.difference(requestDate).inDays /
        dayOfYear;

    return result;
  }
}
