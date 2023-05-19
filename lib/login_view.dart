import 'package:flutter/material.dart';

class loginView extends StatefulWidget {
  const loginView({super.key});

  @override
  State<loginView> createState() => _loginViewState();
}

class _loginViewState extends State<loginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 80,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Login",
                  style: TextStyle(color: Colors.black, fontSize: 40),
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 16),
                      child: Column(children: [
                        const TextField(
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(),
                            border: OutlineInputBorder(),
                            hintText: 'Enter your username',
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const TextField(
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(),
                            border: OutlineInputBorder(),
                            hintText: 'Enter your username',
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () {}, child: const Text("Login")),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/signupRoute');
                            },
                            child: const Text("Sign Up")),
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
