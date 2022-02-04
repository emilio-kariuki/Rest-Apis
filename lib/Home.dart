// ignore_for_file: unused_element, avoid_print, non_constant_identifier_names, prefer_const_constructors

import 'dart:convert';

import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:rest_api/model/ReadDataModel.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<List<ReadDataModel>> ReadData() async {
    final assetBundle = DefaultAssetBundle.of(context);
    final information = await assetBundle.loadString('assets/person.json');
    final data = jsonDecode(information) as List<dynamic>;
    return data.map((e) => ReadDataModel.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: FutureBuilder(
          future: ReadData(),
          builder: (context, data) {
            if (data.hasError) {
              return Center(
                child: const Text("The data has an error"),
              );
            } else if (data.hasData) {
              var items = data.data as List<ReadDataModel>;
              return ListView.builder(itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Container(
                    height: 50,
                    width: mediaQuery.width,
                    padding: EdgeInsets.all(8),
                    child: Column(children: [
                      Text(items[index].name.toString(),style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                      SizedBox(height: 5,),
                      Text(items[index].email.toString(),style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
                    ]),
                  ),
                );
              });
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
