import 'package:flutter/material.dart';
import 'package:xtools/services/itemGenerator.dart';
import '../constants/consts.dart';

class ToolTabPage extends StatefulWidget {
  @override
  _ToolTabPageState createState() => _ToolTabPageState();
}

class _ToolTabPageState extends State<ToolTabPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Text(
            '你好，今天是个好日子',
            textAlign: TextAlign.center,
          ),
          height: 40.0,
        ),
        Expanded(
          child: Container(
            child: GridView.count(
              crossAxisCount: kdefaultGridColumn,
              children: ItemGenerator().getToolModules(context),
            ),
          ),
        ),
      ],
    );
  }
}
