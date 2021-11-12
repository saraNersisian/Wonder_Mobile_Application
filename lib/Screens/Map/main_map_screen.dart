import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:location/location.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wonder_flutter/Screens/Chat/chat_page.dart';
import 'package:wonder_flutter/Screens/Login/login_screen.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:wonder_flutter/Screens/Chat/chat_page.dart';
import 'package:flutter_awesome_alert_box/flutter_awesome_alert_box.dart';
import 'dart:async';



class MainMapScreen extends StatefulWidget {
  MainMapScreen({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MainMapScreenState createState() => _MainMapScreenState();
}

class _MainMapScreenState extends State<MainMapScreen> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  late GoogleMapController mapController;


  // late String _mapStyle; // map style
  // @override
  // void initState() {
  //   super.initState();
  //
  //   rootBundle.loadString('assets/map_style_retro.txt').then((string) {
  //     _mapStyle = string;
  //   });
  // }



  LatLng currentLocation = LatLng(34.05223, -118.24368);
  Set<Marker> _markers = {};
  late BitmapDescriptor mapMarker;

  //getting users current location
 // Location location = new Location();

  // late bool _serviceEnabled ;
  // late PermissionStatus _permissionGranted;
  // late LocationData _locationData;


  //  void  _getCurrentLocation() async{
  //
  //    _serviceEnabled =  await location.serviceEnabled();
  //   if (!_serviceEnabled) {
  //     _serviceEnabled = await location.requestService();
  //     if (!_serviceEnabled) {
  //       return;
  //     }
  //   }
  //
  //   _permissionGranted = await location.hasPermission();
  //   if (_permissionGranted == PermissionStatus.denied) {
  //     _permissionGranted = await location.requestPermission();
  //     if (_permissionGranted != PermissionStatus.granted) {
  //       return;
  //     }
  //   }
  //   _locationData = await location.getLocation();
  //   //currentLocation = LatLng(_locationData.latitude!,_locationData.longitude!);
  //
  //   //print(currentLocation);
  //
  // }

  //putting a marker
  void setCustomMarker() async{
    mapMarker = await BitmapDescriptor.defaultMarker;
  }

  var textEditingController = TextEditingController();
  var displayThis;

  void _onMapCreated(GoogleMapController controller){

  }



  showAlertDialog(BuildContext context) {

    // set up the button

    Widget closeButton = TextButton(
      child: Text("Close"),
      onPressed: () => Navigator.pop(context, true),
    );
    Widget replyButton = TextButton(
      child: Text("Reply"),
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
        replyButton,
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


  // var friendList = [];
  //
  // void refreshFriendList() {
  //   // load all the friends from Firebase Database and display them in the ListView
  //   FirebaseDatabase.instance.reference().child("users").once()
  //       .then((datasnapshot ) {
  //     // print("Successfully loaded the data");
  //     // print(datasnapshot);
  //     // print("Key:");
  //     // print(datasnapshot.key);
  //     // print("Value:");
  //     // print(datasnapshot.value);
  //     // print("Iterating the value map:");
  //
  //     var friendTmpList = [];
  //       datasnapshot.value.forEach((k, v) {
  //       print("----------------------------------------");
  //       print(k);
  //       print(v);
  //
  //       friendTmpList.add(v);
  //     });
  //     print("Final Friend List: ");
  //     print(friendTmpList);
  //     friendList = friendTmpList;
  //     setState(() {
  //        FirebaseAuth.instance.currentUser().then((value) {
  //     //     print(value);
  //            var uid = value.uid;
  //     //     print("uid: " + uid);
  //            var userInfo = datasnapshot.value[uid];
  //            UserProfile.currentUser = userInfo;
  //     //     print("Current user info: " + userInfo.toString());
  //   }).catchError((error) {
  //         print("Failed to get the user info");
  //         print(error);
  //       });
  //     });
  //   }).catchError((error) {
  //     print("Failed to load the data!");
  //     print(error);
  //   });
  // }


  @override
  Widget build(BuildContext context) {

    BorderRadiusGeometry radius = BorderRadius.only(
        topLeft: Radius.circular(100.0),
        topRight: Radius.circular(100.0),
        );

    // return GestureDetector(
    //   onTap:()=>FocusScope.of(context).unfocus(),
    //   child: Material(
    return Material(

        child: Column(
           children:[
             SlidingUpPanel(
                backdropEnabled: true,
                maxHeight: 180,
                panel:Center (
                    child:Column(
                      children:<Widget> [
                        _buildTextField(),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(100.0),
                           ),
                        ),
                        onPressed: () async {
                          //Navigator.pop(context);
                          displayThis = textEditingController.text;
                          setState(() {
                            _markers.add(
                              Marker(
                                //create a custom marker id
                                  markerId: MarkerId("id_1"),
                                  position:currentLocation,
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
                              .set({
                            "lat" : 32,
                            "lon" : 32,
                          })
                              .then((value){
                            print("Successfully created the marker ");
                          }).catchError((error) {
                            print("Failed to create the marker!");

                          });
                        },
                          child: Text(
                            "Post"
                          ),
                        ),
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
                  body:
                  GoogleMap(

                         mapType: MapType.normal,
                         initialCameraPosition: CameraPosition(
                             target:currentLocation ,
                             zoom: 11.0,
                             tilt: 0,
                             bearing: 0),
                         myLocationEnabled: true,
                         myLocationButtonEnabled: true,
                         mapToolbarEnabled: true,
                         zoomControlsEnabled: true,
                         onMapCreated:_onMapCreated,
                         // onMapCreated: (GoogleMapController controller) {
                         //          mapController = controller;
                         //          mapController.setMapStyle(_mapStyle);
                         //            },
                         markers: _markers,

                     ),

                  floatingActionButton: Align(
                    child: FloatingActionButton(
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ChatPage(title: 'Chat page')),);
                      },
                      child: const Icon(Icons.chat),
                      backgroundColor: Color(0xff33BDFF),
                    ),
                    alignment: Alignment(0.89,0.87),
                      ),
                     ),
                ),
              ],
            ),


      );

  }

  Widget _buildTextField() {
    final maxLines = 5;
    return Container(

      margin: EdgeInsets.fromLTRB(30, 20, 30, 5),
      height: maxLines * 20.0,

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


}