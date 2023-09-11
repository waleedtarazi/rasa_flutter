import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rasa_flutter/constant/constant.dart';

class ChatBotController extends GetxController {
  TextEditingController textController = TextEditingController();
  RxList<MessageModel> messages = <MessageModel>[].obs;
final _storage = const FlutterSecureStorage();
  Future<String> get token async {
    return await _storage.read(key: 'token') ?? '';
  }
  Future<void> sendMessage() async {
    final text = textController.text;
    messages.add(MessageModel(text: text, isUser: true));
    String token = await this.token;
    final response = await http.post(
      Uri.parse(CHATBOT),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode({"message": text, 'sender':token}),
    );

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
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
  Future<void> handleButton(String payload) async {
    final response = await http.post(
      Uri.parse(CHATBOT),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode({"message": payload}), // Use the button payload as the message
    );

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      // Process the response and update messages as needed
    } else {
      throw Exception('Failed to connect to Rasa server.');
    }
  }
}


class MessageModel {
  final String text;
  final bool isUser;
  final bool isButton; // Add this field
  final List<ButtonModel> buttons; // Add this field

  MessageModel({
    required this.text,
    required this.isUser,
    this.isButton = false,
    this.buttons = const [],
  });
}

class ButtonModel {
  final String title;
  final String payload;

  ButtonModel({required this.title, required this.payload});
}

