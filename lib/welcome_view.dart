import 'package:flutter/material.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text("Welcome",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30)),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Book your flight instantly",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/loginRoute');
                        },
                        child: const Text("Login")),
                    ElevatedButton(
                        onPressed: () {}, child: const Text("Sign Up")),
                  ],
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
