import 'package:flutter/material.dart';
import 'package:grocery_app/screens/onboard_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: OnboardScreen(),
                ),
                Text('Ready to order from your nearest shop?'),
                SizedBox(
                  height: 20,
                ),
                FlatButton(
                  color: Colors.deepOrangeAccent,
                  child: Text('Set Delivery Location'),
                  onPressed: () {},
                ),
                SizedBox(
                  height: 20,
                ),
                FlatButton(
                  child: RichText(
                    text: TextSpan(
                      text: 'Already a Customer ?',
                      style: TextStyle(color: Colors.blue),
                      children: [
                        TextSpan(
                            text: 'Login',
                            style: TextStyle(fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              right: 0,
              top: 10,
              child: FlatButton(
                child: Text('SKIP', style: TextStyle(color: Colors.deepOrangeAccent, fontWeight: FontWeight.bold),),
                onPressed: (){},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
