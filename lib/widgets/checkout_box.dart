import 'package:flutter/material.dart';
import 'package:shop/models/cart_item.dart';
import 'package:shop/widgets/constants.dart';

class CheckoutBox extends StatelessWidget {
  final List<CartItem> items;
  const CheckoutBox({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(30), topLeft: Radius.circular(30)),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                filled: true,
                fillColor: kcontentColor,
                hintText: "Enter discount code",
                hintStyle: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
                suffixIcon: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Apply",
                    style: TextStyle(
                        color: kprimaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 20),
                  ),
                )),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Subtotal",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              Text(
                "\$${items.length > 1 ? items.map<double>((e) => e.quantity * e.product.price).reduce((value1, value2) => value1 + value2) : items[0].product.price * items[0].quantity}",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Total",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "\$${items.length > 1 ? items.map<double>((e) => e.quantity * e.product.price).reduce((value1, value2) => value1 + value2) : items[0].product.price * items[0].quantity}",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
