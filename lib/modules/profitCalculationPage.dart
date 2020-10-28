import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:xtools/constants/consts.dart';
import 'package:xtools/widgets/bottomButton.dart';
import 'package:xtools/widgets/formContainer.dart';

class ProfitCalculationPage extends StatefulWidget {
  @override
  _ProfitCalculationPageState createState() => _ProfitCalculationPageState();
}

class _ProfitCalculationPageState extends State<ProfitCalculationPage> {
  double profitRate = 350.0;
  DateTime requestDate = DateTime.now();

  TextEditingController _controller;
  TextEditingController _buyBackDelayController;
  TextEditingController _confirmDelayController;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _buyBackDelayController = TextEditingController(text: '1');
    _confirmDelayController = TextEditingController(text: '1');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('收益计算器'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            child: Form(
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
                  TextField(
                    decoration: InputDecoration(
                      labelText: '本金',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      WhitelistingTextInputFormatter.digitsOnly,
                    ],
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
                          child: SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              trackHeight: 7.0,
                            ),
                            child: Slider(
                              value: profitRate,
                              onChanged: (value) {
                                setState(() {
                                  profitRate = value;
                                });
                              },
                              min: 100.0,
                              max: 700.0,
                            ),
                          ),
                        ),
                        Text(
                          (profitRate / 100).toStringAsFixed(2) + '%',
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
                              '${requestDate.year} 年 ${requestDate.month} 月 ${requestDate.day} 日'),
                        ),
                      ),
                      FlatButton(
                        child: Text(
                          '选择日期',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                        onPressed: () {
                          DatePicker.showDatePicker(
                            context,
                            showTitleActions: true,
                            minTime: DateTime.now().add(Duration(days: 1)),
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
                  TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      labelText: '持有天数',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      WhitelistingTextInputFormatter.digitsOnly,
                    ],
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  TextField(
                    controller: _confirmDelayController,
                    decoration: InputDecoration(
                      labelText: '扣款滞后(默认T+1)',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      WhitelistingTextInputFormatter.digitsOnly,
                    ],
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  TextField(
                    controller: _buyBackDelayController,
                    decoration: InputDecoration(
                      labelText: '赎回滞后(默认T+1)',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      WhitelistingTextInputFormatter.digitsOnly,
                    ],
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      child: BottomButton(
                        text: '计算收益',
                        onTap: () {},
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
