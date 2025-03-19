import 'package:flutter/material.dart';

class SubjectDetailPage extends StatelessWidget {
  final String subjectName;

  // Subject descriptions map
  static const Map<String, String> subjectDescriptions = {
    "Mathematics": "Mathematics is the study of numbers, equations, and patterns.",
    "Physics": "Physics explores the fundamental laws of nature and the universe.",
    "Chemistry": "Chemistry is the science of substances and their interactions.",
    "Biology": "Biology studies living organisms and life processes.",
    "Computer Science": "Computer Science involves programming, algorithms, and computing theory.",
  };

  const SubjectDetailPage({super.key, required this.subjectName});

  @override
  Widget build(BuildContext context) {
    String description = subjectDescriptions[subjectName] ?? "No description available.";

    return Scaffold(
      appBar: AppBar(title: Text(subjectName)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              subjectName,
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              description,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
