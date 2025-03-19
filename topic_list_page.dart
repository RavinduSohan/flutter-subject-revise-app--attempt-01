import 'package:flutter/material.dart';
import 'api_service.dart';
import 'theory_page.dart';
class TopicListPage extends StatefulWidget {
  final String subject;
  const TopicListPage({super.key, required this.subject});
@override
  TopicListPageState createState() => TopicListPageState();
}
class TopicListPageState extends State<TopicListPage> {
  late Future<List<String>> _topics;
@override
  void initState() {
    super.initState();
    _topics = ApiService.getTopics(widget.subject);
  }
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Topics for ${widget.subject}')),
      body: FutureBuilder<List<String>>(
        future: _topics,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No topics found'));
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(snapshot.data![index]),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TheoryPage(topic: snapshot.data![index]),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
