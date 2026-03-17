import 'package:flutter/material.dart';

class forecastrow extends StatelessWidget {
  final String time;
  final String value;
  final String icon;
  const forecastrow({super.key,
  required this.time,required this.value, required this.icon
  });

  @override
  Widget build(BuildContext context) {
    return Card(
                  elevation: 10,
                  color: const Color.fromARGB(255, 103, 122, 137),
                  child: Container(
                    width: 100,
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text(time, style: const TextStyle(
                          fontSize: 16,
                        ),maxLines: 1,),
                        Icon( icon=="Sunny" ?Icons.sunny:Icons.cloud,size: 32,),
                        Text(value),
                      ],
                    ),
                  ),
                );
  }
}