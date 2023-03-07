import 'package:e_commerce/screens/signup.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = new RegExp(p);
void validation() {
  final FormState? _form = _formkey.currentState;
  if (_form!.validate()) {
    print("Yes");
  } else {
    print("No");
  }
}

bool obserText = true;

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formkey,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 300,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextFormField(
                      validator: ((value) {
                        if (value == "") {
                          return "Please Fill Email";
                        } else if (!regExp.hasMatch(value!)) {
                          return "Email Is Valid";
                        }
                        return "";
                      }),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Email',
                          hintStyle: TextStyle(color: Colors.black)),
                    ),
                    TextFormField(
                      obscureText: obserText,
                      validator: (value) {
                        if (value == "") {
                          return "Plwase Input Password";
                        } else if (value!.length < 8) {
                          return "Password Is Too Short";
                        }
                        return "";
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Password',
                          suffixIcon: GestureDetector(
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              setState(() {
                                obserText = !obserText;
                              });
                            },
                            child: Icon(
                              obserText == true
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.black,
                            ),
                          ),
                          hintStyle: TextStyle(color: Colors.black)),
                    ),
                    Container(
                      height: 45,
                      width: double.infinity,
                      child: ElevatedButton(
                          child: Text('Login'),
                          onPressed: () {
                            validation();
                          }),
                    ),
                    Text("I have No Account!"),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (ctx) => SignUp(),
                          ),
                        );
                      },
                      child: Text(
                        "SignUp",
                        style: TextStyle(
                          color: Colors.cyan,
                          fontSize: 20,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
