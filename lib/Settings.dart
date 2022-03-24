import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Who extends StatefulWidget{
  _Settings createState() => _Settings();
}
class _Settings extends State<Who>{
  void initState() {
    //Initialize the  scrollController
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScrollController s2 = new ScrollController();
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    var o = MediaQuery.of(context).orientation;
    var ve =  new Container(
      width: w,
      height: h,
      alignment: Alignment.center,
      child: new Container(
        padding: EdgeInsets.all(22.0),
        width: w*0.8,
        height: h*0.7,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(22.0)),
            boxShadow: [BoxShadow(spreadRadius: 5,color: Colors.grey,blurRadius: 5)]
        ),
        child: DraggableScrollbar.rrect(alwaysVisibleScrollThumb: true,backgroundColor: Colors.blueAccent,child: new ListView.builder(padding: EdgeInsets.only(right: w*0.02,left: w*0.02),controller: s2,itemCount: 1 ,itemBuilder: (context,i){return new  Text("idea: basheer ouda bashi && coded:by SalemZakkar\nthis is an homework for web_devloping subject in Aust\nuploaded  in 7-1-2021\nthe idea is about an Hygienically handicapped site to share the ideas\nabout the cases\nMake your message constructive :-) ",textDirection: TextDirection.ltr,style: new TextStyle(color: Colors.black,fontSize: 22),);},), controller:s2 ),
      ),
    );
    var ho =  new Container(
      width: w,
      height: h,
      alignment: Alignment.center,
      child: new Container(
        padding: EdgeInsets.all(22.0),
        width: w*0.5,
        height: h*0.7,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(22.0)),
            boxShadow: [BoxShadow(spreadRadius: 5,color: Colors.grey,blurRadius: 5)]
        ),
        child: DraggableScrollbar.rrect(alwaysVisibleScrollThumb: true,backgroundColor: Colors.blueAccent,child: new ListView.builder(padding: EdgeInsets.only(right: w*0.02,left: w*0.02),controller: s2,itemCount: 1 ,itemBuilder: (context,i){return new  Text("idea: basheer ouda bashi && coded:by SalemZakkar\nthis is an homework for web_devloping subject in Aust\nuploaded  in 7-1-2021\nthe idea is about an Hygienically handicapped site to share the ideas\nabout the cases\nMake your message constructive :-) ",textDirection: TextDirection.ltr,style: new TextStyle(color: Colors.black,fontSize: 22),);},), controller:s2 ),
      ),
    );
  return new Scaffold(

  appBar: new AppBar(leading: IconButton(icon: Icon(Icons.home),onPressed: (){Navigator.pop(context);},),backgroundColor: Colors.blueAccent,title: new Text("Who Are We?"),),
    body:(o==Orientation.landscape?ho:ve),
  );

  }

}