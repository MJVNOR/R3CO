import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('R3co Log in'),
          centerTitle: true,
          //title: Text('Log in'),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(32.0, 0, 32.0, 0),
          child: Container(
            margin: EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'User',
                    //hintText: ' example Roberto Martinez',
                    icon: Icon(Icons.person),
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Telephone',
                    icon: Icon(Icons.phone),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/home');
                  },
                  child: const Text('log in'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
