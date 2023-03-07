import 'package:e_commerce/screens/signup.dart';
import 'package:e_commerce/widgets/mytextformField.dart';
import 'package:e_commerce/widgets/passwordtextformField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/changescreen.dart';
import '../widgets/mybutton.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = new RegExp(p);
String? email;
String? password;
final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
void validation() async {
  final FormState? _form = _formkey.currentState;
  if (_form!.validate()) {
    try {
      UserCredential result = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email!, password: password!);
      print(result.user!.uid);
    } on PlatformException catch (e) {
      // _scaffoldkey.currentState!.showSnackBar(
      //   SnackBar(
      //     content: Text(e.message ?? ''),
      //   ),
      // );
    }
  } else {
    print("No");
  }
}

void submitForm() {}

bool obserText = true;

class _LoginState extends State<Login> {
  Widget _buildAllPart() {
    return Container(
      height: 300,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          const Text(
            'Login',
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
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
              return "";
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
              return "";
            },
            onTap: () {
              FocusScope.of(context).unfocus();
              setState(() {
                obserText = !obserText;
              });
            },
          ),
          MyButton(
            onPressed: () {
              validation();
            },
            name: "Login",
          ),
          ChangeScreen(
            name: "SignUp",
            whichAccount: "I Have No Account",
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) => SignUp(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      body: Form(
        key: _formkey,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildAllPart(),
            ],
          ),
        ),
      ),
    );
  }
}
