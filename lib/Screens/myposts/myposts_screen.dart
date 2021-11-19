import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart' show rootBundle;
//import 'package:location/location.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:geolocator/geolocator.dart";
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wonder_flutter/Screens/Chat/chat_page.dart';
import 'package:wonder_flutter/Screens/Login/login_screen.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:wonder_flutter/Screens/Chat/chat_page.dart';
import 'package:flutter_awesome_alert_box/flutter_awesome_alert_box.dart';
import 'dart:async';
//import 'dart:html' ;
import 'package:http/http.dart' as http;
import 'package:wonder_flutter/userProfile.dart';

class myPostsScreen extends StatefulWidget {
  myPostsScreen({Key? key, required this.title}) : super(key: key);
  final String title;


  @override
  _myPostsScreenState createState() => _myPostsScreenState();
}

class _myPostsScreenState extends State<myPostsScreen> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);


  @override
  Widget build(BuildContext context) {
    return _myListView(context);
  }
}
  Widget _myListView(BuildContext context)  {

    final posts = ['Where to get coffee?', 'Best study place?', 'lost my pet',
      'Need a date for tonight'];

    final icons = [Icons.edit, Icons.edit, Icons.edit, Icons.edit];


    FirebaseDatabase.instance.reference().child("users/" ).once()
          .then((DataSnapshot snapshot ) {
            Map<dynamic, dynamic> values = snapshot.value;
            values.forEach((key,values) {
              print(key);
              print(values); //key is uid
              print(values["posts"]["content"]);
        });
     });


    return new Container(

        color: const Color(0xffffffff),
        child: ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {

        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          color: Color(0xffD9F0FF),
          margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
          elevation: 10,
          child: ListTile(
            leading: Icon(icons[index]),
            title: Text(posts[index]),
            //title: Text(userText1),
          ),
        );
      },
    ),
    );

}