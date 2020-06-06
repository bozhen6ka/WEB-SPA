import 'package:flutter/material.dart';
import 'package:lab4/colorPalette.dart';
import 'package:lab4/models/addNewPhotoScreen.dart';

import 'main.dart';

class PhotosScreen extends StatefulWidget {

  static String route = '/photoScreen';
  @override
  _PhotoScreenState createState() => _PhotoScreenState();
}

class _PhotoScreenState extends State<PhotosScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(children:[Text("Stanislav Svystovych Gallery"),Spacer(),IconButton(icon:Icon(Icons.exit_to_app,size: 40), onPressed: () { 
          Navigator.of(context).pushNamedAndRemoveUntil("/", (Route<dynamic> route) => false);
         },)]),
        backgroundColor: ColorPalette.primaryColor,
        
      ),
      body: GridView.count(
        padding: EdgeInsets.symmetric(horizontal:8,vertical: 5),
      primary: true,
      crossAxisCount: 3,
      crossAxisSpacing: 5,
      mainAxisSpacing: 3,
      childAspectRatio: 0.710,
      children: MyApp.photos.map((photo) => Card(color: Colors.black, child:Expanded(child: Image.network(photo,fit: BoxFit.fill,)))).toList(),
    ),floatingActionButton: FloatingActionButton(
      child: Icon(Icons.add),
      backgroundColor: ColorPalette.primaryColor,
      onPressed: () {
        Navigator.of(context).pushNamed(AddNewPhotoScreen.route);
      },
    ));
      }
}