import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:translator/translator.dart';
import 'package:http/http.dart' as http;

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
              const Text('Türkçe İngilizce Sözlük'),
              const SizedBox(
                height: 8,
              ),
              TextField(
                style:
                    const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                decoration: const InputDecoration(hintText: 'Enter text'),
                onChanged: (text) async {

                /*  const apiKey = '';
                  const to = 'tr';
                  final url = Uri.parse('');

                  final response = await http.post(url);
                  if (response.statusCode == 200) {
                    final body = json.decode(response.body);
                    final translation = HtmlUnescape()
                        .convert(translations.first['translatedText']);
                    await text.translate(from: 'en', to: 'tr');
                    setState(() {
                      translated = translation.text;
                    });
                  }*/

                final translation=  await text.translate(from: 'tr', to: 'en');

                  setState(() {
                    translated = translation.text;
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
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      );
}
