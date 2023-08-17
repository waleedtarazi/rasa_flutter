import 'dart:io';

import 'package:flutter/material.dart';

import 'dart:io';
import 'package:flutter/material.dart';

class DisplayImagePage extends StatelessWidget {
  final File image;

  DisplayImagePage({required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Display Image'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: FileImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            Icon(Icons.ac_unit, size: 48), // Replace 'another_icon' with the desired icon
          ],
        ),
      ),
    );
  }
}
