import 'package:flutter/material.dart';

class BlogPage extends StatefulWidget {
  final Map<String, dynamic> blog;

  BlogPage({required this.blog});

  @override
  _BlogPageState createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  final TextEditingController commentController = TextEditingController();
  double userRating = 0.0;

  void addComment() {
    String comment = commentController.text;
    if (comment.isNotEmpty) {
      setState(() {
        widget.blog["comments"].add(comment);
      });
      commentController.clear();
    }
  }

  void rateBlog(double rating) {
    setState(() {
      userRating = rating;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.blog["title"]),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.blog["content"],
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Text("Rating: ${userRating.toStringAsFixed(1)}"),
                SizedBox(width: 10),
                Row(
                  children: List.generate(5, (index) {
                    return IconButton(
                      icon: Icon(
                        Icons.star,
                        color: userRating >= index + 1 ? Colors.orange : Colors.grey,
                      ),
                      onPressed: () {
                        rateBlog(index + 1.0);
                      },
                    );
                  }),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              "Comments",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: widget.blog["comments"].length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(widget.blog["comments"][index]),
                  );
                },
              ),
            ),
            TextField(
              controller: commentController,
              decoration: InputDecoration(
                hintText: "Write a comment",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: addComment,
              child: Text("Post Comment"),
            ),
          ],
        ),
      ),
    );
  }
}
