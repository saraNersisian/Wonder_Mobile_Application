
import 'package:location/location.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:geolocator/geolocator.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wonder_flutter/Screens/Chat/chat_page.dart';
import 'package:wonder_flutter/Screens/Login/login_screen.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:wonder_flutter/Screens/Chat/chat_screen.dart';
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

  LatLng currentLocation = LatLng(34.05223, -118.24368);
  Set<Marker> _markers = {};
  late BitmapDescriptor mapMarker;

  //getting users current location
  Location location = new Location();

  late bool _serviceEnabled ;
  late PermissionStatus _permissionGranted;
  late LocationData _locationData;


   void  _getCurrentLocation() async{

     _serviceEnabled =  await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    _locationData = await location.getLocation();
    //currentLocation = LatLng(_locationData.latitude!,_locationData.longitude!);

    //print(currentLocation);

  }

  //putting a marker
  void setCustomMarker() async{
    mapMarker = await BitmapDescriptor.defaultMarker;
  }

  var textEditingController = TextEditingController();
  var displayThis;

  void _onMapCreated(GoogleMapController controller){
    setState(() {
      _markers.add(
        Marker(
            markerId: MarkerId("id_1"),
        //position: LatLng(_locationData.latitude!,_locationData.longitude!),
            position: currentLocation,
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

  @override
  Widget build(BuildContext context) {
    _getCurrentLocation();

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
                        onPressed: () {
                          //Navigator.pop(context);
                          displayThis = textEditingController.text;
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
                             //target: LatLng(_locationData.latitude!,_locationData.longitude!),
                             target:currentLocation ,
                             zoom: 11.0,
                             tilt: 0,
                             bearing: 0),
                         myLocationEnabled: true,
                         myLocationButtonEnabled: true,
                         mapToolbarEnabled: true,
                         zoomControlsEnabled: false,
                         onMapCreated:_onMapCreated,
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