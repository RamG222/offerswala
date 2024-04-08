import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:offerswala/screens/signup.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    var mQSize = MediaQuery.of(context).size;
    var mQHeight = mQSize.height;
    var mQWidth = mQSize.width;
    var loginFormKey;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: mQHeight / 6),
            Center(child: Image.asset("./assets/images/logo.png", width: 120)),
            SizedBox(height: mQHeight / 10),
            Form(
              child: Column(
                children: [
                  Container(
                    height: mQHeight / 15,
                    margin: EdgeInsets.symmetric(horizontal: 35),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          blurStyle: BlurStyle.outer,
                          color: Colors.grey,
                          blurRadius: 25,
                         ),
                      ],
                    ),
                    child: Container(
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          hintText: "Registered Phone No.",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: mQHeight / 70),

                  Container(
                    height: mQHeight / 15,
                    margin: EdgeInsets.symmetric(horizontal: 35),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          blurStyle: BlurStyle.outer,
                          color: Colors.grey,
                          blurRadius: 25,
                        ),
                      ],
                    ),
                    child: Container(
                      child: TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                  ),

                  // TextFormField(),
                  SizedBox(height: mQHeight / 40),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffBA172F),
                    ),
                    onPressed: () {},
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: mQWidth / 7),
                      child: Text(
                        'Login',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(height: mQHeight / 100),
                  Text('OR'),
                  SizedBox(height: mQHeight / 100),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 35),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            blurStyle: BlurStyle.outer,
                            color: Colors.grey,
                            blurRadius: 25,
                          ),
                        ],
                      ),
                      child: TextButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/icons/google.png',
                                height: mQHeight / 28),
                            SizedBox(width: mQWidth / 50),
                            Text(
                              " Continue with Google     ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      )),
                  SizedBox(height: mQHeight / 50),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 35),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          blurStyle: BlurStyle.outer,
                          color: Colors.grey,
                          blurRadius: 25,
                        ),
                      ],
                    ),
                    child: TextButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(2),
                            child: Image.asset(
                                'assets/images/icons/facebook.png',
                                height: mQHeight / 30),
                          ),
                          SizedBox(width: mQWidth / 50),
                          Text(
                            "Continue with Facebook",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              key: loginFormKey,
            ),
            SizedBox(height: mQHeight / 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                    onPressed: () {
                      launchUrl(Uri.parse('https://RamApp.dev/'));
                    },
                    child: const Text(
                      'Forgot Password ?',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    )),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Sign up',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
