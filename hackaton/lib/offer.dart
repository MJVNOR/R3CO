import 'package:flutter/material.dart';

class Offer{
  
  final String material;
  final String location;
  final String amount;
  final String description;
  final String price;
  final String user;
  
  const Offer({ Key? key,
    required this.material,
    required this.location,
    required this.amount,
    required this.user,
    this.description = 'No description',
    this.price = 'Free',
  });

  

}