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
import 'package:wonder_flutter/Screens/myposts/myposts_screen.dart';
import 'package:wonder_flutter/userProfile.dart';
import 'package:custom_info_window/custom_info_window.dart';


class MainMapScreen extends StatefulWidget {
  MainMapScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MainMapScreenState createState() => _MainMapScreenState();
}

class _MainMapScreenState extends State<MainMapScreen> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  late GoogleMapController mapController;
  final _database = FirebaseDatabase.instance.reference();
  var textEditingController = TextEditingController();
  var displayThis; // variable for displaying the users' post
  var currentUserId;
  var post; //users' post
  late String _mapStyle; // map style
  void _onMapCreated(GoogleMapController controller){ }
  Set<Marker> _markers = {};
  String _locationMessage = "";
  //setting Los Angeles LatLng as an initial position
  double latitude = 34.052235;
  double longitude =  -118.243683;


  _MainMapScreenState(){
    _getCurrentLocation();
    _activeListeners();
    FirebaseDatabase.instance.reference().child("users").onChildChanged.listen((event) {
      print("Data changed!");
      _activeListeners();
    });
    FirebaseDatabase.instance.reference().child("users").onChildRemoved.listen((event) {
      _activeListeners();
    });
    FirebaseDatabase.instance.reference().child("users").onChildAdded.listen((event) {
      _activeListeners();
    });
  }


  @override
  void initState() {
    super.initState();
    //map mode
    rootBundle.loadString('assets/map_dark_mode.txt').then((string) {
      _mapStyle = string;
    });
    //custom map marker
    //setCustomMapPin();
     getCurrentUser();
     //for loading all the markers
    _activeListeners();
  }

  //dialog box for displaying the users' post
  showAlertDialog(BuildContext context) {
    // set up the button
    Widget closeButton = TextButton(
      child: Text("Close"),
      onPressed: () => Navigator.pop(context, true),
    );
    Widget EditButton = TextButton(
      child: Text("Edit"),
      onPressed: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChatPage(title: 'Chat page')),);
      },
    );
    Widget DeleteButton = TextButton(
      child: Text("Delete"),
      onPressed: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChatPage(title: 'Chat page')),);
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("I am wondering ..."),
      content: Text(displayThis),
      actions: [
       // replyButton,
        EditButton,
        DeleteButton,
        closeButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  //getting current user
  final FirebaseAuth _auth = FirebaseAuth.instance;
  getCurrentUser() async {
    final FirebaseUser user = await _auth.currentUser();
    final uid = user.uid;
    print(uid);
    currentUserId = uid;
    }

    //loading data from firebase
  void _activeListeners() {
    final db = FirebaseDatabase.instance.reference().child("users");
    db.once().then((DataSnapshot snapshot) {
      Map<dynamic, dynamic> values = snapshot.value;
      values.forEach((key, values) async {
        print(key);
        print((values['marker'])["latitude"]);
        print((values['marker'])["longitude"]);
        post = (values['marker'])["posts"];
        setState(() {
        _markers.add(
          Marker(
              position: LatLng((values['marker'])["latitude"], (values['marker'])["longitude"]),
              markerId: MarkerId(key),
              infoWindow: InfoWindow(
                title: post.toString(),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChatPage(title: 'Chat page')),);
                 }
               ),
              ),
         ); //_markers.add
        print("------------------------");
       }
      );
     });
    });
  }

  void _getCurrentLocation() async {
    final position = await Geolocator.getCurrentPosition( desiredAccuracy: LocationAccuracy.low, forceAndroidLocationManager: true);
    latitude = position.latitude;
    longitude = position.longitude;
    setState(() {
      _locationMessage = "${position.latitude}, ${position.longitude}";
    });
  }


  @override
  Widget build( BuildContext context) {
    BorderRadiusGeometry radius = BorderRadius.only(
      topLeft: Radius.circular(100.0),
      topRight: Radius.circular(100.0),
    );
    return Material(
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          SlidingUpPanel(
            backdropEnabled: true,
            parallaxEnabled: true,
            maxHeight: 383,
            panel:
            Center (
              child:Column(
                children:<Widget> [
                  _buildTextField(),
                  Container(
                    width: 200,   //post button width
                    child:
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(100.0),
                        ),
                      ),
                      onPressed: () async {
                        //Navigator.pop(context);
                        displayThis = textEditingController.text;
                        mapController.animateCamera(
                          CameraUpdate.newCameraPosition(
                            CameraPosition(
                                target: LatLng(latitude,longitude) ,zoom: 15.0),),);
                        setState(() {
                          _markers.add(
                            Marker(
                              //create a custom marker id here
                                markerId: MarkerId(currentUserId),
                                position: LatLng(latitude,longitude),
                                //icon: pinLocationIcon,
                                onTap: () {
                                  showAlertDialog(context);
                                }
                              // infoWindow: InfoWindow(
                              //
                              //   title: displayThis,
                              // ),
                            ),
                          );
                        });
                        //saving current marker into firebase
                        FirebaseUser user = await FirebaseAuth.instance.currentUser();
                        FirebaseDatabase.instance.reference().child("users/" + user.uid + "/marker")
                            .update({
                          "latitude" : latitude,
                          "longitude" : longitude,
                          "posts" : displayThis.toString(),
                        })
                            .then((value){
                          print("Successfully created the marker ");
                        }).catchError((error) {
                          print("Failed to create the marker!");
                        });
                      },
                      child: Text(
                        "Post",
                        style: TextStyle(
                          fontSize: 16,
                          //fontFamily: 'Poppins',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            collapsed:
            Container(
              decoration: BoxDecoration(
                color: Color(0xff33BDFF),
                borderRadius: radius,
              ),
              child: Center(
                child: Text(
                  "Swip Up to Create a Post",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            minHeight: 50,
            borderRadius: radius,
            margin: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 0.0),
            body: Scaffold(
              resizeToAvoidBottomInset: false,
              body:
              GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: CameraPosition(
                    target: LatLng(latitude,longitude) ,
                    zoom: 9.0,
                    tilt:0,
                    bearing: 0),
                myLocationEnabled: true,
                myLocationButtonEnabled: false,
                mapToolbarEnabled: false,
                zoomControlsEnabled: true,
                //onMapCreated:_onMapCreated,
                onMapCreated: (GoogleMapController controller) {
                  mapController = controller;
                  mapController.setMapStyle(_mapStyle);
                },
                markers: _markers,
              ),
              floatingActionButton:Wrap(
                direction: Axis.horizontal,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //  Spacer(),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.all(
                            Radius.circular(100),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white.withOpacity(1),
                              spreadRadius: 3 ,
                              blurRadius: 0,
                              offset: Offset(0.1, 0.5),
                            ),
                          ],
                        ),
                        margin: EdgeInsets.fromLTRB(30, 0, 0, 50),
                        //alignment: Alignment(-0.75,0.87),
                        child: FloatingActionButton(
                          elevation: 30,
                          onPressed: ()  {
                            mapController.animateCamera(
                              CameraUpdate.newCameraPosition(
                                CameraPosition(
                                    target: LatLng(latitude,longitude) ,zoom: 15.0),),);
                          },
                          child: const Icon(Icons.location_on, size: 30),
                          backgroundColor: Color(0xff33BDFF),
                        ),
                      ),
                      //Spacer(),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 50),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.all(
                            Radius.circular(100),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white.withOpacity(1),
                              spreadRadius: 3,
                              blurRadius: 0,
                              offset: Offset(0.1, 0.5),
                            ),
                          ],
                        ),
                        // alignment: Alignment(0.89,0.80),
                        child: FloatingActionButton(
                          elevation: 30,
                          onPressed: ()  {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ChatPage(title: 'Chat page')),);
                          },
                          child: const Icon(Icons.chat, size: 30),
                          backgroundColor: Color(0xff33BDFF),
                        ),
                      ),
                      // Spacer(),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 50),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.all(
                            Radius.circular(100),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white.withOpacity(1),
                              spreadRadius: 3,
                              blurRadius: 0,
                              offset: Offset(0.1, 0.5),
                            ),
                          ],
                        ),
                        // alignment: Alignment(0.89,0.80),
                        child: FloatingActionButton(
                          elevation: 30,
                          onPressed: ()  {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => myPostsScreen(title: 'My posts')),);
                          },
                          child: Icon(Icons.account_circle, size:40 ),
                          backgroundColor: Color(0xff33BDFF),
                        ),
                      ),
                      //Spacer(),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField() {
    final maxLines = 5;
    return
      Container(
        margin: EdgeInsets.fromLTRB(30, 30, 30, 10),
        height: maxLines * 20.0,
        //
        // padding: EdgeInsets.only(
        //     bottom: MediaQuery.of(context).viewInsets.bottom),
        //child:SingleChildScrollView(
        child: TextField(
          controller: textEditingController,
          maxLines: maxLines,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100.0),
              borderSide: BorderSide.none,
            ),
            labelText: "Enter a message ...",
            fillColor: Color(0xffDDF4FF),
            filled: true,
          ),
        ),
      );
    }

}//end of class