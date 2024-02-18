import 'dart:html';

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset('images/image2.png'),
          SizedBox(
            height: 10,
          ),
          Text('Welcome to Agashya.',
              style: TextStyle(
                fontSize: 30,
              ),
              textAlign: TextAlign.left),
          Text('Please login your account to continue'),
          SizedBox(
            height: 40,
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              primary: Colors.blue,
              onPrimary: Colors.white,
              minimumSize: Size(double.infinity, 50),
            ),
            onPressed: () {},
            icon: Icon(Icons.mail),
            label: Text('Sign Up with Email'),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              primary: Colors.black,
              onPrimary: Colors.white,
              minimumSize: Size(double.infinity, 50),
            ),
            onPressed: () {},
            icon: Icon(Icons.g_mobiledata_outlined, color: Colors.red),
            label: Text('Sign Up with Email'),
          )
        ],
      ),
    );
  }
}
