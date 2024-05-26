import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shop/models/cart_item.dart';
import 'package:shop/widgets/constants.dart';

class CartTile extends StatelessWidget {
  final CartItem item;
  final Function() onRemove;
  final Function() onAdd;
  const CartTile({super.key, required this.item, required this.onRemove, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Stack(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Container(
                          height: 85,
                          width: 85,
                          decoration: BoxDecoration(
                              color: kcontentColor,
                              borderRadius: BorderRadius.circular(20)),
                          padding: const EdgeInsets.all(10),
                          child: Image.asset(item.product.image),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.product.title,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              item.product.category,
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "\$${item.product.price}",
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Positioned(
                      top: 5,
                      right: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          IconButton(
                            icon: const Icon(
                              Ionicons.trash_outline,
                              color: Colors.red,
                              size: 20,
                            ),
                            onPressed: () {},
                          ),
                          Container(
                            height: 40,
                            decoration: BoxDecoration(
                                color: kcontentColor,
                                border: Border.all(
                                    color: Colors.grey.shade200, width: 2),
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Ionicons.remove_outline,
                                    color: Colors.black,
                                  ),
                                  iconSize: 18,
                                  onPressed: onRemove,
                                  
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  item.quantity.toString(),
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  width: 2,
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Ionicons.add_outline,
                                    color: Colors.black,
                                  ),
                                  iconSize: 18,
                                  onPressed: onAdd,
                                  
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                ],
              );
  }
}