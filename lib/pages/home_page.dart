import 'package:flutter/material.dart';
import 'package:minimal/pages/login_pages.dart';
import 'package:minimal/pages/profile_page.dart';
import 'package:minimal/pages/blog_page.dart';
import 'package:minimal/components/my_TextFields.dart';
import 'package:minimal/components/my_buttons.dart';

class HomePage extends StatefulWidget {
  final void Function()? onTap;

  HomePage({this.onTap});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void logout(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage(onTap: widget.onTap)),
    );
  }

  List<Map<String, dynamic>> blogPosts = [
    {
      "title": "Boston Dynamics",
      "content": "Boston Dynamics is a pioneering robotics company known for its innovative creations that push the boundaries of robotics technology. Established in 1992 as a spin-off from the Massachusetts Institute of Technology (MIT), Boston Dynamics has emerged as a leader in the field of advanced robotics. The company's robots are characterized by their remarkable mobility, agility, and versatility, allowing them to navigate diverse environments and perform a wide range of tasks.\nOne of Boston Dynamics' most iconic creations is the quadrupedal robot, Spot. With its four-legged design and dynamic locomotion capabilities, Spot can traverse rugged terrain, climb stairs, and navigate complex environments with ease. Spot has been deployed in various applications, including industrial inspection, construction, and public safety, showcasing its potential for enhancing efficiency and safety in diverse settings.\nAnother notable creation is Atlas, a humanoid robot designed for a variety of tasks, including search and rescue, disaster response, and manipulation of objects in unstructured environments. Atlas' advanced mobility and dexterity enable it to perform complex maneuvers and interact with its surroundings in a human-like manner, opening up new possibilities for applications in fields such as healthcare, logistics, and exploration.Boston Dynamics' robots have garnered widespread attention for their impressive capabilities and have been featured in numerous videos that showcase their agility, balance, and adaptability. The company continues to innovate and push the boundaries of robotics technology, with ongoing research and development efforts focused on advancing autonomy, perception, and interaction capabilities in robots. As robotics technology continues to evolve, Boston Dynamics remains at the forefront of shaping the future of robotics, with its creations poised to revolutionize industries and redefine the possibilities of human-robot interaction.",
      "rating": 4.0,
      "comments": ["Great post!", "Could have been more descriptive!"]
    },
    {
      "title": "Philosophical view of Aristotle",
      "content": "Aristotle, one of the towering figures of ancient philosophy, laid the foundations for much of Western thought, influencing fields ranging from metaphysics and ethics to logic and politics. His philosophical system, encompassing a wide array of subjects, offers profound insights into the nature of reality, human existence, and the pursuit of knowledge. In this philosophical exploration of Aristotle's thought, we will delve into some of his key concepts and contributions, examining their significance and enduring relevance.\n\nMetaphysics: The Study of Being and Substance\nAristotle's metaphysics, or the study of the fundamental nature of reality, revolves around the concept of being (ontology) and the nature of existence. Central to his metaphysical framework is the notion of substance, which he defines as that which exists in itself and not in another. ",
      "rating": 5.0,
      "comments": ["Excellent!", "Loved it."]
    },
    {
      "title": "The Boring Dystopia!!",
      "content": "In a mundane dystopia, life unfolds in a monotonous rhythm, devoid of color or vitality. Every day is a repetition of the last, with individuals caught in an endless cycle of routine and conformity. The world is characterized by uniformity and control, where creativity and individuality are stifled in favor of efficiency and predictability.\nIn this dystopia, technology and bureaucracy reign supreme, dictating every aspect of daily life. Citizens are constantly monitored and surveilled, their every action and interaction scrutinized by an omnipresent surveillance state. Privacy is a relic of the past, replaced by a culture of constant observation and compliance.",
      "rating": 3.5,
      "comments": ["Good post.", "It was boring dystopia"]
    },
  ];

  void addBlog(Map<String, dynamic> newBlog) {
    setState(() {
      blogPosts.add(newBlog);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            onPressed: () => logout(context),
            icon: Icon(Icons.logout),
          ),
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage(onPost: addBlog)),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: blogPosts.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(blogPosts[index]["title"]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BlogPage(blog: blogPosts[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}