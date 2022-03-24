import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:helthless/Home.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
Storage s = window.localStorage;
s["n"] = "F";
  runApp(new MaterialApp(home: (s["name"]==null?Home(false):Home(true)),debugShowCheckedModeBanner: false,color: Colors.blueAccent,theme: ThemeData(highlightColor: Colors.blue)));
  //  Fuck This Shit Fuck This Shit Fuck This Shit Fuck This Shit Fuck This Shit Fuck This Shit   //(s["name"]==null?Home(false):Home(true)  Fuck This Shit Fuck This Shit Fuck This Shit Fuck This Shit Fuck This Shit Fuck This Shit   //(s["name"]==null?Home(false):Home(true)  Fuck This Shit Fuck This Shit Fuck This Shit Fuck This Shit Fuck This Shit Fuck This Shit
}