import 'package:flutter/cupertino.dart';

class ToolModuleItem {
  ToolModuleItem(
      {this.moduleId, this.moduleName, this.displayText, this.iconData});

  final int moduleId;
  final String moduleName;
  final String displayText;
  final IconData iconData;
}
