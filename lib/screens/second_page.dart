import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/providers/number_list_provider.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NumberListProvider>(
      builder: (context, numProvider, child) => Scaffold(
        appBar: AppBar(
          title: const Text("Second Page"),
        ),
        body: Column(
          children: [
            Center(child: Text(numProvider.numbers.last.toString())),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Text(numProvider.numbers.toString()),
                ],
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            numProvider.removeLast();
          },
          child: const Icon(Icons.remove),
        ),
      ),
    );
  }
}
