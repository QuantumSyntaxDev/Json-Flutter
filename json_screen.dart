import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class JsonScreen extends StatefulWidget {
  const JsonScreen({super.key});

  @override
  State<JsonScreen> createState() => _JsonScreenState();
}

class _JsonScreenState extends State<JsonScreen> {
  List<dynamic> data = [];
  Future<void> loadJson() async {
    String jsonString = await rootBundle.loadString('assets/data.json');
    final jsonData = jsonDecode(jsonString);
    setState(() {
      data = jsonData;
    });
  }

  @override
  void initState() {
    super.initState();
    loadJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Данные из JSON')),
      body:
          data.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final item = data[index];
                  return ListTile(title: Text(item['name']));
                },
              ),
    );
  }
}
