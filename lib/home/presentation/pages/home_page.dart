import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Text(
          "Home",
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w400,
              fontFamily: 'Roboto',
              color: Colors.black
          ),
        ),
      ),
    );
  }
}
