import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Hero(
                tag: 'logo',
                child: Image.asset('images/logo.jpeg'),
              ),
              TextField(),
              TextField(),
              TextField(),
              TextField(),
            ],
          ),
        ),
      ),
    );
  }
}
