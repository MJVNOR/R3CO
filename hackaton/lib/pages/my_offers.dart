import 'package:flutter/material.dart';

class MyOffers extends StatefulWidget {
  const MyOffers({ Key? key }) : super(key: key);

  @override
  _MyOffersState createState() => _MyOffersState();
}

class _MyOffersState extends State<MyOffers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text('My Offers Screen')),

      body: Center(
        child: Text('My Offers Screen', style: TextStyle(fontSize: 40)),
      ),

    );
  }
}