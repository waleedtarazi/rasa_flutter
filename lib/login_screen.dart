import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  String _message = "";

  Future<void> _login() async {
    try {
      print("try");
      final response = await http.post(
          //! The (http://192.168.43.179)  is the  IpV4 address of your laptop <-->
          // ? to get the IpV4 of you device:
          // ? win+R -> cmd -> ipconfig, copy and past the ip
          // TODO: run the follwoing on the root of fastAPI_projectL->
          // * uvicorn app.main:app --host 0.0.0.0 --port 8000
        Uri.parse("https://mood-bot.onrender.com/users/login"), // Replace with your API endpoint
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "email": _usernameController.text,
          "password": _passwordController.text,
        }),
      );
      if (response.statusCode == 200) {
        print(" 200 is goood");
        // Login successful, display success message
        final responseJson = jsonDecode(response.body);
        final accessToken = responseJson["access_token"];
        setState(() {
          _message = "Login successful. Access token: $accessToken";
        });
      } else {
        print(" 400+ is bad");
        // Login failed, display error message
        final responseJson = jsonDecode(response.body);
        final errorMessage = responseJson["detail"];
        setState(() {
          _message = "Login failed: $errorMessage";
        });
      }
    } catch (e) {
      print(" catching");
      // An error occurred, display error message
      setState(() {
        _message = "An error occurred while logging in: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: "Username",
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Username is required";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Password",
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Password is required";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                    _login();
                  
                },
                child: const Text("Login"),
              ),
              const SizedBox(height: 16.0),
              Text(_message, style: const TextStyle(color: Colors.red)),
            ],
          ),
        ),
      ),
    );
  }
}