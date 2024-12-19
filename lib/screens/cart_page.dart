import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/providers/cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, cartProv, _) => Scaffold(
        appBar: AppBar(
          title: Text("Cart (${cartProv.getTotalItems()} items)"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.80,
              child: ListView.builder(
                  itemCount: cartProv.items.length,
                  itemBuilder: (context, index) {
                    final product = cartProv.items[index];
                    return ListTile(
                      title: Text(product.name),
                      subtitle: Text(
                        "\$${product.price.toStringAsFixed(2)}",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      trailing: IconButton(
                          onPressed: () {
                            cartProv.removeFromCart(product);
                          },
                          icon: const Icon(
                            Icons.close,
                            color: Colors.red,
                          )),
                    );
                  }),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Total: \$${cartProv.getCartTotal().toStringAsFixed(2)}",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
