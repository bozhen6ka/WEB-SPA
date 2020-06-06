import 'package:flutter/material.dart';
import 'package:lab4/loginScreen.dart';
import 'package:lab4/models/addNewPhotoScreen.dart';
import 'package:lab4/photosScreen.dart';
import 'package:lab4/registerScreen.dart';

void main() {
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

   static List<String> photos = ["https://space-facts.com/wp/wp-content/uploads/mercury.gif","https://space-facts.com/wp/wp-content/uploads/venus.gif",
  "https://space-facts.com/wp/wp-content/uploads/earth.gif",
  "https://space-facts.com/wp/wp-content/uploads/mars.gif",
  "https://space-facts.com/wp/wp-content/uploads/jupiter.gif",
  "https://space-facts.com/wp/wp-content/uploads/saturn.gif",
  "https://space-facts.com/wp/wp-content/uploads/uranus.gif",
  "https://space-facts.com/wp/wp-content/uploads/neptune.gif",
  "https://space-facts.com/wp/wp-content/uploads/sun.gif"];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 4',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        primaryColor: Colors.purple,
        accentColor: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: "/",
      routes: {
        "/":(context)=>LoginScreen(),
        RegisterScreen.route:(context)=>RegisterScreen(),        
        PhotosScreen.route: (context)=>PhotosScreen(),
        AddNewPhotoScreen.route: (context)=>AddNewPhotoScreen(),
      },
    );
  }
}
