import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/model/product_model.dart';
import 'package:provider_app/providers/cart_provider.dart';
import 'package:provider_app/providers/greeting_provider.dart';
import 'package:provider_app/screens/cart_page.dart';
import 'package:provider_app/screens/settings_page.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final prodProvider = Provider.of<CartProvider>(context);
    final greetProvider = Provider.of<GreetingProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => const SettingsPage());
              },
              icon: const Icon(Icons.settings)),
          IconButton(
              onPressed: () {
                Get.to(() => const CartPage());
              },
              icon: const Icon(Icons.shopping_cart))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(greetProvider.displayGreeting()),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return ListTile(
                      title: Text(product.name),
                      subtitle: Text(
                        "\$${product.price.toStringAsFixed(2)}",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      trailing: Checkbox(
                          value: prodProvider.items.contains(product),
                          onChanged: (val) {
                            if (val == true) {
                              prodProvider.addToCart(product);
                            } else {
                              prodProvider.removeFromCart(product);
                            }
                          }),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
