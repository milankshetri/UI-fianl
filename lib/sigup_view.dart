import 'package:flutter/material.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topCenter, colors: [
        Colors.orange[900]!,
        Colors.orange[800]!,
        Colors.orange[400]!,
      ])),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 80,
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Sign Up",
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 5, vertical: 16),
                      child: Column(children: [
                        TextField(
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(),
                            border: OutlineInputBorder(),
                            hintText: 'Enter your first Name',
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(),
                            border: OutlineInputBorder(),
                            hintText: 'Enter your last Name',
                          ),
                        ),
                      ]),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
