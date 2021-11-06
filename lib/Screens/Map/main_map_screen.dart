import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wonder_flutter/Screens/Login/login_screen.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:wonder_flutter/Screens/Chat/chat_screen.dart';


import 'dart:async';

class MainMapScreen extends StatefulWidget {
  MainMapScreen({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  _MainMapScreenState createState() => _MainMapScreenState();
}

class _MainMapScreenState extends State<MainMapScreen> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  static final LatLng _kMapCenter =
  LatLng(34.143884, -118.253597);

  static final CameraPosition _kInitialPosition =
  CameraPosition(target: _kMapCenter, zoom: 11.0, tilt: 0, bearing: 0);

  // Set<Marker> _markers = {};
  //
  // void _onMapCreated(GoogleMapController controller){
  //   setState(() {
  //     _markers.add(
  //       Marker(
  //           markerId: MarkerId("id_1"),
  //       position: _kMapCenter,
  //       infoWindow: InfoWindow(
  //         title: "Where is xyz?"
  //       ),
  //       ),
  //     );
  //   });
  // }
  @override
  Widget build(BuildContext context) {

    BorderRadiusGeometry radius = BorderRadius.only(
      topLeft: Radius.circular(100.0),
      topRight: Radius.circular(100.0),

    );

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

                    style: ElevatedButton.styleFrom(shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(100.0),


                    ),
                    ),

                      onPressed: (){
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MainMapScreen(title: 'main map page')),);
                  },
                      child: Text(
                        "Post"
                      ),
                  )
                  ],
                )

              ),

            collapsed:
            Container(
                  decoration: BoxDecoration(

                    color: Color(0xff4CA3DD),
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
           // padding: EdgeInsets.all(20),
            borderRadius: radius,
            margin: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 0.0),

            body: Scaffold(
              body:
              GoogleMap(

                     initialCameraPosition: _kInitialPosition,
                     myLocationEnabled: true,
                     myLocationButtonEnabled: false,
                     mapToolbarEnabled: true,
                     zoomControlsEnabled: false,



                 ),

              floatingActionButton: Align(
                child: FloatingActionButton(


                  onPressed: (){
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => ChatScreen(title: 'Chat page')),);
                  },
                  child: const Icon(Icons.chat),
                  backgroundColor: Color(0xffC27BA0),

                ),
                alignment: Alignment(0.9,0.9),
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