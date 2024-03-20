import 'package:flutter/material.dart';
import 'package:shop_app/global_variable.dart';
import 'package:shop_app/product_card.dart';
import 'package:shop_app/product_detail_page.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<String> filters = const ["All", "Addidas", "Nike", "GoldStar"];
  late String selectedfilter = filters[0];
  @override
  void initState() {
    super.initState();
    selectedfilter = filters[0];
  }
  @override
  Widget build(BuildContext context) {
     const border = OutlineInputBorder(
        borderSide: BorderSide(color: Color.fromARGB(255, 214, 214, 209)),
        borderRadius: BorderRadius.horizontal(left: Radius.circular(50)));
    return SafeArea(
       
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "Shoes\nCollection",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search",
                      prefixIcon: Icon(Icons.search),
                      border: border,
                      enabledBorder: border,
                      focusedBorder: border,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filters.length,
                itemBuilder: (context, index) {
                  final filter = filters[index];
                  return Padding(
                    padding: const EdgeInsets.all(16),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedfilter = filter;
                        });
                      },
                      child: Chip(
                        backgroundColor: selectedfilter == filter
                            ? Theme.of(context).colorScheme.primary
                            : Colors.white,
                        label: Text(filter),
                        labelStyle: const TextStyle(
                          fontSize: 16,
                        ),
                        side: const BorderSide(
                          color: Color.fromARGB(26, 194, 189, 189),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return ProductDetailPage(product: product);
                          },
                        ),
                      );
                    },
                    child: ProductCard(
                      title: product["title"] as String,
                      price: product["price"] as double,
                      image: product["imageUrl"] as String,
                      backgroundColor: index.isEven
                          ? const Color.fromRGBO(216, 240, 253, 1)
                          : const Color.fromARGB(255, 247, 246, 246),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
  }
}