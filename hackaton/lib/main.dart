import 'package:flutter/material.dart';
import 'package:hackaton/pages/accepted.dart';

import 'package:hackaton/pages/home.dart';
import 'package:hackaton/pages/add_offer.dart';
import 'package:hackaton/pages/login.dart';
import 'package:hackaton/pages/map.dart';
import 'package:hackaton/pages/my_offers.dart';
import 'package:hackaton/pages/select_location.dart';
import 'package:hackaton/pages/settings.dart';
import 'package:hackaton/pages/camera.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: 'Call For Code',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),

      routes: {
        // '/': (context) => Login(),
        '/': (context) => Home(),
        '/add': (context) => AddOfferPage(),
        '/my_offers': (context) => MyOffers(),
        '/accepted': (context) => Accepted(),
        '/map': (context) => MapScreen(),
        '/settings': (context) => Settings(),
        '/camera': (context) => CameraPage(),
        '/select_location': (context) => SelectLocation(),
      },

    );
  }
}