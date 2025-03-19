import 'package:flutter/material.dart';
import 'api_service.dart';
class TheoryPage extends StatefulWidget {
  final String topic;
  const TheoryPage({super.key, required this.topic});
@override
  TheoryPageState createState() => TheoryPageState();
}
class TheoryPageState extends State<TheoryPage> {
  late Future<String> _theory;
@override
  void initState() {
    super.initState();
    _theory = ApiService.getTheory(widget.topic);
  }
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Theory: ${widget.topic}')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder<String>(
          future: _theory,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            return SingleChildScrollView(
              child: Text(snapshot.data ?? 'No theory available'),
            );
          },
        ),
      ),
    );
  }
}
