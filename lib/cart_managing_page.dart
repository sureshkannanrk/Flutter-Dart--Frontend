import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/cart_privider.dart';

class cartpage extends StatelessWidget {
  const cartpage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<cartprovider>(context).cart;
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart', style: Theme.of(context).textTheme.titleMedium),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          final single = cart[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(single['imageUrl'] as String),
              radius: 30,
              backgroundColor: Colors.yellow,
            ),

            title: Text(
              'product: ${single['title']}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            subtitle: Text('Price:${single['price']}'),
            trailing: IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Delete Product'),
                      content: Text(
                        'are you sure want to delete the item in available in the cart',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'No',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Provider.of<cartprovider>(
                              context,
                              listen: false,
                            ).removeproduct(single);
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'Yes',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              icon: Icon(Icons.delete, color: Colors.red),
            ),
          );
        },
      ),
    );
  }
}
