import 'package:flutter/material.dart';
import 'package:lab4/colorPalette.dart';
import 'package:lab4/photosScreen.dart';

import '../main.dart';

class AddNewPhotoScreen extends StatefulWidget {

static String route = "addNewPhotoScreen/";
  @override
  _AddNewPhotoScreenState createState() => _AddNewPhotoScreenState();
}

class _AddNewPhotoScreenState extends State<AddNewPhotoScreen> {

  String newPhotoURL;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Photo"),
        backgroundColor: ColorPalette.primaryColor,
      ),
      body: Center(
        child:Container(padding: EdgeInsets.symmetric(horizontal:30),width: 800,height: 400,child:Column(children:[TextField(
                    onChanged: (String value) {
                      setState(() {
                        newPhotoURL = value;
                      });
                    },
                    maxLines: 1,
                    maxLength: 150,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        labelText: 'New photo URL...',
                        focusColor: Colors.black)),Container(
                    height: 45,
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    margin: EdgeInsets.symmetric(vertical: 14),
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      minWidth: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      child: Text(
                        "ADD PHOTO",
                        style: TextStyle(
                            color: ColorPalette.backgroundColor,
                            fontSize: 15,
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.w600),
                      ),
                      color: ColorPalette.primaryColor,
                      onPressed: () {
                        MyApp.photos.add(newPhotoURL);
                        Navigator.of(context).pushNamedAndRemoveUntil(PhotosScreen.route, (Route<dynamic> route) => false);
                      },
                    ))],),)));
      }
}