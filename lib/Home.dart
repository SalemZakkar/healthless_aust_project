import 'dart:convert';
import 'dart:html';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:helthless/Post.dart';
import 'package:helthless/Settings.dart';
import 'package:helthless/call_us.dart';
import 'package:helthless/read.dart';
import 'package:web_browser/web_browser.dart';
import 'classes.dart';
import 'package:helthless/Sign_In.dart';
import 'package:helthless/Sign_Up.dart';
import 'package:http/http.dart' as http;
class Home extends StatefulWidget{
bool isSigned = false;
Home(bool x){
  isSigned  = x;
}
  _Home createState() => _Home(isSigned);
}
class _Home extends State<Home>{
  bool isSigned = false;
  _Home(bool x){
    isSigned = x;
  }
  void initState(){
    getPosts();
    super.initState();
  }
  Future<void> getPosts() async {
    var rep = await http.post("https://vaccinial-intercom.000webhostapp.com/Post.php" ,body: {"op" : "get"});
    posts = jsonDecode(rep.body);
    setState(() {
      posts.length;
    });
  }
  List posts = [];
  Post pos = new Post();
  Image im = Image.network("https://vaccinial-intercom.000webhostapp.com/1.png");
  Uint8List bytes = new Uint8List(1);
  @override
  Widget build(BuildContext context) {

    ScrollController s2 = new ScrollController();
    double height = MediaQuery.of(context).size.height;double width = MediaQuery.of(context).size.width;

    Widget Post(String Post,String who,String img) {
      var b = base64Decode(img);
      print(b);
      Image i = Image.memory(b);
      return new Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            new Text("\n"),
          Container(
          alignment: Alignment.center,
          width: width*0.5,
          height: height*0.6,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(22.0)),
              boxShadow: [BoxShadow(blurRadius: 3,spreadRadius: 4,color: Colors.grey)]
          ),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              new Container(alignment: Alignment.center,width: width*0.5,height: height*0.06,
                child:new Text(who,style: new TextStyle(color: Colors.white),),decoration: BoxDecoration(color: Colors.blueAccent,borderRadius: BorderRadius.only(topRight: Radius.circular(22.0),topLeft: Radius.circular(22.0))),),
              new Container(decoration: BoxDecoration(color: Colors.white,),width: width*0.5,height: height*0.48,child: Image(image: i.image,),),
              new Container(height: height*0.06,width: width*0.5,child: new RaisedButton(color: Colors.blueAccent,highlightColor: Colors.green,hoverColor: Colors.green,child: new Text("Read",style: new TextStyle(color: Colors.white),),onPressed:(){pos.post = Post;pos.Image = img ;pos.who = who;Navigator.push(context, MaterialPageRoute(builder: (context)=>Read(who,Post,i)));},shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(22.0),bottomRight: Radius.circular(22.0))),),),
            ],),
        ),
            
            new Text("")
          ],
        );
      
    }

    Widget Post2(String post,String who,String img){
      var b = base64Decode(img);
      Image i = Image.memory(b);
      return new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            new Text("\n"),
            Container(
              alignment: Alignment.center,
              width: width*0.9,
              height: height*0.6,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(22.0)),
                  boxShadow: [BoxShadow(blurRadius: 3,spreadRadius: 4,color: Colors.grey)]
              ),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  new Container(alignment: Alignment.center,width: width*0.9,height: height*0.06,
                    child:new Text(who,style: new TextStyle(color: Colors.white),),decoration: BoxDecoration(color: Colors.blueAccent,borderRadius: BorderRadius.only(topRight: Radius.circular(22.0),topLeft: Radius.circular(22.0))),),
                  new Container(decoration: BoxDecoration(color: Colors.white,),width: width*0.9,height: height*0.48,child: Image(image: i.image,),),Expanded(child: new Container(decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.only(bottomRight: Radius.circular(22.0),bottomLeft: Radius.circular(22.0)),),
                    child: new Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                      new Container(height: height*0.15,width: width*0.9,child: new RaisedButton(onPressed: (){pos.post = post;pos.Image = img ;pos.who = who;Navigator.push(context, MaterialPageRoute(builder: (context)=>Read(who,post,i)));},child: new Text("Read",style: new TextStyle(color: Colors.white),),highlightColor: Colors.green,hoverColor: Colors.cyan,color: Colors.blueAccent,shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(22.0),bottomRight: Radius.circular(22.0))),),),
                    ],),))
                ],),
            ),
            new Text("")
          ],
        );
    }


