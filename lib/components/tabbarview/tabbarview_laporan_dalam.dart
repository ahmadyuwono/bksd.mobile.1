import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class TabbarviewLaporanDalam extends StatefulWidget {
  const TabbarviewLaporanDalam({Key? key}) : super(key: key);

  @override
  _TabbarviewLaporanDalamState createState() => _TabbarviewLaporanDalamState();
}

class _TabbarviewLaporanDalamState extends State<TabbarviewLaporanDalam> {
  @override
  Widget build(BuildContext context) {
    List<charts.Series<DataPerYear, String>> series = [
      charts.Series(
          id: "Laporan",
          data: data,
          domainFn: (DataPerYear series, _) => series.year,
          measureFn: (DataPerYear series, _) => series.data,
          colorFn: (DataPerYear series, _) => series.color),
      charts.Series(
          id: "Laporan1",
          data: data1,
          domainFn: (DataPerYear series, _) => series.year,
          measureFn: (DataPerYear series, _) => series.data,
          colorFn: (DataPerYear series, _) => series.color),
      charts.Series(
          id: "Laporan2",
          data: data2,
          domainFn: (DataPerYear series, _) => series.year,
          measureFn: (DataPerYear series, _) => series.data,
          colorFn: (DataPerYear series, _) => series.color),
    ];
    return charts.BarChart(
      series,
      animate: true,
    );
  }
}

class DataPerYear {
  final String year;
  final int data;
  final charts.Color color;
  DataPerYear({required this.year, required this.data, required this.color});
}

List<DataPerYear> data = [
  DataPerYear(
      year: "2011",
      data: 200,
      color: charts.ColorUtil.fromDartColor(Colors.green)),
  DataPerYear(
      year: "2012",
      data: 800,
      color: charts.ColorUtil.fromDartColor(Colors.green)),
  DataPerYear(
      year: "2013",
      data: 700,
      color: charts.ColorUtil.fromDartColor(Colors.green)),
  DataPerYear(
      year: "2014",
      data: 300,
      color: charts.ColorUtil.fromDartColor(Colors.green)),
  DataPerYear(
      year: "2015",
      data: 250,
      color: charts.ColorUtil.fromDartColor(Colors.green)),
];

List<DataPerYear> data1 = [
  DataPerYear(
      year: "2011",
      data: 200,
      color: charts.ColorUtil.fromDartColor(Colors.purple)),
  DataPerYear(
      year: "2012",
      data: 180,
      color: charts.ColorUtil.fromDartColor(Colors.purple)),
  DataPerYear(
      year: "2013",
      data: 150,
      color: charts.ColorUtil.fromDartColor(Colors.purple)),
  DataPerYear(
      year: "2014",
      data: 1000,
      color: charts.ColorUtil.fromDartColor(Colors.purple)),
  DataPerYear(
      year: "2015",
      data: 800,
      color: charts.ColorUtil.fromDartColor(Colors.purple)),
];

List<DataPerYear> data2 = [
  DataPerYear(
      year: "2011",
      data: 150,
      color: charts.ColorUtil.fromDartColor(Colors.blueGrey)),
  DataPerYear(
      year: "2012",
      data: 200,
      color: charts.ColorUtil.fromDartColor(Colors.blueGrey)),
  DataPerYear(
      year: "2013",
      data: 700,
      color: charts.ColorUtil.fromDartColor(Colors.blueGrey)),
  DataPerYear(
      year: "2014",
      data: 50,
      color: charts.ColorUtil.fromDartColor(Colors.blueGrey)),
  DataPerYear(
      year: "2015",
      data: 750,
      color: charts.ColorUtil.fromDartColor(Colors.blueGrey)),
];
