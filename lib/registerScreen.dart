import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lab4/validators.dart';
//import 'package:http/http.dart' as http;
import 'colorPalette.dart';

class RegisterScreen extends StatefulWidget {
  static const route = "/RegisterPage";

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  DateTime _birthDate = DateTime(2000);
  String _birthDateText = 'Select birth date';
//  final User _user = User();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Container(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal:700),
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical:50.0),
                child: Center(
                    child: Text(
                  "Space Gallery",
                  style:
                      TextStyle(fontSize: 70.0,color: Colors.white),
                )),
              ),
              _buildLoginCard()
            ],
          ),
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("background.jpg"),
            fit: BoxFit.cover))
      ),
    );
  }

  Widget _buildLoginCard() {
    return Container(
      width: 500.0,
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Text(
                  "Sign up",
                  style: TextStyle(fontSize: 32.0,color: ColorPalette.primaryColor),
                ),
                Container(
                  height: 30.0,
                ),
                Row(
                  children: [
                    Text(
                      "Name:",
                      style: TextStyle(fontSize: 15.0),
                    )
                  ],
                ),
                TextFormField(
                  validator: Validators.nameValidator,
                  //onSaved: (value) => _user.setName(value),
                ),
                Container(
                  height: 20.0,
                ),
                Row(
                  children: [
                    Text(
                      "Surname:",
                      style: TextStyle(fontSize: 15.0),
                    )
                  ],
                ),
                TextFormField(
                  validator: Validators.surnameValidator,
                  //onSaved: (value) => _user.setSurname(value),
                ),
                Container(
                  height: 20.0,
                ),
                Row(
                  children: [
                    Text(
                      "Email:",
                      style: TextStyle(fontSize: 15.0),
                    )
                  ],
                ),
                TextFormField(
                  validator: Validators.emailValidator,
                  //onSaved: (value) => _user.setEmail(value),
                ),
                Container(
                  height: 20.0,
                ),
                Row(children: [
                  Text(
                    "Password:",
                    style: TextStyle(fontSize: 15.0),
                  )
                ]),
                TextFormField(
                  obscureText: true,
                  validator: Validators.passwordValidator,
                  //onSaved: (value) => _user.setPassword(value),
                ),
                Container(
                  height: 20.0,
                ),
                Row(
                  children: [
                    Text(
                      "Password again:",
                      style: TextStyle(fontSize: 15.0),
                    )
                  ],
                ),
                TextFormField(
                  obscureText: true,
                ),
                Container(
                  height: 20.0,
                ),
                Row(
                  children: [
                    Text(
                      "Birth date:",
                      style: TextStyle(fontSize: 15.0),
                    )
                  ],
                ),
                Row(
                  children: [
                    FlatButton(
                      child: Text(
                        _birthDateText,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        _selectDate(context);
                      },
                    )
                  ],
                ),
                Container(
                  height: 20.0,
                ),
                Container(
                  width: 150.0,
                  child: FlatButton(
                    color: ColorPalette.primaryColor,
                    child: Text(
                  "Sign up",
                  style: TextStyle(fontSize: 15.0,color: Colors.white),
                    ),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        //print(_user
                        //    .setRegistrationDate(DateTime.now())
                        //    .setBirthDate(_birthDate)
                        //    .toMap());
                        //createUser().then((value) => Navigator.pushNamed(context, LoginPage.route));
                        Navigator.pushNamed(context, '/');
                      }
                    },
                  ),
                ),
                Container(
                  height: 20.0,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: TextStyle(fontSize: 15.0),
                    ),
                    FlatButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/");
                      },
                      child: Text(
                        "Sign in!",
                        style: TextStyle(fontSize: 15.0, color: ColorPalette.primary2Color),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  /*Future<http.Response> createUser() {
    return http.post(
      'http://127.0.0.1:8000/api/users/',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: _user.toJson(),
    );
  }*/

  void _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _birthDate,
        firstDate: DateTime(1930, 8),
        lastDate: DateTime.now());
    if (picked != null && picked != _birthDate)
      setState(() {
        _birthDate = picked;
        _birthDateText = DateFormat('yyyy-MM-dd').format(picked);
      });
  }
}
