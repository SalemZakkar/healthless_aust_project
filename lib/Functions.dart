@JS()
library javascript_bundler;
import 'dart:convert';
import 'dart:typed_data';
import 'dart:html';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:helthless/Home.dart';
import 'package:js/js.dart';
import 'classes.dart';
import 'package:http/http.dart' as http;
Uint8List bytes;
Future<void> signUp(User u , BuildContext context,String x) async {
  if(x==u.getPass()){
  try{
    var rep = await http.post("http://vaccinial-intercom.000webhostapp.com/AddAccount.php",body: {"Access-Control-Allow-Origin": "*","operation" : "add","email" : u.getEmail(),"password" : u.getPass(),"phone" : u.getPhone(),"name" : u.getName() });

    Navigator.push(context, MaterialPageRoute(builder: (context) => Home(true)));
    if(rep!=null){
      Storage s = window.localStorage;
      s["email"] = u.getEmail();
      s["password"] = u.getPass();
      s["name"] = u.getName();
      s["id"] = u.getID();
    }

  }catch(e){
    showConfirm("No network Connection");
  }
  }
  else{
    showConfirm("Password is Not Same");
  }

}
Future<void> signIn(User u , BuildContext context) async{
try{
  var rep = await http.post("https://vaccinial-intercom.000webhostapp.com/AddAccount.php" , body: {"operation" : "get" , "email" : u.getEmail()});
  List<dynamic> l = json.decode(rep.body);
  if(l[0]["email"] == u.getEmail()&&l[0]["password"]== u.getPass()){
    Storage s = window.localStorage;
    s["email"] = l[0]["email"];
    s["pass"] = l[0]["password"];
    s["name"] = l[0]["name"];
    s["id"] = l[0]["id"];
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home(true)));
  }
  else{
    showConfirm("Error Email or password");
  }

}catch(e){
  print(e.toString());
  showConfirm("Error Email or Password");
}

}
Future<void> postSet(Post p  , String op,BuildContext context) async{
 if(op=="add"){
   try{
     var rep = await http.post("https://vaccinial-intercom.000webhostapp.com/Post.php" , body: {"op" : "add" , "who" : p.getWho(),"image" : p.getImage(),"post" : p.getPost()});
     print(rep.body);

     Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home(true)));

   }catch(e){
     print(e.toString());
     showConfirm("Failed To add Post");
   }
 }
 else{
   try{
     var rep = await http.post("https://vaccinial-intercom.000webhostapp.com/Post.php" , body: {"op" : "del" , "id" : p.getID()});
     print(rep);

   }catch(e){
     showConfirm("Failed To delete Post");
   }
 }

}
@JS('alert')
external String showConfirm(String obj);
void showConfirmButton() {
  showConfirm("Hello, this is a confirm");
}