//    Future<void> _showMyDialog() async {
//      return showDialog<void>(
//        context: context,
//        barrierDismissible: true, // user must tap button!
//        builder: (BuildContext context) {
//          return AlertDialog(
//            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(22.0))),
//            title: Text('Post'),
//            content: new Container(alignment: Alignment.center,height: height,width: width*0.7,color: Colors.white,
//                child: new Container(
//                  height: height,
//                  width: width*0.7,
//                  alignment: Alignment.center,
//                  child: DraggableScrollbar.rrect(alwaysVisibleScrollThumb: true,backgroundColor: Colors.blueAccent, controller: s,child: ListView.builder(controller: s,itemCount: Postitems.length,itemBuilder: (context,index){return Postitems[index];}),),
//                ),
//
//
//          ),
//            actions: [
//              TextButton(
//                child: Text('Exit'),
//                onPressed: () {
//                  Navigator.of(context).pop();
//                },
//              ),
//              TextButton(
//                child: Text('Post'),
//                onPressed: () {
//                  Navigator.of(context).pop();
//                },
//              ),
//            ],
//          );
//        },
//      );
//    }
    var p = new Container(width: width,height: height,alignment: Alignment.center,child: new Column(mainAxisAlignment: MainAxisAlignment.center,children: [
      new Container(alignment: Alignment.center,color: Colors.white,width: width,height: height*0.79,
          child:(posts.length == 0?CircularProgressIndicator():DraggableScrollbar.rrect(alwaysVisibleScrollThumb: true,backgroundColor: Colors.blueAccent,child: new ListView.builder(controller: s2,itemCount: posts.length ,itemBuilder: (context,i){return Post2(posts[i]["post"], posts[i]["who"],posts[i]["image"]);},), controller:s2 )),
      ),
new Container(
  
    width: width*0.8,
  
    height: height*0.06,


//)




)],),);

    var l = new Container(width: width,height: height,alignment: Alignment.center,child: new Row(
      mainAxisAlignment: MainAxisAlignment.center,children: [
      new Container(alignment: Alignment.center,height: height,width: width*0.3,color: Colors.white,
      child: new Container(
        padding: EdgeInsets.all(22.0),
        height: height,
        width: width*0.3,
        alignment: Alignment.center,
        child:  WebBrowser(initialUrl: "https://vaccinial-intercom.000webhostapp.com/video.html",javascript: true,),
      ),
      ),
      new Container(alignment: Alignment.center,color: Colors.white,width: width*0.7,height: height,
          child: (posts.length == 0?CircularProgressIndicator():DraggableScrollbar.rrect(alwaysVisibleScrollThumb: true,backgroundColor: Colors.blueAccent,child: new ListView.builder(controller: s2,itemCount: posts.length ,itemBuilder: (context,i){return Post(posts[i]["post"], posts[i]["who"],posts[i]["image"]);},), controller:s2 )),
      )],),);
    var o = MediaQuery.of(context).orientation;
    String AccountName = "AccountName";
    List<Widget> items = [];

    if(isSigned){
      AccountName = window.localStorage["name"];
    }
    items = [new RaisedButton(child: new Text("Sign In" , style: new TextStyle(color: Colors.white),),onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => Sign_in()));},color: Colors.blueAccent,elevation: 0,),new RaisedButton(child: new Text("Sign Up" , style: new TextStyle(color: Colors.white),),onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => Sign_Up()));},color: Colors.blueAccent,elevation: 0,)];
    List<Widget> items2 = [new Container(width: width*0.2,child: new Text(AccountName,textScaleFactor: 1,textAlign: TextAlign.center,style: new TextStyle(color: Colors.white),),alignment: Alignment.center,),new RaisedButton(child: new Text("Post" , style: new TextStyle(color: Colors.white),),onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => PostUpload()));},color: Colors.blueAccent,elevation: 0,),new RaisedButton(child: new Text("Sign Out" , style: new TextStyle(color: Colors.white),),onPressed: (){window.localStorage.clear();Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => Home(false)), (route) => false);},color: Colors.blueAccent,elevation: 0,),];
    // TODO: implement build
    return new Scaffold(
    appBar: new AppBar(leading: (window.localStorage["name"] == null?Icon(Icons.home) : null),backgroundColor: Colors.blueAccent,title: new Text("Home"),toolbarHeight: height*0.15,actions: (isSigned?items2:items),),
      body: (o == Orientation.landscape ? l : p),
      drawer: Drawer(
        child: new Container(width: width*0.8,height: height,alignment: Alignment.center,child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            new Container(
              width: width,
              height: height*0.3,
              color: Colors.blueAccent,
              alignment: Alignment.center,
              child: (window.localStorage["name"]==null ? new Text(" ") : new Text(window.localStorage["name"],style: new TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w300),))),
            Expanded(
              
              child: new Container(
                width: width,
                height: height,
                alignment: Alignment.center,
                child: (window.localStorage["name"]==null?new Text("Please Login "): new Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(width: width,height: height*0.12,child: new RaisedButton(elevation: 0,color: Colors.white,highlightColor: Colors.green,child: new Text("Post SomeThing",style: new TextStyle(color: Colors.black),),onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => PostUpload()));},)),
                    new Container(height: height*0.02,),
                    Container(width: width,height: height*0.12,child: new RaisedButton(elevation: 0,color: Colors.white,highlightColor: Colors.green,child: new Text("Who Are we?",style: new TextStyle(color: Colors.black),),onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Who()));},)),
                    new Container(height: height*0.02,),
                    Container(width: width,height: height*0.12,child: new RaisedButton(elevation: 0,color: Colors.white,highlightColor: Colors.green,child: new Text("Call us",style: new TextStyle(color: Colors.black),),onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Callus()));},)),

                  ],
                )),
              ),
            )
          ],
        ),),
      ),
    );
  }

}