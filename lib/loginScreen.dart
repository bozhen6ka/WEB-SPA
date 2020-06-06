import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lab4/colorPalette.dart';
import 'package:lab4/photosScreen.dart';
import 'package:lab4/registerScreen.dart';
import 'package:lab4/validators.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("background.jpg"),
            fit: BoxFit.cover)),
          child:
      Container(
        child: Column(
//          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.all(50.0),
              child: Center(
                  child: Text(
                "Space Gallery",
                style: TextStyle(fontSize: 70.0,color: Colors.white),
              )),
            ),
            _buildLoginCard()
          ],
        ),
      ),
    ));
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
                  "Sign in",
                  style: TextStyle(fontSize: 32.0,color: ColorPalette.primaryColor),
                ),
                Container(
                  height: 30.0,
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
                  onSaved: (value) => _email = value,
                  validator: Validators.emailValidator,
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
                  onSaved: (value) => _password = value,
                ),
                Container(
                  height: 20.0,
                ),
                Container(
                  width: 150.0,
                  child: FlatButton(
                    color: ColorPalette.primaryColor,
                    child: Text(
                      "Sign in",
                      style: TextStyle(fontSize: 15.0, color: Colors.white),
                    ),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        /*_loginUser().then((value) {
                          if (value.statusCode != 200) {
                            _showDialogAboutBadAuth();
                          } else {
                            var data = json.decode(value.body);
                            MyApp.user = User()
                                .setEmail(data['email'])
                                .setRegistrationDate(
                                    DateTime.parse(data['registration_date']))
                                .setSurname(data['name'])
                                .setName(data['surname'])
                                .setId(data['id'])
                                .setBirthDate(DateTime.parse(data['birth_date']));
                            Navigator.pushNamed(context, HomePage.route);
                          }
                        });
                      }*/
                      Navigator.of(context).pushNamedAndRemoveUntil(PhotosScreen.route, (Route<dynamic> route) => false);
                    }
                    }
                  ),
                ),
                Container(
                  height: 20.0,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: TextStyle(fontSize: 15.0),
                    ),
                    FlatButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RegisterScreen.route);
                      },
                      child: Text(
                        "Sign up!",
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

/*  Future<http.Response> _loginUser() {
    return http.post(
      'http://127.0.0.1:8000/api/user/',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode({'email': _email, 'password': _password}),
    );
  }
  */

  Future<void> _showDialogAboutBadAuth() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Try again'),
          content: SingleChildScrollView(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [ Text('Wrong email or password'),
              FlatButton(
                onPressed: () {
                },
                child: Text(
                  "Forgot password?",
                  style: TextStyle(fontSize: 15.0, color: Colors.blue),
                ),
              )
            ],),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
