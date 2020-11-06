import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:xtools/entities/toolModuleItem.dart';

class ToolCard extends StatelessWidget {
  final ToolModuleItem item;

  const ToolCard({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 10.0,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/${item.backgroundImage}'),
            fit: BoxFit.fitWidth,
          ),
          borderRadius: BorderRadius.circular(3),
        ),
        child: Container(
          color: Colors.black.withOpacity(0.6),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 20.0),
                width: 30.0,
                child: Icon(
                  item.iconData,
                  color: Colors.teal,
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.bottomLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 25.0,
                          top: 5.0,
                        ),
                        child: Text(
                          item.displayText,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 5.0,
                          left: 25.0,
                        ),
                        child: Text(
                          item.description,
                          style: TextStyle(
                            color: Colors.white60,
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(right: 10.0),
                child: Icon(
                  FontAwesomeIcons.angleDoubleRight,
                  color: Colors.white60,
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, item.routePath);
      },
    );
  }
}
