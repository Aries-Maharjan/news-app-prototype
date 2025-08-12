import 'package:flutter/material.dart';
import 'feat/news/view/on_boarding_screen.dart';
void main()
{
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: OnBoardingPage()
      //
    );
  }
}
