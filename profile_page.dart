import 'package:flutter/material.dart';

const int itemCount = 20;

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
      ),
      body: ListView.builder(
        itemCount: itemCount,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text('Topic ${(index + 1)}'),
            leading: const Icon(Icons.bookmark_add_rounded),
            trailing: const Icon(Icons.select_all),
            onTap: () {
              debugPrint('Topic ${(index + 1)} selected');
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint('Floating Action Button Pressed');
        },
        child: const Icon(Icons.book),
      ),
    );
  }
}
