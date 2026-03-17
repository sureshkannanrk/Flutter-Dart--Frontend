import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/cart_privider.dart' show cartprovider;
import './Home_page.dart';

void main()
{
  runApp(const My_App());
}
class My_App extends StatelessWidget {
  const My_App({super.key});

  @override
  Widget build(BuildContext context) {
    
    return ChangeNotifierProvider(
      create: (context) => cartprovider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shop App',
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 20,
              
            ),
          ),
          fontFamily: 'Lato',
          colorScheme: ColorScheme.fromSeed(seedColor: Color.fromRGBO(256, 206, 1, 1)),
          inputDecorationTheme: const InputDecorationTheme(
            hintStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
          ),
          prefixIconColor: Color.fromRGBO(119,119, 119, 1),
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
                        fontSize: 35,
          ),
          titleMedium: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          bodySmall: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          )
        ),
        useMaterial3: true,
        ),
        home:  Home_page(),
      ),
    );
  }
}