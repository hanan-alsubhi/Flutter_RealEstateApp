import 'package:flutter/material.dart';
import 'package:home_project/CartPage.dart';
import 'package:home_project/Home.dart';
import 'package:home_project/ListFilter.dart';
import 'package:home_project/Product.dart';
import 'package:home_project/Signin.dart';
import 'package:home_project/cart_model.dart';
import 'package:home_project/signup.dart';
import 'package:home_project/welcome.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Cart(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "DAR",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      initialRoute: '/',
      routes: {
         "/":(context)=>const Welcome(),
        "/Home":(context)=>const Home(),
        "/ListFilter": (context) => const ListFilter(),
        "/Product":(context)=>const Product(),
         "/cart_page": (context) => const CartPage(),  
        "/sginin":(context)=>const Signin(),
        "/signup":(context)=>const Signup(),




         



      },
    );
  }
}
