import 'package:car_blog/all_blogs.dart';
import 'package:car_blog/cars_page.dart';
import 'package:car_blog/home_page.dart';
import 'package:car_blog/widgets/app_routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: AppRoutes.homePage,
      routes: {
        AppRoutes.homePage: (context) => HomePage(),
        AppRoutes.blogPage: (context) => AllBlogs(),
        AppRoutes.carsPage: (context) => CarsPage(),
      },
    );
  }
}
