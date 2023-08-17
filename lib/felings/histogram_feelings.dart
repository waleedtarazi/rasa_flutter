import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import '../controller/histogram_controller.dart';

class HistogramScreen extends StatelessWidget {
  final HistogramController controller = Get.put(HistogramController());

  final List<Map<String, dynamic>> dummyData = [
    {"confidence": 0.87, "type": "neutral"},
    {"confidence": 0.21, "type": "negative"},
    {"confidence": 0.56, "type": "positive"},
    {"confidence": 0.92, "type": "neutral"},
    {"confidence": 0.13, "type": "negative"},
    {"confidence": 0.78, "type": "positive"},
    {"confidence": 0.63, "type": "neutral"},
    {"confidence": 0.39, "type": "negative"},
    {"confidence": 0.47, "type": "positive"},
    {"confidence": 0.72, "type": "neutral"},
    {"confidence": 0.28, "type": "negative"},
    {"confidence": 0.67, "type": "positive"},
    {"confidence": 0.52, "type": "neutral"},
    {"confidence": 0.48, "type": "negative"},
    {"confidence": 0.75, "type": "positive"},
    {"confidence": 0.6, "type": "neutral"},
    {"confidence": 0.4, "type": "negative"},
    {"confidence": 0.55, "type": "positive"},
    {"confidence": 0.7, "type": "neutral"},
    {"confidence": 0.3, "type": "negative"},
    {"confidence": 0.65, "type": "positive"},
    {"confidence": 0.5, "type": "neutral"},
    {"confidence": 0.5, "type": "negative"},
    {"confidence": 0.7, "type": "positive"},
    {"confidence": 0.6, "type": "neutral"},
    {"confidence": 0.4, "type": "negative"},
    {"confidence": 0.55, "type": "positive"},
    {"confidence": 0.6, "type": "neutral"},
    {"confidence": 0.4, "type": "negative"},
    {"confidence": 0.3, "type": "neutral"},
    {"confidence": 0.9, "type": "negative"}
  ];

  @override
  Widget build(BuildContext context) {
    controller.dataList.value = dummyData.map((item) {
      return SentimentData(
        confidence: item['confidence'],
        type: item['type'],
      );
    }).toList();

    final data = controller.dataList;

    List<charts.Series<SentimentData, String>> seriesList = [
      charts.Series<SentimentData, String>(
        id: 'SentimentData',
        domainFn: (SentimentData data, _) => data.type,
        measureFn: (SentimentData data, _) => data.confidence,
        data: data,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF3e2f87),
        title: Text('Histogram'),
      ),
      body: Center(
        child: Container(
          height: 300,
          child: charts.BarChart(

            seriesList,
            animate: true,
          ),
        ),
      ),
    );
  }
}
