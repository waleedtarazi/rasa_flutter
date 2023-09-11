import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';
import 'package:get/get.dart';
import '../../constant/colors_constant.dart';
import '../../controller/chat_bot_controller.dart';
import '../global/navigation_bar.dart';

class ChatBotScreen extends GetView<ChatBotController> {
  @override

  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('محادثة بسيطة '),
        backgroundColor: Color(0xFF3e2f87),
      ),
      body:Stack(
        children: [
        // Image background
        Image.asset(
        'assets/images/enas.jpg', // Replace with your image path
        fit: BoxFit.cover, // Adjust the image's fit property as needed
        width: double.infinity,
        height: double.infinity,
      ),

      GetBuilder<ChatBotController>(
    init: ChatBotController(),
    builder: (controller) => Column(
      children: [
        Expanded(
          child: Obx(
                () => ListView.builder(
              itemCount: controller.messages.length,
              itemBuilder: (context, index) {
                final message = controller.messages[index];

                return Container(
                  alignment: message.isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    decoration: BoxDecoration(
                      color: message.isUser ? Color(0xFF3e2f87) : Color(0xFFF3F0FF),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      message.text,
                      style:message.isUser ? TextStyle(color: Colors.white,fontSize: 18):TextStyle(color: Colors.black,fontSize: 18),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        Row(
          children: [
            SizedBox(width: 10,),
            Expanded(
              child: Container(
                constraints: BoxConstraints(
                  maxHeight: 50, // Adjust the maximum height as needed
                  maxWidth: double.infinity, // Set the maximum width to fill the available space
                ),


                child: TextField(

                  controller: controller.textController,
                  decoration: InputDecoration(

                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Color(0xFF3e2f87),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Color(0xFF6A57D5),
                        ),
                      ),
                      hintStyle: TextStyle(color: Colors.white, fontSize: 15),
                      hintText: 'اكتب ما تريد هنا'),
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.send,size: 30,color: primarycolor,),
              onPressed: () async {
                await controller.sendMessage();
              },
            ),
          ],
        ),
        SizedBox(height: 15,)
      ],
    ),
      ),
      //bottomNavigationBar: UserNavigationBar(),
    ],
      )
    );
  }
}
