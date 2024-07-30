import 'package:flutter/material.dart';
import 'package:minimal/components/my_TextFields.dart';
import 'package:minimal/components/my_buttons.dart';

class ProfilePage extends StatefulWidget {
  final Function(Map<String, dynamic>) onPost;

  const ProfilePage({required this.onPost});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  void postBlog() {
    String title = titleController.text;
    String content = contentController.text;

    if (title.isNotEmpty && content.isNotEmpty) {
      Map<String, dynamic> newBlog = {
        "title": title,
        "content": content,
        "rating": 0.0,
        "comments": [],
      };
      widget.onPost(newBlog);
      titleController.clear();
      contentController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Write a New Blog",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                hintText: "Title",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: contentController,
              maxLines: null,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                hintText: "Content",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: postBlog,
              child: Text("Post Blog"),
            ),
          ],
        ),
      ),
    );
  }
}
