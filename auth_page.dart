/* import 'package:flutter/material.dart';
import 'dart:developer';
import 'auth_service.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _signUp() async {
    var user = await AuthService().signUp(
      _emailController.text,
      _passwordController.text,
    );
    if (user != null) {
      log("Sign-Up Successful: ${user.email}");
    } else {
      log("Sign-Up Failed", level: 1000);
    }
  }

  void _signIn() async {
    var user = await AuthService().signIn(
      _emailController.text,
      _passwordController.text,
    );
    if (user != null) {
      log("Sign-In Successful: ${user.email}");
    } else {
      log("Sign-In Failed", level: 1000);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Firebase Auth")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _signUp, child: const Text("Sign Up")),
            ElevatedButton(onPressed: _signIn, child: const Text("Sign In")),
          ],
        ),
      ),
    );
  }
}
 */