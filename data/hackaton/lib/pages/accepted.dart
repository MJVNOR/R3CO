import 'package:flutter/material.dart';

class Accepted extends StatefulWidget {
  const Accepted({ Key? key }) : super(key: key);

  @override
  _AcceptedState createState() => _AcceptedState();
}

class _AcceptedState extends State<Accepted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text('Accepted Screen')),

      body: Center(
        child: Text('Accepted Screen', style: TextStyle(fontSize: 40)),
      ),

    );
  }
}