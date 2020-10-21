import 'package:flutter/material.dart';
import 'package:xtools/constants/consts.dart';

class IconButtonWithText extends StatelessWidget {
  IconButtonWithText(
      {@required this.iconData, @required this.text, this.onTap});

  final IconData iconData;
  final String text;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(
              iconData,
              size: 32.0,
              color: Colors.teal,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            text == null ? '' : text,
            style: defaultIconTextStyle,
          )
        ],
      ),
    );
  }
}
