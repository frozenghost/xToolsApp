import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:xtools/entities/index_item.dart';
import 'package:xtools/services/baseServiceProvider.dart';

class IndexServiceProvider extends BaseServiceProvider {
  IndexServiceProvider({
    @required Dio dio,
    Function errorCallBack,
  }) : super(dio: dio, errorCallBack: errorCallBack);

  final Map<String, String> defaultHeaders = {
    'Content-Type': 'application/json',
  };

  static const workLogApi = 'https://danjuanapp.com/djapi/index_eva/dj';

  Future<List<IndexItem>> getIndexInfo({Map<String, String> headers}) async {
    if (headers != null) {
      defaultHeaders.addAll(headers);
    }
    Response response = await super.get(workLogApi, defaultHeaders);
    List<IndexItem> result = response.data['data']['items']
        .map<IndexItem>((m) => IndexItem.fromJson(m))
        .toList(); //remember to add the type after map<> to avoid the error
    return result;
  }
}
