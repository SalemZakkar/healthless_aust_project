import 'dart:html';

class User{
String name;
String phone;
String email;
String password;
String id;
User(){
  name = " ";
  phone = " ";
  email = " ";
  password = " ";
  id = " ";
}
void setName(String x){
  name = x;
}
void setPhone(String x){
  phone = x;
}
void setEmail(String x){
  email = x;
}
void setPass(String x){
  password = x;
}
void setId(String x){
  id = x;
}
String getEmail() => email;
String getPhone() => phone;
String getName() => name;
String getPass() => password;
String getID() => id;
}
class Post{
  String Image;
  String id;
  String who;
  String title;
  String post;

  Post(){
   Image = " ";id = " ";who = " ";title = " ";post = " ";
  }
  void setAll(String i,String who,String post){
    Image = i;this.id = id;this.who = who;this.title = title;this.post = post;
  }
  getImage() =>Image;
  getID() =>id;
  getWho() =>who;
  getTitle() =>title;
  getPost() =>post;

}