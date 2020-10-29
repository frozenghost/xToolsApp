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
    DateTime realRequestDate = requestDate;
    int realKeepDays = keepDays + 1;

    if (requestDate.weekday == 5) {
      realRequestDate = requestDate.add(Duration(days: 3));
    } //skip weekend
    else {
      realRequestDate = requestDate.add(Duration(days: 1));
    }

    DateTime buyBackDate = realRequestDate.add(Duration(days: realKeepDays));
    if (buyBackDate.weekday == 6)
      realKeepDays += 2;
    else if (buyBackDate.weekday == 7) realKeepDays += 1;
    profitAmount =
        fundAmount * profitRate * realKeepDays / 100 / defaultDaysOfYear;
    buyBackDate = realRequestDate.add(Duration(days: realKeepDays));

    result = ProfitCalculationResult(
      requestDate: requestDate,
      confirmDate: realRequestDate,
      expectedProfit: profitAmount,
      realKeepDays: realKeepDays,
      refundDate: buyBackDate,
    );

    return result;
  }
}
