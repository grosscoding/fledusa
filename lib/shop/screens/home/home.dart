import 'package:flutter/material.dart';
import 'package:fledusa/shop/screens/home/components/products.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Kevins Testladen'),
      ),
      body: AllProducts(),
    );
  }
}
