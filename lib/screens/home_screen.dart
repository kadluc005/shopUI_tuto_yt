import 'package:flutter/material.dart';
import 'package:shop/models/product.dart';
import 'package:shop/widgets/categories.dart';
import 'package:shop/widgets/constants.dart';
import 'package:shop/widgets/home_slider.dart';
import 'package:shop/widgets/product_cart.dart';
import 'package:shop/widgets/search_field.dart';

import '../widgets/home_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentSlide = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kscaffoldColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HomeAppBar(),
                const SizedBox(
                  height: 20,
                ),
                const SearchField(),
                const SizedBox(
                  height: 20,
                ),
                HomeSlider(
                    onchange: (value) {
                      setState(() {
                        currentSlide = value;
                      });
                    },
                    currentSlide: currentSlide),
                const SizedBox(
                  height: 20,
                ),
                const Categories(),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Special For You",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    TextButton(onPressed: () {}, child: const Text("See all"))
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20),
                    itemCount: products.length,
                    itemBuilder: ((context, index) {
                      return ProductCart(product: products[index]);
                    })),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
