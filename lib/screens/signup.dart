import 'dart:ui';

import 'package:e_commerce/screens/Login.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

final GlobalKey<FormState> _fromkey = GlobalKey<FormState>();
String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = new RegExp(p);
bool obserText = true;

class _SignUpState extends State<SignUp> {
  void validation() {
    final FormState? _form = _fromkey.currentState;
    if (_form!.validate()) {
      print("Yes");
    } else {
      print("No");
    }
  }

  @override
  Widget build(BuildContext) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
          key: _fromkey,
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 220,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "Register",
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 400,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      TextFormField(
                        validator: (value) {
                          if (value != null && value.isEmpty) {
                            if (value == "") {
                              return "Please Fill UserName";
                            } else if (value.length < 6) {
                              return "UserName Is Too Short";
                            }
                            return "";
                          }
                        },
                        decoration: InputDecoration(
                          hintText: 'UserName',
                          hintStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == "") {
                            return "Please Fill Email";
                          } else if (!regExp.hasMatch(value!)) {
                            return "Email is Invalid";
                          }
                          return "";
                        },
                        decoration: InputDecoration(
                          hintText: 'Email',
                          hintStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      TextFormField(
                        obscureText: obserText,
                        validator: (value) {
                          if (value != null && value.isEmpty) {
                            if (value == "") {
                              return "Please Fill Password";
                            } else if (value.length < 8) {
                              return "Password Is too Short";
                            }
                            return "";
                          }
                        },
                        decoration: InputDecoration(
                          hintText: 'Password',
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                obserText = !obserText;
                              });
                              FocusScope.of(context).unfocus();
                            },
                            child: Icon(
                              obserText == true
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.black,
                            ),
                          ),
                          hintStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value != null && value.isEmpty) {
                            if (value == "") {
                              return "Please fill Phone Number";
                            } else if (value.length < 11) {
                              return "Phone Number Must Be 11";
                            }
                          }
                        },
                        decoration: InputDecoration(
                          hintText: 'Phone Number',
                          hintStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      Container(
                        height: 45,
                        width: double.infinity,
                        child: ElevatedButton(

                            // color not added

                            child: Text('Register'),
                            onPressed: () {
                              validation();
                            }),
                      ),
                      Text("I Already Have An Account!"),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: (() {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (ctx) => Login(),
                            ),
                          );
                        }),
                        child: Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.cyan,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
