import 'package:flutter/material.dart';
import 'topic_list_page.dart';
import 'subject_detail_page.dart';
import 'auth_service.dart'; 

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  String? userName;
  final TextEditingController _subjectController = TextEditingController();

  
  final List<Map<String, String>> subjects = [
    {"name": "Mathematics", "image": "assets/astronomy.jpg"},
    {"name": "Physics", "image": "assets/machine_learning.jpg"},
    {"name": "Chemistry", "image": "assets/quantum_mechanics.jpg"},
    {"name": "Biology", "image": "assets/astronomy.jpg"},
    {"name": "Computer Science", "image": "assets/astronomy.jpg"},
  ];

  @override
  void initState() {
    super.initState();
    _loadUser();
  }

  
  void _loadUser() async {
    String? name = await AuthService.getUserName();
    if (mounted) {
      setState(() {
        userName = name ?? "User";
      });
    }
  }

  
  void _searchTopics() {
    if (_subjectController.text.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TopicListPage(subject: _subjectController.text),
        ),
      );
    }
  }

 
  void _logout() async {
    await AuthService.logout();
    if (mounted) {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hi, $userName 👋"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: _logout,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            TextField(
              controller: _subjectController,
              decoration: const InputDecoration(
                labelText: 'Enter Subject',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            
            Center(
              child: ElevatedButton(
                onPressed: _searchTopics,
                child: const Text('Generate Topics'),
              ),
            ),

            const SizedBox(height: 20),

            
            const Text(
              "Explore Subjects",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            
            SizedBox(
              height: 200, 
              child: ListView.builder(
                scrollDirection: Axis.horizontal, 
                itemCount: subjects.length,
                itemBuilder: (context, index) {
                  final subject = subjects[index];
                  return SubjectCard(
                    subjectName: subject["name"]!,
                    imagePath: subject["image"]!,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SubjectDetailPage(subjectName: subject["name"]!),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class SubjectCard extends StatelessWidget {
  final String subjectName;
  final String imagePath;
  final VoidCallback onTap;

  const SubjectCard({
    required this.subjectName,
    required this.imagePath,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                child: Image.asset(imagePath, width: 150, height: 120, fit: BoxFit.cover),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  subjectName,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
