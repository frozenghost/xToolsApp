import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:xtools/constants/consts.dart';
import 'package:xtools/entities/profitCalculationResult.dart';
import 'package:xtools/services/bankProfitCalculator.dart';
import 'package:xtools/widgets/bottomButton.dart';
import 'package:xtools/widgets/formContainer.dart';

class ProfitCalculationPage extends StatefulWidget {
  @override
  _ProfitCalculationPageState createState() => _ProfitCalculationPageState();
}

class _ProfitCalculationPageState extends State<ProfitCalculationPage> {
  double fund = 0;
  double profitRate = 3.5;
  DateTime requestDate = DateTime.now();
  int keepDays = 0;
  int defaultDaysOfYear = 365;
  int defaultConfirmDelay = 1;
  int defaultBuyBackDelay = 1;

  TextEditingController _daysOfYearController;
  TextEditingController _buyBackDelayController;
  TextEditingController _confirmDelayController;
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _daysOfYearController = TextEditingController(text: kdaysOfYear.toString());
    _buyBackDelayController =
        TextEditingController(text: kdefaultConfirmDelay.toString());
    _confirmDelayController =
        TextEditingController(text: kdefaultBuyBackDelay.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        title: Text('收益计算器'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Text(
                          '请输入以下信息：',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: '本金',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        WhitelistingTextInputFormatter.digitsOnly,
                      ],
                      onSaved: (val) => {this.fund = double.parse(val)},
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    FormContainer(
                      child: Row(
                        children: [
                          Text(
                            '年化收益率',
                            style: kDefaultFormLabelTextStyle,
                          ),
                          Expanded(
                            child: Center(
                              child: Text(
                                profitRate.toStringAsFixed(2) + '%',
                                style: TextStyle(
                                  letterSpacing: 3,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                          FlatButton(
                            child: Text(
                              '选择利率',
                              style: kformSelectButtonTextStyle,
                            ),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return NumberPickerDialog.decimal(
                                      decimalPlaces: 2,
                                      minValue: 2,
                                      maxValue: 10,
                                      title: Text("请选择利率"),
                                      initialDoubleValue: profitRate,
                                    );
                                  }).then((value) {
                                if (value != null) {
                                  setState(() {
                                    profitRate = value;
                                  });
                                }
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    FormContainer(
                      child: Row(children: [
                        Text(
                          '购买日期',
                          style: kDefaultFormLabelTextStyle,
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              '${requestDate.year} 年 ${requestDate.month} 月 ${requestDate.day} 日',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        FlatButton(
                          child: Text(
                            '选择日期',
                            style: kformSelectButtonTextStyle,
                          ),
                          onPressed: () {
                            DatePicker.showDatePicker(
                              context,
                              showTitleActions: true,
                              minTime: DateTime.now().add(Duration(days: -183)),
                              maxTime: DateTime.now().add(Duration(days: 31)),
                              currentTime: DateTime.now(),
                              locale: LocaleType.zh,
                            ).then((value) {
                              setState(() {
                                requestDate = value;
                              });
                            });
                          },
                        ),
                      ]),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: '持有天数',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        WhitelistingTextInputFormatter.digitsOnly,
                      ],
                      onSaved: (val) => {this.keepDays = int.parse(val)},
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    TextFormField(
                      controller: _daysOfYearController,
                      decoration: InputDecoration(
                        labelText: '默认年化计算天数',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        WhitelistingTextInputFormatter.digitsOnly,
                      ],
                      onSaved: (val) =>
                          {this.defaultDaysOfYear = int.parse(val)},
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    TextFormField(
                      controller: _confirmDelayController,
                      decoration: InputDecoration(
                        labelText: '扣款滞后(默认T+1)',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        WhitelistingTextInputFormatter.digitsOnly,
                      ],
                      onSaved: (val) =>
                          {this.defaultConfirmDelay = int.parse(val)},
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    TextFormField(
                      controller: _buyBackDelayController,
                      decoration: InputDecoration(
                        labelText: '赎回滞后(默认T+1)',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        WhitelistingTextInputFormatter.digitsOnly,
                      ],
                      onSaved: (val) =>
                          {this.defaultBuyBackDelay = int.parse(val)},
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      child: BottomButton(
                        text: '计算收益',
                        onTap: () {
                          calculateProfit();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void calculateProfit() {
    var _form = _formKey.currentState;

    if (_form.validate()) {
      _form.save();
    }

    ProfitCalculationResult result = BankProfitCalculator(
      fundAmount: fund,
      profitRate: profitRate,
      keepDays: keepDays,
      requestDate: requestDate,
      defaultBuyBackDelay: this.defaultBuyBackDelay,
      defaultDaysOfYear: this.defaultDaysOfYear,
      defaultDelayDate: this.defaultConfirmDelay,
    ).calculateProfit();

    print(result.expectedProfit);
    Alert(
      context: context,
      type: AlertType.info,
      title: '计算结果',
      content: result.generateResultWidget(),
      buttons: [
        DialogButton(
          child: Text('OK'),
          onPressed: () => Navigator.pop(context),
        ),
        DialogButton(
          child: Text('返回主页'),
          onPressed: () => Navigator.pushNamed(context, '/'),
        ),
      ],
    ).show();
  }
}
