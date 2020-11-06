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
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Expanded(
            child: Container(
              child: GridView.count(
                crossAxisCount: kdefaultGridColumn,
                children: ItemGenerator().getToolModules(context),
                childAspectRatio: 9 / 2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
