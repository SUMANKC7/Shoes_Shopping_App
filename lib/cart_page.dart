import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/global_variable.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    print(Provider.of<String>(context));
    return Scaffold(
        appBar: AppBar(
          title: Text("Cart"),
          centerTitle: true,
        ),
        body: ListView.builder(
            itemCount: cart.length,
            itemBuilder: (context, index) {
              final cartitem = cart[index];

              return ListTile(
                leading: CircleAvatar(
                  radius: 35,
                  backgroundColor: Color.fromARGB(255, 242, 239, 92),
                  backgroundImage: AssetImage(cartitem['imageUrl'] as String),
                ),
                trailing: IconButton(
                    onPressed: () {},
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
