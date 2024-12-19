import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/providers/number_list_provider.dart';
import 'package:provider_app/screens/second_page.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NumberListProvider>(
      builder: (context, numProvider, child) => Scaffold(
        appBar: AppBar(
          title: const Text("First Page"),
          actions: [
            IconButton(
                onPressed: () {
                  Get.to(() => const SecondPage());
                },
                icon: const Icon(Icons.arrow_circle_right_outlined))
          ],
        ),
        body: Column(
          children: [
            Text(numProvider.numbers.last.toString()),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  Text(
                    numProvider.numbers.toString(),
                  ),
                ],
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton.small(
          onPressed: () {
            numProvider.add();
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
