import 'package:flutter/material.dart';

class SelectLocation extends StatelessWidget {
  const SelectLocation({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text('Select your location')),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('map.jpg'),
          SizedBox(height: 32.0),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Done'),
            style: TextButton.styleFrom(
              primary: Colors.white,
              backgroundColor: Colors.green,
              textStyle: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
        ],
      ),

    );
  }
}