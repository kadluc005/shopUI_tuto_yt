import 'package:flutter/material.dart';
import 'package:shop/models/product.dart';
import 'package:shop/widgets/constants.dart';
import 'package:shop/widgets/products_widget/add_to_cart.dart';
import 'package:shop/widgets/products_widget/image_slider.dart';
import 'package:shop/widgets/products_widget/information.dart';
import 'package:shop/widgets/products_widget/product_app_bar.dart';
import 'package:shop/widgets/products_widget/product_description.dart';

class ProductScreen extends StatefulWidget {
  final Product product;
  const ProductScreen({super.key, required this.product});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int currentImage = 0;
  int currentColor = 0;
  int currentNumber = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: AddToCart(
        currentNumber: currentNumber,
        onAdd: () {
          setState(() {
            currentNumber++;
          });
        },
        onRemote: () {
          if (currentNumber != 1) {
            setState(() {
              currentNumber--;
            });
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: kcontentColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ProductAppBar(),
              ImageSlider(
                  currentImage: currentImage,
                  image: widget.product.image,
                  onChange: (index) => setState(() {
                        currentImage = index;
                      })),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    5,
                    (index) => AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          width: currentImage == index ? 15 : 8,
                          height: 8,
                          margin: const EdgeInsets.only(right: 2),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.black),
                              color: currentImage == index
                                  ? Colors.black
                                  : Colors.transparent),
                        )),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    ),
                    color: Colors.white),
                padding: const EdgeInsets.only(
                  left: 20,
                  top: 20,
                  right: 20,
                  bottom: 100,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.product.title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ProductInfo(product: widget.product),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              "Color",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: List.generate(
                                  widget.product.colors.length,
                                  (index) => GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            currentColor = index;
                                          });
                                        },
                                        child: AnimatedContainer(
                                          duration:
                                              const Duration(milliseconds: 300),
                                          width: 35,
                                          height: 35,
                                          decoration: const BoxDecoration(
                                              shape: BoxShape.circle),
                                          child: Container(
                                            width: 30,
                                            height: 30,
                                            padding: currentColor == index
                                                ? const EdgeInsets.all(2)
                                                : null,
                                            margin: const EdgeInsets.only(
                                                right: 15),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: currentColor == index
                                                  ? Colors.white
                                                  : widget
                                                      .product.colors[index],
                                              border: currentColor == index
                                                  ? Border.all(
                                                      color: widget.product
                                                          .colors[index],
                                                    )
                                                  : null,
                                            ),
                                          ),
                                        ),
                                      )),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ProductDescription(text: widget.product.description)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
