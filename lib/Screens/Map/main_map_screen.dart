import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wonder_flutter/Screens/Login/login_screen.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


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

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //
    //
    //     body: GoogleMap(
    //       initialCameraPosition: _kInitialPosition,
    //     ),
    //
    //
    // );
    BorderRadiusGeometry radius = BorderRadius.only(
      topLeft: Radius.circular(24.0),
      topRight: Radius.circular(24.0),

    );

    return Material(
        child: SlidingUpPanel(
            backdropEnabled: true,
            maxHeight: 300,
            panel:Center (

                child: _buildTextField(),
              ),

            collapsed:
            Container(
                  decoration: BoxDecoration(
                    color: Color(0xff22B4CF),
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
            borderRadius: radius,
            margin: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 0.0),
            body: Scaffold(
              body: GoogleMap(
                initialCameraPosition: _kInitialPosition,
              ),
              // appBar: AppBar(
              //     title: Text('Google Maps Demo'),
              //   ),
            )
        )
    );
  }
  Widget _buildTextField() {
    final maxLines = 5;

    return Container(

      margin: EdgeInsets.all(30),
      height: maxLines * 40.0,

      child: TextField(
        maxLines: maxLines,

        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
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