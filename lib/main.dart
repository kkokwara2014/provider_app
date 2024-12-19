import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/providers/cart_provider.dart';
import 'package:provider_app/providers/detail_provider.dart';
import 'package:provider_app/providers/greeting_provider.dart';
import 'package:provider_app/providers/number_list_provider.dart';
import 'package:get/get.dart';
import 'package:provider_app/screens/product_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NumberListProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => GreetingProvider()),
        FutureProvider(
            create: (context) => getUserName(), initialData: "Loading..."),
      ],
      child: GetMaterialApp(
        title: 'Provider App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.purple,
          appBarTheme: const AppBarTheme(elevation: 0),
        ),
        home: const ProductPage(),
        // home: const FirstPage(),
      ),
    );
  }
}
