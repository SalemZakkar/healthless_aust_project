import 'dart:html' as html;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Callus extends StatefulWidget{
  _Home createState() => _Home();
}
class _Home extends State<Callus> {
  ScrollController _controller;

  void initState() {
    //Initialize the  scrollController
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;// TODO: implement build
    var h;
    var v = new Container(
      width: w,
      height: he,
      alignment: Alignment.center,
      child: Container(
        width: w*0.5,
        child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            new TextField(decoration: InputDecoration(hintText:"Email" , labelText: "Email")),
            new Text(" "),
            new TextField(decoration: InputDecoration(hintText:"Massage" , labelText: "Your Massage")),
            new Text(" "),
            new RaisedButton(color: Colors.blueAccent,onPressed: (){},child: new Text("Send",style: new TextStyle(color: Colors.white),),)
          ],
        ),
      ),
    );
    var o = MediaQuery.of(context).orientation;
    return new Scaffold(
      appBar: AppBar(title: new Text("Call Us"),leading: IconButton(icon: Icon(Icons.home,color: Colors.white,),onPressed: (){Navigator.pop(context);},),backgroundColor: Colors.blueAccent,),
      body: v,
    );
  }
}
