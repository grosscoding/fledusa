import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fledusa/shop/model/product_model.dart' as model;
import 'package:neopop/neopop.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key, required this.product}) : super(key: key);

  final model.Products product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 140,
        child: GestureDetector(
            onTap: () {
              //Todo: Route to Product Details Screen
            },
            child: NeoPopCard(
                depth: 5,
                size: Size(1000, 150),
                borderColor: Theme.of(context).colorScheme.primary,
                hShadowColor: Color.fromARGB(255, 24, 24, 24),
                color: Theme.of(context).colorScheme.primary,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Hero(
                        tag: product.id.toString(),
                        child: Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                image: DecorationImage(
                                    image: NetworkImage(product.thumbnail),
                                    fit: BoxFit.cover))),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          product.title,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Metropolitan'),
                          maxLines: 2,
                        )),
                    const SizedBox(height: 10),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                            "${product.variants[0].prices[1].amount / 100} €",
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'NotoSerif',
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ))),
                    const SizedBox(height: 10),
                  ],
                ))));
  }
}
