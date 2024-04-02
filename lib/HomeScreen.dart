import 'package:flutter/material.dart';
import 'package:shoe_eccomerce_app/constants/constants.dart';
import 'package:shoe_eccomerce_app/models/ProductModel.dart';
import 'package:shoe_eccomerce_app/models/ProductModelSInk.dart';
import 'package:shoe_eccomerce_app/widgets/NewCollectionSection.dart';

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
        padding: const EdgeInsets.all(14.0),
        child: ListView(
          children: [
            NewCollectionSection(newCollection, item),
          ],
        ),
      ),
    );
  }
}
