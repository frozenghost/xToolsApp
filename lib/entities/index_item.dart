import 'package:enum_to_string/enum_to_string.dart';
import 'package:equatable/equatable.dart';
import 'package:xtools/enums/indexEvalType.dart';
import 'package:xtools/enums/indexType.dart';

class IndexItem extends Equatable {
  final int id;
  final String indexCode;
  final String name;
  final IndexType ttype;
  final double pe;
  final double pb;
  final double pePercentile;
  final double pbPercentile;
  final double roe;
  final double yeild;
  final int ts;
  final IndexEvalType evaType;
  final int evaTypeInt;
  final String url;
  final double bondYeild;
  final int beginAt;
  final int createdAt;
  final int updatedAt;
  final double peg;
  final bool pbFlag;
  final String date;
  final double pbOverHistory;
  final double peOverHistory;

  IndexItem(
      {this.id,
      this.indexCode,
      this.name,
      this.ttype,
      this.pe,
      this.pb,
      this.pePercentile,
      this.pbPercentile,
      this.roe,
      this.yeild,
      this.ts,
      this.evaType,
      this.evaTypeInt,
      this.url,
      this.bondYeild,
      this.beginAt,
      this.createdAt,
      this.updatedAt,
      this.peg,
      this.pbFlag,
      this.date,
      this.pbOverHistory,
      this.peOverHistory});

  factory IndexItem.fromJson(Map<String, dynamic> json) {
    return IndexItem(
      id: json['id'],
      indexCode: json['index_code'],
      name: json['name'],
      ttype: IndexType.values.elementAt(int.parse(json['ttype'])),
      pe: json['pe'],
      pb: json['pb'],
      pePercentile: json['pe_percentile'],
      pbPercentile: json['pb_percentile'],
      roe: json['roe'],
      yeild: json['yeild'],
      ts: json['ts'],
      evaType: EnumToString.fromString(IndexEvalType.values, json['eva_type']),
      evaTypeInt: json['eva_type_int'],
      url: json['url'],
      bondYeild: json['bond_yeild'],
      beginAt: json['begin_at'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      peg: json['peg'],
      pbFlag: json['pb_flag'],
      date: json['date'],
      pbOverHistory: json['pb_over_history'],
      peOverHistory: json['pe_over_history'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['index_code'] = this.indexCode;
    data['name'] = this.name;
    data['ttype'] = this.ttype;
    data['pe'] = this.pe;
    data['pb'] = this.pb;
    data['pe_percentile'] = this.pePercentile;
    data['pb_percentile'] = this.pbPercentile;
    data['roe'] = this.roe;
    data['yeild'] = this.yeild;
    data['ts'] = this.ts;
    data['eva_type'] = this.evaType;
    data['eva_type_int'] = this.evaTypeInt;
    data['url'] = this.url;
    data['bond_yeild'] = this.bondYeild;
    data['begin_at'] = this.beginAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['peg'] = this.peg;
    data['pb_flag'] = this.pbFlag;
    data['date'] = this.date;
    data['pb_over_history'] = this.pbOverHistory;
    data['pe_over_history'] = this.peOverHistory;
    return data;
  }

  @override
  List<Object> get props => [
        this.id,
        this.indexCode,
        this.name,
        this.ttype,
        this.pe,
        this.pb,
        this.pePercentile,
        this.pbPercentile,
        this.roe,
        this.yeild,
        this.ts,
        this.evaType,
        this.evaTypeInt,
        this.url,
        this.bondYeild,
        this.beginAt,
        this.createdAt,
        this.updatedAt,
        this.peg,
        this.pbFlag,
        this.date,
        this.pbOverHistory,
        this.peOverHistory
      ];
}
