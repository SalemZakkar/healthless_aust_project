import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'classes.dart';
import 'dart:html';
import 'package:file_picker/file_picker.dart';
import 'Functions.dart' as Fun;
class PostUpload extends StatefulWidget{
  _Post createState() => _Post();
}
class _Post extends State<PostUpload>{
  Post p = new Post();
  Storage s = window.localStorage;
  Image image = Image.network("https://vaccinial-intercom.000webhostapp.com/1.png");
  Uint8List bytes;
  TextEditingController post = new TextEditingController();
  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;



    List<Widget> items2 = [new Container(width: width*0.2,child: new Text(window.localStorage["name"],textScaleFactor: 1,textAlign: TextAlign.center,style: new TextStyle(color: Colors.white),),alignment: Alignment.center,)];
    var or = MediaQuery.of(context).orientation;
    var h = new Container(
      padding: EdgeInsets.only(left: width*0.05,right: width*0.05),
      width: width,
      height: height,
      alignment: Alignment.center,
      child: new Column(

        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              new Container(
                width: width*0.4,
                height: height*0.5,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(22.0))
                    ,boxShadow: [BoxShadow(blurRadius: 5,spreadRadius: 5,color: Colors.grey)]
                ),
                padding: EdgeInsets.all(22.0),
                child: Image(image: image.image,fit: BoxFit.cover,) ,
              ),  new Container(
                width: width*0.4,
                height: height*0.5,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(22.0))
                    ,boxShadow: [BoxShadow(blurRadius: 5,spreadRadius: 5,color: Colors.grey)]
                ),
                child: new TextField(controller: post,maxLines: 250,decoration: InputDecoration(hintText: "Write Your Post Here",border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(22.0)))),),
              ),
            ],
          ),
          new Text("\n"),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              new Container(color: Colors.white,height: height*0.1,width: width*0.12,child: new RaisedButton(child: new Text("Choose Photo",style: new TextStyle(color: Colors.white),),color: Colors.blueAccent,hoverColor:Colors.cyan,onPressed: ()async{var res = await FilePicker.platform.pickFiles(type: FileType.image);Uint8List bytes = res.files.single.bytes;p.Image = base64Encode(bytes);setState((){image = Image.memory(bytes);}); },shape: RoundedRectangleBorder(borderRadius: BorderRadius.all( Radius.circular(22.0))),),),
              new Container(width: width*0.13,),
              new Container(color: Colors.white,height: height*0.1,width: width*0.12,child: new RaisedButton(child: new Text("Reset",style: new TextStyle(color: Colors.white),),color: Colors.red,hoverColor:Colors.deepOrange,onPressed: (){post.clear();setState(() {image = Image.network("https://vaccinial-intercom.000webhostapp.com/1.png");}); },shape: RoundedRectangleBorder(borderRadius: BorderRadius.all( Radius.circular(22.0))),),),
              new Container(width: width*0.07,),
              new Container(width: width*0.4,height: height*0.1,child: new RaisedButton(onPressed: ()async{p.post = post.text;p.who = window.localStorage["name"];Fun.postSet(p, "add",context);},child: new Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [new Text("Upload" , style: new TextStyle(fontSize: 15,color: Colors.white),),new Icon(Icons.file_upload,color: Colors.white,size: 25,),],),color:  Colors.blueAccent,hoverColor: Colors.cyan,shape: RoundedRectangleBorder(borderRadius: BorderRadius.all( Radius.circular(22.0))),),),

            ],
          )
        ],
      ),
    );
    var v = new Container(
      padding: EdgeInsets.only(left: width*0.05,right: width*0.05),
      width: width,
      height: height,
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: new Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            new Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                new Container(
                  width: width*0.7,
                  height: height*0.5,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(22.0))
                      ,boxShadow: [BoxShadow(blurRadius: 5,spreadRadius: 5,color: Colors.grey)]
                  ),
                  padding: EdgeInsets.all(22.0),
                  child: Image(image: image.image,fit: BoxFit.cover,) ,
                ),
                  new Container(height: height*0.02,),

                 new Container(color: Colors.white,height: height*0.1,width: width*0.7,child: new RaisedButton(child: new Text("Choose Photo",style: new TextStyle(color: Colors.white),),color: Colors.blueAccent,hoverColor:Colors.cyan,onPressed: ()async{var res = await FilePicker.platform.pickFiles(type: FileType.image);Uint8List bytes = res.files.single.bytes;p.Image = base64Encode(bytes);setState((){image = Image.memory(bytes);}); },shape: RoundedRectangleBorder(borderRadius: BorderRadius.all( Radius.circular(22.0))),),),

                new Container(height: height*0.02,),

                new Container(
                  width: width*0.7,
                  height: height*0.5,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(22.0))
                      ,boxShadow: [BoxShadow(blurRadius: 5,spreadRadius: 5,color: Colors.grey)]
                  ),
                  child: new TextField(controller: post,maxLines: 250,decoration: InputDecoration(hintText: "Write Your Post Here",border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(22.0)))),),
                ),
              ],
            ),
            new Text("\n"),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                new Container(color: Colors.white,height: height*0.1,width: width*0.3,child: new RaisedButton(child: new Text("Reset",style: new TextStyle(color: Colors.white),),color: Colors.red,hoverColor:Colors.deepOrange,onPressed: (){post.clear();setState(() {image = Image.network("https://vaccinial-intercom.000webhostapp.com/1.png");}); },shape: RoundedRectangleBorder(borderRadius: BorderRadius.all( Radius.circular(22.0))),),),
                new Container(width: width*0.05,),
                new Container(width: width*0.5,height: height*0.1,child: new RaisedButton(onPressed: ()async{p.post = post.text;p.who = window.localStorage["name"];Fun.postSet(p, "add",context);},child: new Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [new Text("Upload" , style: new TextStyle(fontSize: 15,color: Colors.white),),new Icon(Icons.file_upload,color: Colors.white,size: 25,),],),color:  Colors.blueAccent,hoverColor: Colors.cyan,shape: RoundedRectangleBorder(borderRadius: BorderRadius.all( Radius.circular(22.0))),),),

              ],
            )
          ],
        ),
      ),
    );
    // TODO: implement build
    return new Scaffold(
    appBar: new AppBar(leading:IconButton(icon: Icon(Icons.home),onPressed: (){Navigator.pop(context);},),backgroundColor: Colors.blueAccent,title: new Text("Post"),toolbarHeight: height*0.15,actions: items2,),
     body:(or==Orientation.landscape ? h:v)
    );
  }


}