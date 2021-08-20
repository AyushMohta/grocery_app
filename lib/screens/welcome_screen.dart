import 'package:flutter/material.dart';
import 'package:grocery_app/constants.dart';
import 'package:grocery_app/providers/auth_provider.dart';
import 'package:grocery_app/screens/onboard_screen.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthP rovider>(context);

    bool _validPhoneNumber = false;
    var _phoneNumberController = TextEditingController();

    void showBottomSheet(context) {
      showModalBottomSheet(
        context: context,
        builder: (context) => StatefulBuilder(
          builder: (context, StateSetter myState) {
            return Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Text(
                        "Login",
                        style: TextStyle(fontSize: 25),
                      ),
                      Text("Enter your phone Number to process",
                          style: TextStyle(fontSize: 12)),
                      SizedBox(
                        height: 30,
                      ),
                      TextField(
                        decoration: InputDecoration(
                            prefixText: "+91",
                            labelText: "10 digit mobile number"),
                        autofocus: true,
                        keyboardType: TextInputType.phone,
                        maxLength: 10,
                        onChanged: (value) {
                          if (value.length == 10) {
                            myState(() {
                              _validPhoneNumber = true;
                            });
                          } else {
                            myState(() {
                              _validPhoneNumber = false;
                            });
                          }
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      AbsorbPointer(
                        absorbing: _validPhoneNumber ? false : true,
                        child: FlatButton(
                          onPressed: () {
                            String number = '+91${_phoneNumberController.text}';
                            auth.verifyphone(context, number);
                          },
                          child: Text(_validPhoneNumber
                              ? 'CONTINUE'
                              : 'Enter Mobile Number'),
                          color:
                              _validPhoneNumber ? primaryButton : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      );
    }

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
                  onPressed: () {
                    showBottomSheet(context);
                  },
                ),
              ],
            ),
            Positioned(
              right: 0,
              top: 10,
              child: FlatButton(
                child: Text(
                  'SKIP',
                  style: TextStyle(
                      color: Colors.deepOrangeAccent,
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
