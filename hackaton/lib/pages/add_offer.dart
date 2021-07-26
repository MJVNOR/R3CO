import 'package:flutter/material.dart';

class AddOfferPage extends StatefulWidget {
  const AddOfferPage({ Key? key }) : super(key: key);

  @override
  _AddOfferPageState createState() => _AddOfferPageState();
}

class _AddOfferPageState extends State<AddOfferPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Add New Offer'),
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),

      body: _body(),

    );
  }

  Widget _body() {
    return Column(
      children: [
        _categorySelector(),
        _informationForm(),
        _submitButton(),
      ],
    );
  }

  Widget _categorySelector() {
    return Placeholder(fallbackHeight: 120,);
  }

  Widget _informationForm() {
    return Expanded(child: Placeholder());
  }

  Widget _submitButton() {
    return Placeholder(fallbackHeight: 50,);
  }

}