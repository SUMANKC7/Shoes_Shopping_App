import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>().cart;
    // final cart = Provider.of<CartProvider>(context).cart;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Cart"),
          centerTitle: true,
        ),
        body: ListView.builder(
            itemCount: cart.length,
            itemBuilder: (context, index) {
              final cartitem = cart[index];

              return ListTile(
                leading: CircleAvatar(
                  radius: 35,
                  backgroundColor: const Color.fromARGB(255, 242, 239, 92),
                  backgroundImage: AssetImage(cartitem['imageUrl'] as String),
                ),
                trailing: IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(
                                "Delete Product",
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              content: Text(
                                "Are you sure you want to remove product from cart?",
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text("No",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.green))),
                                TextButton(
                                  onPressed: () {
                                    context
                                        .read<CartProvider>()
                                        .removeProduct(cartitem);
                                    //The upper and the commented are same but in shorter form
                                    // Provider.of<CartProvider>(context,
                                    //         listen: false)
                                    //     .removeProduct(cartitem);
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text(
                                    "Yes",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red),
                                  ),
                                )
                              ],
                            );
                          });
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    )),
                title: Text(
                  cartitem["title"].toString(),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                subtitle: Text("Size : ${cartitem["sizes"]}"),
              );
            }));
  }
}
