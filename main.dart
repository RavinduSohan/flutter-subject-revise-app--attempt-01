
import 'package:flutter/material.dart';
import 'auth_service.dart';
import 'home_page.dart';
import 'login_page.dart';
import 'profile_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String? userName = await AuthService.getUserName(); 
  runApp(MyApp(isLoggedIn: userName != null));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Persistent Login",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/login': (context) => LoginPage(),
      },
      home: isLoggedIn ? const RootPage() : LoginPage(),
    );
  }
}

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _currentIndex = 0; 
  final List<Widget> _pages = const [
    HomePage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex], 
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint('Floating Action Button Pressed');
        },
        child: const Icon(Icons.book),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
      
    );
  }
}
