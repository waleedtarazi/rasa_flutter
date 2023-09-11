import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rasa_flutter/constant/constant.dart';

class ChatBotController extends GetxController {
  TextEditingController textController = TextEditingController();
  RxList<MessageModel> messages = <MessageModel>[].obs;

  Future<void> sendMessage() async {
    final text = textController.text;
    messages.add(MessageModel(text: text, isUser: true));

    final response = await http.post(
      Uri.parse(CHATBOT),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode({"message": text, 'sender':'token'}),
    );

    if (response.statusCode == 200) {

      List<dynamic> data = jsonDecode(response.body);
      print(data);
      for (var item in data) {
        if (item.containsKey('text')) {
          messages.add(MessageModel(text: item['text'], isUser: false));
        }
      }
    } else {
      throw Exception('Failed to connect to Rasa server.');
    }

    textController.clear();
  }
}

class MessageModel {
  final String text;
  final bool isUser;

  MessageModel({required this.text, required this.isUser});
}
