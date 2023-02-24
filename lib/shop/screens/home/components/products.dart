import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fledusa/shop/controller/productController.dart';
import 'package:fledusa/shop/screens/home/components/product_card.dart';

class AllProducts extends StatelessWidget {
  AllProducts({Key? key}) : super(key: key);

  final productController = Get.put(AllProductsController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(children: [
      Text("Alle Produkte",
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor)),
      const SizedBox(height: (20)),
      Obx(
        () => SizedBox(
            width: double.infinity,
            child: productController.isLoading.value
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: productController.getAllProducts.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          childAspectRatio: 0.6,
                        ),
                        itemBuilder: (BuildContext context, int index) =>
                            ProductCard(
                              product: productController.getAllProducts[index],
                            )),
                  )),
      ),
    ]));
  }
}
