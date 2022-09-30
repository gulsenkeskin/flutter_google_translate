import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String translated = 'Translation';
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.translate),
          title: const Text('Translation'),
        ),
        body: Card(
          margin: const EdgeInsets.all(12),
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              const Text('English (US)'),
              const SizedBox(
                height: 8,
              ),
              TextField(
                style:
                    const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                decoration: const InputDecoration(hintText: 'Enter text'),
                onChanged: (text) async {
                  
                final translation=  await text.translate(from: 'en', to: 'es');
                setState(() {
                  translated=translation.text;
                });
                },
              ),
              const Divider(
                height: 32,
              ),
              Text(
                translated,
                style: const TextStyle(
                    fontSize: 36,
                    color: Colors.lightBlueAccent,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      );
}
