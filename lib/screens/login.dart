import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:offerswala/screens/Select_location_Screen.dart';
import 'package:offerswala/screens/signup.dart';
import 'package:page_transition/page_transition.dart';
import 'package:simple_form_validations/simple_form_validations.dart';
import 'package:url_launcher/url_launcher.dart';
import '../methods/popScope_onback.dart';
import 'package:dio/dio.dart';

final dio = Dio();

final loginFormKey = GlobalKey<FormState>();
TextEditingController phoneNumController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  void onLoginPressed() async {
    if (loginFormKey.currentState!.validate()) {
      print("Valid data!");

      print(phoneNumController.text);
      print(passwordController.text);

      try {
        final response = await dio.post(
          'http://wbu.1aa.mytemp.website/api/app_login.php',
          data: {
            'mobile': phoneNumController.text.trim(),
            'pass': passwordController.text,
          },
        );
        if (response.statusCode == 200) {
          Navigator.pushReplacement(
            context,
            PageTransition(
              type: PageTransitionType.rightToLeft,
              child: SelectLocationScreen(),
            ),
          );
        }
      } catch (error) {
        print(error);
        Get.snackbar(
          'Login Failed',
          "$error",
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var mQSize = MediaQuery.of(context).size;
    var mQHeight = mQSize.height;
    var mQWidth = mQSize.width;

    return PopScope(
      canPop: false,
      onPopInvoked: (didpop) async {
        if (didpop) {
          return;
        }
        final bool shouldPop = await onback(context);
        if (shouldPop) {
          SystemNavigator.pop();
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: mQHeight / 7),
              Center(
                  child: Image.asset("./assets/images/logo.png", width: 150)),
              SizedBox(height: mQHeight / 14),
              Form(
                key: loginFormKey,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 224, 224, 224),
                            blurRadius: 10,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      margin: EdgeInsets.symmetric(horizontal: mQWidth / 15),
                      child: TextFormField(
                        controller: phoneNumController,
                        keyboardType: TextInputType.number,
                        // validator: (value) =>
                        //     SimpleValidations.phoneNumberValidator(value),
                        decoration: InputDecoration(
                          fillColor: Color.fromARGB(255, 255, 255, 255),
                          filled: true,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hintText: 'Registered Mobile No.',
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: mQWidth / 15),
                        ),
                      ),
                    ),
                    SizedBox(height: mQHeight / 30),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 224, 224, 224),
                            blurRadius: 10,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      margin: EdgeInsets.symmetric(horizontal: mQWidth / 15),
                      child: TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hintText: 'Password',
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: mQWidth / 15),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: mQHeight / 80,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: mQWidth / 1.8),
                      child: TextButton(
                          onPressed: () {
                            launchUrl(Uri.parse('https://google.com/'));
                          },
                          child: const Text(
                            'Forgot Password ?',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                    SizedBox(height: mQHeight / 42),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffBA172F),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(9)),
                      ),
                      onPressed: onLoginPressed,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: mQWidth / 3,
                          vertical: mQHeight / 70,
                        ),
                        child: const Text(
                          'Log in',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: mQHeight / 25),
                    const Text(
                      'Or Login With',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: mQHeight / 50),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: mQWidth / 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: mQWidth / 2.7,
                            height: mQHeight / 20,
                            child: TextButton.icon(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.white),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    side: BorderSide(
                                      color: const Color.fromARGB(
                                          255, 226, 226, 226),
                                    ),
                                  ),
                                ),
                              ),
                              onPressed: () {},
                              icon: Image.asset(
                                'assets/images/icons/google.png',
                                width: mQWidth / 15,
                              ),
                              label: Text('Google'),
                            ),
                          ),
                          SizedBox(
                            width: mQWidth / 2.5,
                            height: mQHeight / 20,
                            child: TextButton.icon(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll(Colors.white),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      side: BorderSide(
                                        color: const Color.fromARGB(
                                            255, 226, 226, 226),
                                      ),
                                    ),
                                  ),
                                ),
                                onPressed: () {},
                                icon: Image.asset(
                                  'assets/images/icons/fb.webp',
                                  width: mQWidth / 17,
                                ),
                                label: Text('Facebook')),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: mQHeight / 17,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Don\'t Have a account ?',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: SignUp(),
                        ),
                      );
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: const Color(0xffBA172F),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
