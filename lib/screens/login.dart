import 'dart:js';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome \n You've been missed",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 20),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Name cannot be null";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "Enter your name",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  validator: (password) {
                    if (password!.isEmpty) {
                      return "Password cannot be null";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "Enter password",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      print("Forgot password clicked");
                    },
                    child: Text("Forgot Password"),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () {
                      print("Login button clicked");
                      if (!_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Khoi ta form validate gareko"),
                            action: SnackBarAction(
                              label: "Retry",
                              onPressed: () {
                                print("Retry button pressed");
                              },
                            ),
                          ),
                        );
                      } else if (!isChecked) {
                        showMeAlert(context);
                      } else {
                        Fluttertoast.showToast(
                            msg: "Successfully form validated",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      }
                    },
                    child: Text("LOGIN"),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Checkbox(
                        checkColor: Colors.white,
                        value: isChecked,
                        onChanged: (value) {
                          setState(() {
                            isChecked = value!;
                            print(value);
                          });
                        }),
                    Expanded(
                      child: RichText(
                          text: TextSpan(
                              text: "By continuing you agree to our",
                              children: [
                            TextSpan(
                              text: " Terms & Conditions ",
                              style: TextStyle(color: Colors.blue),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  print("tc");
                                  _launchUrl;
                                },
                            ),
                            TextSpan(text: 'and'),
                            TextSpan(
                                text: " Privacy Policy",
                                style: TextStyle(color: Colors.blue),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {}),
                          ])),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showMeAlert(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => AlertDialog(
              title: Text("Action Required"),
              content: Text(
                  "Before starting you need to agree to our Terms and Conditions"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("OK"))
              ],
            ));
  }

  Future<void> _launchUrl(String link) async {
    var url = Uri.parse("https://www.google.com");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
