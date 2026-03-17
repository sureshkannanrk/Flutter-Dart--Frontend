import 'package:flutter/material.dart';
import 'package:wheather_app/wheather_main_page.dart';

void main() {
  runApp(const myapp());
}

class myapp extends StatelessWidget {
  const myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
       debugShowCheckedModeBanner: false,
      theme: ThemeData.light(
        useMaterial3: true,
      ).copyWith(appBarTheme: const AppBarTheme()),
      home: const main_page(),
    );
  }
}
