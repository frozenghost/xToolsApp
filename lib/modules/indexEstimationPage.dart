import 'package:date_format/date_format.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:xtools/entities/index_item.dart';
import 'package:xtools/enums/indexEvalType.dart';
import 'package:xtools/enums/indexType.dart';
import 'package:xtools/services/indexServiceProvider.dart';

class IndexEstimationPage extends StatefulWidget {
  @override
  _IndexEstimationPageState createState() => _IndexEstimationPageState();
}

class _IndexEstimationPageState extends State<IndexEstimationPage> {
  List<IndexItem> list = new List<IndexItem>();
  Dio _dio = Dio();

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future getData() async {
    var temp = await IndexServiceProvider(dio: _dio).getIndexInfo();
    setState(() {
      list = temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            '指数估值(${list.length > 0 ? list[0].date : formatDate(DateTime.now(), [
                mm,
                '-',
                dd
              ])})'),
      ),
      body: SafeArea(
        child: RefreshIndicator(
            child: ListView.builder(
              itemBuilder: _renderRow,
              itemCount: list.length,
            ),
            onRefresh: getData),
      ),
    );
  }

  Widget _renderRow(BuildContext context, int index) {
    return ListTile(
      title: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  list[index].name,
                  style: TextStyle(fontSize: 15.0),
                ),
                SizedBox(
                  width: 8,
                ),
                getEvalDesc(list[index].evaType)
              ],
            ),
            Text(
              getIndexType(list[index].ttype),
              style: TextStyle(fontSize: 10),
            ),
          ],
        ),
      ),
      subtitle: Text(
          '比过去 ${(list[index].pbFlag ? (list[index].pbOverHistory * 100) : (list[index].peOverHistory * 100)).toStringAsFixed(2)}% 的时间低'),
      leading: getIconByEval(list[index].evaType),
      dense: true,
    );
  }

  String getIndexType(IndexType type) {
    switch (type) {
      case IndexType.broadBasedIndex:
        return '宽基指数';
      case IndexType.industryIndex:
        return '行业指数';
      case IndexType.strategyIndex:
        return '策略指数';
      default:
        return '未知指数';
    }
  }

  Icon getIconByEval(IndexEvalType type) {
    switch (type) {
      case IndexEvalType.low:
        return Icon(
          FontAwesomeIcons.angleDoubleDown,
          color: Colors.teal,
        );
      case IndexEvalType.mid:
        return Icon(
          FontAwesomeIcons.ellipsisH,
          color: Colors.yellow.shade600,
        );
      case IndexEvalType.high:
        return Icon(
          FontAwesomeIcons.angleDoubleUp,
          color: Colors.red,
        );
      default:
        return Icon(
          FontAwesomeIcons.userClock,
          color: Colors.grey,
        );
        break;
    }
  }

  Text getEvalDesc(IndexEvalType type) {
    switch (type) {
      case IndexEvalType.low:
        return Text(
          '估值偏低',
          style: TextStyle(
            fontSize: 14,
            color: Colors.teal,
          ),
        );
      case IndexEvalType.mid:
        return Text(
          '估值适中',
          style: TextStyle(
            fontSize: 14,
            color: Colors.yellow.shade600,
          ),
        );
      case IndexEvalType.high:
        return Text(
          '估值偏高',
          style: TextStyle(
            fontSize: 14,
            color: Colors.red,
          ),
        );
      default:
        return Text('');
    }
  }
}
