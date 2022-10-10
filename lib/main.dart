import 'package:flutter/material.dart';
import 'package:product_app/core/services/service_locator.dart';
import 'package:product_app/core/utils/app_color.dart';
import 'package:product_app/presentation/screens/home_screen.dart';
import 'package:product_app/presentation/screens/login_screen.dart';
import 'package:product_app/presentation/screens/register_screen.dart';

void main() async{
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: lightCardColor,
        scaffoldBackgroundColor: lightScaffoldColor,
        backgroundColor: lightBackgroundColor,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(
            color: lightIconsColor
          ),
          backgroundColor: lightScaffoldColor,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: lightTextColor,fontSize: 22,fontWeight: FontWeight.bold
          ),


        ),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.black,
          selectionColor: Colors.blue
        ),
        cardColor: lightCardColor,
        brightness: Brightness.light,
        colorScheme: ThemeData().colorScheme.copyWith(
          secondary: lightIconsColor,
          brightness: Brightness.light
        )
      ),
      home: const HomeScreen(),
    );
  }
}


