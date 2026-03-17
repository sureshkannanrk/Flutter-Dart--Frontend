import 'package:flutter/material.dart';

class ProductsHome extends StatelessWidget {
  final String title;
  final double price;
  final String image;
  final Color backgroundColor;
  const ProductsHome({super.key
  ,required this.title,
  required this.price,
  required this.image,
  required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.all(20),
      
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: backgroundColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,style: Theme.of(context).textTheme.titleMedium,),
          SizedBox(height: 2,),
          Text('\$$price',style: Theme.of(context).textTheme.titleMedium,),
          SizedBox(height: 5,),
          Center(
            child: Image(
              image: AssetImage(image),
              height: 150,
            ),
          ),
          SizedBox(height: 5,),

      ],));
  }
}
