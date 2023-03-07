import 'package:e_commerce/screens/Login.dart';
import 'package:e_commerce/widgets/mybutton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/changescreen.dart';
import '../widgets/mytextformField.dart';
import '../widgets/passwordtextformField.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

final GlobalKey<FormState> _fromkey = GlobalKey<FormState>();
final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = new RegExp(p);
bool obserText = true;
String? email;
String? password;

class _SignUpState extends State<SignUp> {
  void validation() async {
    final FormState? _form = _fromkey.currentState;
    if (_form!.validate()) {
      try {
        UserCredential result = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email!, password: password!);
        print(result.user!.uid);
      } on PlatformException catch (e) {
        print(e.message.toString());
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.message ?? ''),
          ),
        );
      }
    } else {
      print("No");
    }
  }
  Widget _buildAllTextFormField() {
    return Container(
      height: 320,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          MyTextFormField(
            validator: (value) {
              if (value != null && value.isEmpty) {
                if (value == "") {
                  return "Please Fill UserName";
                } else if (value.length < 6) {
                  return "UserName Is Too Short";
                }
                return "";
              }
              return null;
            },
            name: 'UserName',
            onChanged: (value) {},
          ),
          MyTextFormField(
            name: "Email",
            onChanged: (value) {
              setState(() {
                email = value;
                print(email);
              });
            },
            validator: (value) {
              if (value == "") {
                return "Please Fill Email";
              } else if (!regExp.hasMatch(value!)) {
                return "Email Is Valid";
              }
              return null;
            },
          ),
          PasswordTextFormField(
            obserText: obserText,
            name: "Password",
            onChanged: (value) {
              setState(() {
                password = value;
                print(password);
              });
            },
            validator: (value) {
              if (value == "") {
                return "Please Input Password";
              } else if (value!.length < 8) {
                return "Password Is Too Short";
              }
              return null;
            },
            onTap: () {
              FocusScope.of(context).unfocus();
              setState(() {
                obserText = !obserText;
              });
            },
          ),
          MyTextFormField(
            validator: (value) {
              if (value != null && value.isEmpty) {
                if (value == "") {
                  return "Please fill Phone Number";
                } else if (value.length < 11) {
                  return "Phone Number Must Be 11";
                }
              }
              return null;
            },
            name: 'Phone Number',
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }

  Widget _buildButtomPart() {
    return Container(
      height: 400,
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildAllTextFormField(),
          MyButton(
            name: "SignUp",
            onPressed: () {
              validation();
            },
          ),
          ChangeScreen(
            name: "Login",
            whichAccount: "I Already Have An Account",
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) => Login(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext) {
    key:
    _scaffoldkey;
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
                _buildButtomPart()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
