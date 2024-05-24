import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shop/models/product.dart';
import 'package:shop/widgets/constants.dart';

class ProductInfo extends StatelessWidget {
  final Product product;
  const ProductInfo({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "\$${product.price}",
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Container(
              width: 50,
              height: 20,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
              decoration: BoxDecoration(
                  color: kprimaryColor,
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                children: [
                  const Icon(
                    Ionicons.star,
                    size: 13,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  Text(
                    product.rate.toString(),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            const Text(
              "(320 reviews)",
              style: TextStyle(color: Colors.grey, fontSize: 14),
            )
          ],
        ),
      ],
    );
  }
}
