import 'package:get/get.dart';

class HistogramController extends GetxController {
  final dataList = <SentimentData>[].obs;
}
class SentimentData {
  final double confidence;
  final String type;

  SentimentData({required this.confidence, required this.type});
}
