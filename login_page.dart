import 'package:flutter/material.dart';
import 'package:flutter_application_3/main.dart';
import 'auth_service.dart';
//import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});  // Add the key parameter

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final TextEditingController _nameController = TextEditingController();

  void _signUp() async {
    if (_nameController.text.isNotEmpty) {
      await AuthService.signUp(_nameController.text);
      
      if (mounted) {  // Check if the widget is still mounted before navigating
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const RootPage()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sign Up / Login")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: "Enter Your Name",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _signUp,
              child: const Text("Continue"),
            ),
          ],
        ),
      ),
    );
  }
}
