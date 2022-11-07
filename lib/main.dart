import 'package:flutter/material.dart';
import 'package:faker/faker.dart';
import 'package:flutter_lorem/flutter_lorem.dart';

void main() {
  runApp(FakeChat());
}

// ignore: use_key_in_widget_constructors
class FakeChat extends StatelessWidget {
  final String title = "Fake WhatsApp";
  final String subtitle = "By my self";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 18, 27, 34),
        appBar: AppBar(
          toolbarHeight: 70,
          backgroundColor: const Color.fromARGB(255, 31, 44, 52),
          centerTitle: true,
          title: Column(
            children: <Text>[
              Text(
                title,
                style:
                    const TextStyle(color: Color.fromARGB(255, 142, 156, 165)),
              ),
              Text(subtitle,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 142, 156, 165),
                    fontSize: 13.5,
                  )),
            ],
          ),
        ),
        body: ListView.builder(
            itemCount: 30,
            itemBuilder: (context, index) {
              return ChatItem(
                imagepos: "https://picsum.photos/id/${index + 11}/300/300",
                subtitle: lorem(paragraphs: 1, words: index + 1),
                trailing: "00.02",
              );
            }),
      ),
    );
  }
}

class ChatItem extends StatelessWidget {
  final String imagepos;
  final String subtitle;
  final String trailing;

  // ignore: use_key_in_widget_constructors
  const ChatItem({
    required this.imagepos,
    required this.subtitle,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imagepos),
        radius: 23,
      ),
      title: Text(
        faker.person.name(),
        style: const TextStyle(
            fontWeight: FontWeight.w500,
            color: Color.fromARGB(255, 236, 243, 249)),
      ),
      subtitle: Text(
        subtitle,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          color: Color.fromARGB(255, 154, 164, 173),
        ),
      ),
      trailing: Text(
        trailing,
        style: const TextStyle(
          color: Color.fromARGB(255, 154, 164, 173),
        ),
      ),
    );
  }
}
