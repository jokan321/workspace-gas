import 'package:flutter/material.dart';
import 'package:gas_learn/common/global.dart';
import 'package:gas_learn/pages/home/view.dart';

void main() => Global.init().then((value) => runApp(const MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}