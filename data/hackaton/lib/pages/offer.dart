import 'package:flutter/material.dart';

class Offer extends StatelessWidget {
  
  final String material;
  final String location;
  final String amount;
  final String description;
  final String price;
  
  const Offer({ Key? key,
    required this.material,
    required this.location,
    required this.amount,
    this.description = 'No description',
    this.price = 'Free',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Offer page'),
        elevation: 0,
      ),

      body: _body(),

    );
  }

  Widget _body() {

    return Center(
      child: Column(
        children: [

          _title(),
          _information(),
          _actionButtons(),

        ],
      ),
    );

  }

  Widget _title() {
    return Text(
      '${this.material} offer',
      style: TextStyle(
        fontSize: 40.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _information() {
    return Container();
  }

  Widget _actionButtons() {
    return Container();
  }


}