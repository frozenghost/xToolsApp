import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';

class ProfitCalculationResult {
  final DateTime confirmDate;
  final DateTime requestDate;
  final DateTime refundDate;
  final int realKeepDays;
  final double expectedProfit;

  ProfitCalculationResult({
    @required this.confirmDate,
    @required this.requestDate,
    @required this.refundDate,
    @required this.expectedProfit,
    @required this.realKeepDays,
  });

  Container generateResultWidget() {
    return Container(
      child: Column(
        children: [
          Text("购买日期：${formatDate(requestDate, [yyyy, '-', mm, '-', 'dd'])}"),
          Text('扣款确认日期：${formatDate(confirmDate, [yyyy, '-', mm, '-', 'dd'])}'),
          Text('资金到账日期：${formatDate(refundDate, [yyyy, '-', mm, '-', 'dd'])}'),
          Text('实际持有天数：$realKeepDays天'),
          Text('预期收益：${expectedProfit.toStringAsFixed(2)}'),
        ],
      ),
    );
  }
}
