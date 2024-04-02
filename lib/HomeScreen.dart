import 'package:flutter/material.dart';
import 'package:shoe_eccomerce_app/models/ProductModel.dart';
import 'package:shoe_eccomerce_app/models/ProductModelSInk.dart';
import 'package:shoe_eccomerce_app/widgets/TitleWidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ProductsModel> item = [];

  @override
  void initState() {
    item = List.from(products);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const Icon(Icons.menu),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Icon(Icons.shopping_bag_outlined),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Icon(Icons.search),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildSection("New Collection", item),
            _buildSection("Featured Products", item),
            _buildSection("Best Sellers", item),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<ProductsModel> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleWidget(text: title),
        const SizedBox(height: 10),
        SizedBox(
          height: 400, // Adjusted SizedBox height between sections
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            itemBuilder: (_, int index) {
              return Padding(
                padding: EdgeInsets.only(left: index == 0 ? 0 : 30),
                child: _buildProductItem(items[index]),
              );
            },
          ),
        ),
        const SizedBox(height: 5), // Adjusted smaller SizedBox height between sections
      ],
    );
  }



  Widget _buildProductItem(ProductsModel product) {
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
        Text(product.category, style: const TextStyle(fontFamily: "Montserrat", fontWeight: FontWeight.w200, fontSize: 13)),
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
}
