/* import 'dart:convert';
import 'package:http/http.dart' as http;
class ApiService {
  static const String apiKey = 'YOUR_OPENAI_API_KEY';
  static const String apiUrl = 'https://api.openai.com/v1/chat/completions';
static Future<List<String>> getTopics(String subject) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Authorization': 'Bearer $apiKey',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        "model": "gpt-4",
        "messages": [
          {"role": "system", "content": "Generate a list of topics for the subject: $subject"},
        ],
      }),
    );
if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      return result['choices'][0]['message']['content'].split("\n");
    } else {
      throw Exception('Failed to fetch topics');
    }
  }
static Future<String> getTheory(String topic) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Authorization': 'Bearer $apiKey',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        "model": "gpt-4",
        "messages": [
          {"role": "system", "content": "Explain the theory of $topic in detail."},
        ],
      }),
    );
if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      return result['choices'][0]['message']['content'];
    } else {
      throw Exception('Failed to fetch theory');
    }
  }
}
 */



class ApiService {
  static Future<List<String>> getTopics(String subject) async {
    // Mock topics for different subjects
    Map<String, List<String>> mockTopics = {
      "Mathematics": ["Algebra", "Calculus", "Geometry", "Statistics", "Linear Algebra"],
      "Physics": ["Quantum Mechanics", "Relativity", "Classical Mechanics", "Thermodynamics"],
      "Computer Science": ["Data Structures", "Algorithms", "Operating Systems", "Machine Learning"],
      "Biology": ["Genetics", "Cell Biology", "Human Anatomy", "Evolution"],
    };

    await Future.delayed(Duration(seconds: 1)); // Simulating network delay

    return mockTopics[subject] ?? ["Topic 1", "Topic 2", "Topic 3"];
  }

  static Future<String> getTheory(String topic) async {
    // Mock theory explanations
    Map<String, String> mockTheory = {
      "Algebra": "Algebra is the study of mathematical symbols and the rules for manipulating these symbols.",
      "Calculus": "Calculus is a branch of mathematics that studies continuous change, using derivatives and integrals.",
      "Quantum Mechanics": "Quantum mechanics is a fundamental theory in physics describing nature at small scales.",
      "Machine Learning": "Machine learning is a field of AI that focuses on building models that can learn from data.",
      "Genetics": "Genetics is the study of genes, genetic variation, and heredity in living organisms."
    };

    await Future.delayed(Duration(seconds: 1)); // Simulating network delay

    return mockTheory[topic] ?? "This is a mock explanation for the topic: $topic.";
  }
}
