import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<String>(
        builder: (context, name, child) => Scaffold(
            appBar: AppBar(
              title: const Text("Settings"),
            ),
            body: Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Text(name),
                ],
              ),
            )));
  }
}
