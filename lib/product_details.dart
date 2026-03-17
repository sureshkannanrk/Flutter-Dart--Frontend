import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/cart_privider.dart';

class fullView extends StatefulWidget {
  final Map<String, dynamic> product;
  const fullView({super.key, required this.product});

  @override
  State<fullView> createState() => _fullViewState();
}

class _fullViewState extends State<fullView> {
   int selectedcolor =0;

   void ontap()
   {
    if(selectedcolor!=0){
       Provider.of<cartprovider>(context,listen: false).addproduct({
    'id': widget.product['id'],
    'title': widget.product['title'],
    'price': widget.product['price'],
    'imageUrl': widget.product['imageUrl'],
    'company': widget.product['company'],
    'size': selectedcolor,
  },
  
  );
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('selecteed item was added in the cart')));  
  }
  else{
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('select shoe size!!')));
  }
  }
   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Details',
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 5),
          Center(
            child: Text(
              widget.product['title'] as String,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Image(image: AssetImage(widget.product['imageUrl'] as String),height: 250,),
          ),
          Spacer(flex: 2),
          Container(
            color: Color.fromRGBO(245, 249, 247, 1),
            height: 250,
            child: Column(
              children: [
                Text(
                  '\$${widget.product['price']} ',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: (widget.product['sizes'] as List<int>).length,
                    itemBuilder: (context, index) {
                      final int size = (widget.product['sizes'] as List<int>)[index];

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedcolor=size;
                            });
                          },
                          child: Chip(label: Text(size.toString()),
                          backgroundColor: selectedcolor==size? Colors.yellowAccent:Color.fromRGBO(245, 249, 247, 1),),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton.icon(
                    
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow,
                      fixedSize: Size(350, 50),
                    ),
                    onPressed: () {
                      ontap();
                    },
                    label: Text(
                      'Add To Cart',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    icon: Icon(Icons.shopping_bag),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      
    );
  }
}
