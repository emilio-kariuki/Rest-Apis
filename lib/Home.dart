// ignore_for_file: unused_element

import 'dart:convert';

import "package:flutter/material.dart";
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void getData() {
    // ignore: unused_local_variable
    Future <String> loadDetails() async{
    return await rootBundle.loadString('assets/button.json');
  }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
