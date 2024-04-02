import "package:flutter/material.dart";
import "package:shoe_eccomerce_app/models/ProductModel.dart";

Widget buildProductItem(ProductsModel product) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: SizedBox(
            height: 240,
            width: 180,
            child: AspectRatio(
              aspectRatio: 3 / 4,
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
      const SizedBox(height: 20),
      Text(
        product.productName,
        style: const TextStyle(fontFamily: "Lora", fontSize: 14, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 5),
      Text(product.colour, style: const TextStyle(fontFamily: "Montserrat", fontWeight: FontWeight.w200, fontSize: 13)),
      const SizedBox(height: 5),
      Text(product.price, style: const TextStyle(fontFamily: "Lora", fontWeight: FontWeight.w600, fontSize: 17)),
      const Row(
        children: [
          Icon(Icons.star, color: Colors.orange, size: 20),
          Icon(Icons.star, color: Colors.orange, size: 20),
          Icon(Icons.star, color: Colors.orange, size: 20),
          Icon(Icons.star_border, color: Colors.orange, size: 20),
          Icon(Icons.star_border, color: Colors.orange, size: 20),
        ],
      )
    ],
  );
}