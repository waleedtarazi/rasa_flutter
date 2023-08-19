import 'package:flutter/material.dart';
class UserName extends StatelessWidget {
  final TextEditingController controller;
  const UserName(this.controller, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.4,
      margin: const EdgeInsets.only(bottom: 10,left: 35,right: 20),
      child:  TextFormField(
        controller: controller,
        textAlign: TextAlign.right,
        cursorColor:  Color(0xFF6A57D5),
        keyboardType: TextInputType.name,
        //obscureText: true,
        style: const TextStyle(color: Color(0xFF6A57D5)),
        decoration:  InputDecoration(
          fillColor:  Color(0xFFF3F0FF),
          // Setting the fill color
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(
              color: Color(0xFFF3F0FF),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(
              color: Color(0xFF6A57D5),
            ),
          ),

          // label: ,
          hintText: ' الاسم',
          hintStyle:TextStyle(color: Colors.grey,fontSize: 20),

        ),
      ),
    );
  }
}




