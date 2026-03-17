import 'package:flutter/material.dart';

class additional_info extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  const additional_info({
    super.key,required this.icon,required this.label,required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Icon(icon,size: 32,),
            const SizedBox(height: 8),
            Text(label, style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),),
            const SizedBox(height: 8),
            Text(value),
          ],
        ),
      ),
    );
  }
}