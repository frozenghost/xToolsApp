import 'package:flutter/cupertino.dart';

class ToolModuleItem {
  ToolModuleItem(
      {this.moduleId,
      this.moduleName,
      this.displayText,
      this.description,
      this.iconData,
      this.routePath,
      this.backgroundImage});

  final int moduleId;
  final String moduleName;
  final String displayText;
  final String description;
  final IconData iconData;
  final String routePath;
  final String backgroundImage;
}
