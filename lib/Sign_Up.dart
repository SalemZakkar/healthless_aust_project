import 'dart:js' as js;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:helthless/Functions.dart' as Fun;
import 'Home.dart';
import 'classes.dart';
class Sign_Up extends StatefulWidget{
  _sign_Up createState() => _sign_Up();
}
class _sign_Up extends State<Sign_Up>{
  TextEditingController y = new TextEditingController();
  TextEditingController x = new TextEditingController();
  TextEditingController z = new TextEditingController();
  TextEditingController a = new TextEditingController();
  TextEditingController b = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var c = Colors.red;
    User user = new User();
    var h = new AnimatedContainer(
      width: width,
      height: height,
      alignment: Alignment.center,
        color: Colors.white,
      duration: Duration(seconds:1 ),
      curve: Curves.easeInCubic,
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          new Container(
            width: width*0.3,
            height: height,
            alignment: Alignment.center,
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                new Text("  Make  Your  Massage  \n \nConstructive\n",textAlign: TextAlign.center,style: new TextStyle(fontSize: 30,fontWeight: FontWeight.w300),),
                Icon(Icons.thumb_up,size: 50,)
              ],
            ),

            color: Colors.white,
          ),
          Expanded(
            child: new Container(
              padding: EdgeInsets.only(left: (width*0.1) , right: (width*0.1),),
              alignment: Alignment.center,
              child: new SingleChildScrollView(
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    new Text("Put Your Arguments Here",style: new TextStyle(fontSize: 22),),
                    new TextFormField(key:Key("email"),controller: y,keyboardType: TextInputType.emailAddress,decoration: InputDecoration(labelText: "Email",hintText: "Email@provider.com",),),
                    new TextFormField(controller: x,keyboardType: TextInputType.name,decoration: InputDecoration(labelText: "Name",hintText: "Sam Smith"),),
                    new TextFormField(controller: z,keyboardType: TextInputType.number,decoration: InputDecoration(labelText: "Phone Number",hintText: "009639xxxxxxxxx"),),
                    new TextFormField(key:Key("Password"),controller: a,obscureText: true,keyboardType: TextInputType.text,decoration: InputDecoration(labelText: "Password",hintText: "at least 20 chars"),),
                    new TextFormField(controller: b,obscureText: true,keyboardType: TextInputType.text,decoration: InputDecoration(labelText: "Verify Password",hintText: "at least 20 chars"),),
                    new Text("\n"),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        new Container(width: width*0.08,height: height*0.08,child: new RaisedButton(hoverColor: Colors.cyan,color: Colors.blueAccent,onPressed: (){user.setPass(a.text);user.setEmail(y.text);user.setPhone(z.text);user.setName(x.text);Fun.signUp(user,context,b.text);},child: new Text("Sign Up",style: new TextStyle(color: Colors.white),),shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30.0))),)),
                        new Container(width: width*0.08,height: height*0.08,child: new RaisedButton(hoverColor: Colors.cyan,color: Colors.blueAccent,onPressed: (){y.clear();x.clear();z.clear();a.clear();b.clear();},child: new Text("Reset",style: new TextStyle(color: Colors.white),),shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30.0))),)),
                      ],
                    )
                  ],

                ),
              ),
            ),
          )
        ],
      ),

    );
    var l =  new AnimatedContainer(
      width: width,
      height: height,
      alignment: Alignment.center,
      color: Colors.white,
      duration: Duration(seconds:1 ),
      curve: Curves.easeInOutCubic,
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Expanded(
            child: new Container(
              padding: EdgeInsets.only(left: (width*0.1) , right: (width*0.1),),
              alignment: Alignment.center,
              child: new SingleChildScrollView(
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    new Text("Put Your Arguments Here",style: new TextStyle(fontSize: 22),),
                    new TextFormField(key:Key("email"),controller: y,keyboardType: TextInputType.emailAddress,decoration: InputDecoration(labelText: "Email",hintText: "Email@provider.com",),),
                    new TextFormField(controller: x,keyboardType: TextInputType.name,decoration: InputDecoration(labelText: "Name",hintText: "Sam Smith"),),
                    new TextFormField(controller: z,keyboardType: TextInputType.number,decoration: InputDecoration(labelText: "Phone Number",hintText: "009639xxxxxxxxx"),),
                    new TextFormField(key:Key("Password"),controller: a,obscureText: true,keyboardType: TextInputType.text,decoration: InputDecoration(labelText: "Password",hintText: "at least 20 chars"),),
                    new TextFormField(controller: b,obscureText: true,keyboardType: TextInputType.text,decoration: InputDecoration(labelText: "Verify Password",hintText: "at least 20 chars"),),
                    new Text("\n"),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        new Container(width: width*0.2,height: height*0.08,child: new RaisedButton(hoverColor: Colors.cyan,color: Colors.blueAccent,onPressed: (){user.setPass(a.text);print(user.getPass());print(b.text);user.setEmail(y.text);user.setPhone(z.text);user.setName(x.text);Fun.signUp(user,context,b.text);},child: new Text("Sign Up",style: new TextStyle(color: Colors.white),),shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30.0))),)),
                        new Container(width: width*0.2,height: height*0.08,child: new RaisedButton(hoverColor: Colors.cyan,color: Colors.blueAccent,onPressed: (){y.clear();x.clear();z.clear();a.clear();b.clear();},child: new Text("Reset",style: new TextStyle(color: Colors.white),),shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30.0))),)),
                      ],
                    )
                  ],

                ),
              ),
            ),
          )
        ],
      ),

    );

    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(toolbarHeight: height*0.2,elevation: 0,backgroundColor: Colors.blueAccent,title: new Text("Sign Up",style: new TextStyle(fontSize: 32),),leading: new IconButton(icon: Icon(Icons.home,size: 30,),onPressed: (){Navigator.pop(context);},),),
      backgroundColor: Colors.white,
      body: (MediaQuery.of(context).orientation == Orientation.portrait ? l : h),
    );
  }


}