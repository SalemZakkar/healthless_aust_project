import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:flutter/material.dart';
import 'dart:html';
class Read extends StatefulWidget{
  String who = " ";
  String post = " ";
  Image image;
  Read(String who1,String post1,Image image1){
   who = who1;
   post = post1;
   image=image1;
  }
  _Post createState() => _Post(who,post,image);
}
class _Post extends State<Read>{
  _Post(String who1,String post1,Image image1){
  img = image1;

  post = post1;
  who = who1;
  }
  static Image img;
  static String post = " ";
  static String who = " ";

  Widget getphoto(){
    if(img != null){
      Image im = Image(image: img.image,);
      return im;
    }
  }
  Storage s = window.localStorage;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    String AccountName = " ";
    ScrollController s2 = new ScrollController();
    List<Widget> items2 = [new Container(width: width*0.2,child: new Text((window.localStorage["name"]==null?" ":window.localStorage["name"]),textScaleFactor: 1,textAlign: TextAlign.center,style: new TextStyle(color: Colors.white),),alignment: Alignment.center,),];
    // TODO: implement build
    var o = MediaQuery.of(context).orientation;
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
                child: getphoto() ,
              ),  new Container(
                width: width*0.4,
                height: height*0.5,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(22.0))
                    ,boxShadow: [BoxShadow(blurRadius: 5,spreadRadius: 5,color: Colors.grey)]
                ),
                child: DraggableScrollbar.rrect(alwaysVisibleScrollThumb: true,backgroundColor: Colors.blueAccent,child: new ListView.builder(padding: EdgeInsets.all(10),controller: s2,itemCount: 1 ,itemBuilder: (context,i){return new Text(post,style: new TextStyle(color: Colors.black),);},), controller:s2 ),
              ),
            ],
          ),
          new Text("\n"),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              new Container(width: width*0.4,),
              new Container(width: width*0.4,height: height*0.1,child: new RaisedButton(highlightColor: Colors.green,onPressed: ()async{Navigator.pop(context);},child: new Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [new Text("Done" , style: new TextStyle(fontSize: 15,color: Colors.white),),new Icon(Icons.done,color: Colors.white,size: 25,),],),color:  Colors.blueAccent,hoverColor: Colors.cyan,shape: RoundedRectangleBorder(borderRadius: BorderRadius.all( Radius.circular(22.0))),),),

            ],
          )
        ],
      ),
    );
    var v = new Container(
      //padding: EdgeInsets.only(left: width*0.05,right: width*0.05),
      width: width,
      height: height,
      alignment: Alignment.center,
      child: Container(
        width: width,
        height: height,
        child: SingleChildScrollView(
          child: new Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              new Text("\n"),
                new Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  new Container(
                    width: width*0.9,
                    height: height*0.5,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(22.0))
                        ,boxShadow: [BoxShadow(blurRadius: 5,spreadRadius: 5,color: Colors.grey)]
                    ),
                    padding: EdgeInsets.all(22.0),
                    child: getphoto() ,
                  ), new  Text(" "), new Container(
                    width: width*0.9,
                    height: height*0.5,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(22.0))
                        ,boxShadow: [BoxShadow(blurRadius: 5,spreadRadius: 5,color: Colors.grey)]
                    ),
                    child: DraggableScrollbar.rrect(alwaysVisibleScrollThumb: true,backgroundColor: Colors.blueAccent,child: new ListView.builder(padding: EdgeInsets.only(right: width*0.05,left: width*0.05),controller: s2,itemCount: 1 ,itemBuilder: (context,i){return new Text(post,style: new TextStyle(color: Colors.black),);},), controller:s2 ),
                  ),
                ],
              ),
              new Text("\n"),
              new Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  new Container(width: width*0.7,),
                  new Container(width: width*0.9,height: height*0.1,child: new RaisedButton(highlightColor: Colors.green,onPressed: ()async{Navigator.pop(context);},child: new Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [new Text("Done" , style: new TextStyle(fontSize: 15,color: Colors.white),),new Icon(Icons.done,color: Colors.white,size: 25,),],),color:  Colors.blueAccent,hoverColor: Colors.cyan,shape: RoundedRectangleBorder(borderRadius: BorderRadius.all( Radius.circular(22.0))),),),

                ],
              )
            ],
          ),
        ),
      ),
    );
    return new Scaffold(
      appBar: new AppBar(leading:IconButton(icon: Icon(Icons.home),onPressed: (){Navigator.pop(context);},),backgroundColor: Colors.blueAccent,title: new Text("Post"),toolbarHeight: height*0.15,actions: items2,),
      body: (o==Orientation.landscape ? h:v),
    );
  }


}