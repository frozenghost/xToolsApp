import 'package:flutter/cupertino.dart';
import 'package:xtools/entities/profitCalculationResult.dart';

import '../constants/consts.dart';

class BankProfitCalculator {
  BankProfitCalculator({
    @required this.fundAmount,
    @required this.profitRate,
    @required this.requestDate,
    @required this.keepDays,
    this.defaultDelayDate = kdefaultConfirmDelay,
    this.defaultDaysOfYear = kdaysOfYear,
    this.defaultBuyBackDelay = kdefaultBuyBackDelay,
  });

  final double profitRate;
  final DateTime requestDate;
  final int keepDays;
  final int defaultDelayDate;
  final int defaultBuyBackDelay;
  final double fundAmount;
  final int defaultDaysOfYear;

  ProfitCalculationResult calculateProfit() {
    ProfitCalculationResult result;
    double profitAmount = 0;
    DateTime realRequestDate =
        requestDate.add(Duration(days: defaultDelayDate));
    int realKeepDays = keepDays;

    if (realRequestDate.weekday == 6) {
      realRequestDate = realRequestDate.add(Duration(days: 2));
    } //skip weekend
    else if (realRequestDate.weekday == 7) {
      realRequestDate = realRequestDate.add(Duration(days: 1));
    }

    DateTime buyBackDate =
        realRequestDate.add(Duration(days: realKeepDays + 1));
    if (buyBackDate.weekday == 6)
      realKeepDays += 2;
    else if (buyBackDate.weekday == 7) realKeepDays += 1;
    profitAmount =
        fundAmount * profitRate * (realKeepDays + 1) / 100 / defaultDaysOfYear;
    buyBackDate = realRequestDate.add(Duration(days: realKeepDays));

    result = ProfitCalculationResult(
      requestDate: requestDate,
      confirmDate: realRequestDate,
      expectedProfit: profitAmount,
      realKeepDays: realKeepDays,
      refundDate: buyBackDate.add(Duration(days: defaultBuyBackDelay)),
    );

    return result;
  }
}
