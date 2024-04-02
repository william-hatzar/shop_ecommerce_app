import 'package:flutter/material.dart';
import 'package:shoe_eccomerce_app/models/ProductModel.dart';
import 'package:shoe_eccomerce_app/widgets/BuildProductItem.dart';
import 'package:shoe_eccomerce_app/widgets/TitleWidget.dart';

Widget NewCollectionSection(String title, List<ProductsModel> items) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      TitleWidget(text: title),
      const SizedBox(height: 10),
      SizedBox(
        height: 360, // Adjusted SizedBox height between sections
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: items.length,
          itemBuilder: (_, int index) {
            return Padding(
              padding: EdgeInsets.only(left: index == 0 ? 0 : 30),
              child: buildProductItem(items[index]),
            );
          },
        ),
      ),
      const SizedBox(height: 5), // Adjusted smaller SizedBox height between sections
    ],
  );
}