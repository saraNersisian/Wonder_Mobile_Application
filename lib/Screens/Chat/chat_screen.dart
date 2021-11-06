/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wonder_flutter/Screens/Chat/chat_details.dart';
import 'package:wonder_flutter/Screens/Chat/users.dart';
import 'package:wonder_flutter/Screens/Login/login_screen.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:wonder_flutter/Screens/Map/main_map_screen.dart';
import 'package:wonder_flutter/Screens/Chat/chat_details.dart';


import 'dart:async';

class ChatScreen extends StatefulWidget {
  ChatScreen({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  // final List<String> entries = <String>['Sara', 'Daron', 'Melvina'];
  // final List<String> phone = <String>['(818)222-0981', '(818)257-0002', '(818)234-0233'];
  // final List<String> date = <String>['10/20', '10/01', '09/11'];


  
  //List<User> user = List.empty();
  var userList = [];

  _ChatScreenState() {
    refreshFriendsList();
    FirebaseDatabase.instance.reference().child("user").onChildChanged.listen((event) {
      refreshFriendsList();
    });
    FirebaseDatabase.instance.reference().child("user").onChildRemoved.listen((event) {
      refreshFriendsList();
    });
    FirebaseDatabase.instance.reference().child("user").onChildAdded.listen((event) {
      refreshFriendsList();
    });

    // User u1 = User ("Daron", "(818)222-8719","https://img.favpng.com/21/10/23/computer-icons-avatar-social-media-blog-font-awesome-png-favpng-jKXEv9rWhum7VbNKDbcELd6Di.jpg","11/02" );
    // User u2 = User ("Sara", "(818)234-8700","https://image.pngaaa.com/712/2127712-middle.png","10/14" );
    // User u3 = User ("Mel", "(818)222-8999","https://image.pngaaa.com/712/2127712-middle.png","12/12" );
    // User u4 = User ("Derenik", "(818)353-3429","https://img.favpng.com/21/10/23/computer-icons-avatar-social-media-blog-font-awesome-png-favpng-jKXEv9rWhum7VbNKDbcELd6Di.jpg","11/02" );
    // User u5 = User ("Meghri", "(818)222-2344","https://image.pngaaa.com/712/2127712-middle.png","01/03" );
    //
    // user = [u1, u2, u3, u4, u5];
  }
  
  void refreshFriendsList()
  {
    FirebaseDatabase.instance.reference().child("users").once()
        .then((datasnapshot) {
          print(datasnapshot.key);
          print(datasnapshot.value);

          var userTempList = [];

          datasnapshot.value.forEach((k, v){
            print("key:" + k);
            print("value:" + v);
            userTempList.add(v);
          });
          userList = userTempList;
          print(userList);
          setState(() {

          });

    }).catchError((error){
      print("Failed to load the data");
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Second Route"),
      // ),
      body: ListView.builder(
          itemCount: userList.length,
          itemBuilder: (BuildContext context, int index) {
            return 
              ListTile(
                onTap: ()
                {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChatDetailPage( userList[index] )),);

                  print("the item is clicked");
                },
                title: Container(
                  height: 50,

                  margin: EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 20),

                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 20),
                        child: CircleAvatar(
                            backgroundImage: NetworkImage(
                                //"${userList[index]['imageUrl']}"
                              "https://image.pngaaa.com/712/2127712-middle.png"
                            )
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                              '${userList[index]['username']}',

                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )
                          ),
                          Text(
                            '${userList[index]['phone']}',
                          ),


                        ],
                      ),
                      // Spacer(),
                      // Text(
                      //   '${userList[index]['date']}',
                      // )


                    ],
                  )
            ),
              );
          }

      ),


    );
  }
}

 */