// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:offerswala/api/const.dart';
import 'package:offerswala/screens/select_location_Screen.dart';
import 'package:offerswala/screens/login.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_form_validations/simple_form_validations.dart';

final signupFormKey = GlobalKey<FormState>();
var firstNameController = TextEditingController();
var lastNameController = TextEditingController();
var emailController = TextEditingController();
var phoneController = TextEditingController();
var passwordController = TextEditingController();
var repeatPasswordController = TextEditingController();

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    var mQSize = MediaQuery.of(context).size;
    var mQHeight = mQSize.height;
    var mQWidth = mQSize.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: signupFormKey,
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset(
                    "assets/images/signup/high.png",
                    width: mQWidth,
                  ),
                  Container(
                    margin:
                        EdgeInsets.fromLTRB(mQWidth / 10, mQHeight / 4.3, 0, 0),
                    child: Row(
                      children: [
                        Container(
                          child: Image.asset(
                            "assets/images/logo.png",
                            width: mQWidth / 3,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: mQWidth / 3.5),
                          child: Image.asset(
                            "assets/images/signup/arrow.png",
                            width: mQWidth / 8.5,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: mQHeight / 15),
              Container(
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 224, 224, 224),
                      blurRadius: 10,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                margin: EdgeInsets.symmetric(horizontal: mQWidth / 15),
                child: TextFormField(
                  controller: firstNameController,
                  validator: (value) => SimpleValidations.nameValidator(value),
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    fillColor: const Color.fromARGB(255, 255, 255, 255),
                    filled: true,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hintText: 'First Name',
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: mQWidth / 15),
                  ),
                ),
              ),
              SizedBox(height: mQHeight / 30),
              Container(
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 224, 224, 224),
                      blurRadius: 10,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                margin: EdgeInsets.symmetric(horizontal: mQWidth / 15),
                child: TextFormField(
                  validator: (value) => SimpleValidations.nameValidator(value),
                  controller: lastNameController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    fillColor: const Color.fromARGB(255, 255, 255, 255),
                    filled: true,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hintText: 'Last Name',
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: mQWidth / 15),
                  ),
                ),
              ),
              SizedBox(height: mQHeight / 30),
              Container(
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 224, 224, 224),
                      blurRadius: 10,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                margin: EdgeInsets.symmetric(horizontal: mQWidth / 15),
                child: TextFormField(
                  validator: (value) => SimpleValidations.emailValidator(value),
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    fillColor: const Color.fromARGB(255, 255, 255, 255),
                    filled: true,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hintText: 'Email',
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: mQWidth / 15),
                  ),
                ),
              ),
              SizedBox(height: mQHeight / 30),
              Container(
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 224, 224, 224),
                      blurRadius: 10,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                margin: EdgeInsets.symmetric(horizontal: mQWidth / 15),
                child: TextFormField(
                  validator: (value) =>
                      SimpleValidations.phoneNumberValidator(value),
                  controller: phoneController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    fillColor: const Color.fromARGB(255, 255, 255, 255),
                    filled: true,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hintText: 'Mobile No.',
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: mQWidth / 15),
                  ),
                ),
              ),
              SizedBox(height: mQHeight / 30),
              Container(
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 224, 224, 224),
                      blurRadius: 10,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                margin: EdgeInsets.symmetric(horizontal: mQWidth / 15),
                child: TextFormField(
                  validator: (value) =>
                      SimpleValidations.passwordValidator(value),
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    fillColor: const Color.fromARGB(255, 255, 255, 255),
                    filled: true,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hintText: 'Password',
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: mQWidth / 15),
                  ),
                ),
              ),
              SizedBox(height: mQHeight / 30),
              Container(
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 224, 224, 224),
                      blurRadius: 10,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                margin: EdgeInsets.symmetric(horizontal: mQWidth / 15),
                child: TextFormField(
                  controller: repeatPasswordController,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return "Required";
                    } else if (value != passwordController.text) {
                      return "Password doesn't match";
                    } else if (value == passwordController.text) {
                      return null;
                    }
                    return null;
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    fillColor: const Color.fromARGB(255, 255, 255, 255),
                    filled: true,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hintText: 'Re-enter Password',
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: mQWidth / 15),
                  ),
                ),
              ),
              SizedBox(height: mQHeight / 25),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffBA172F),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9)),
                ),
                onPressed: onSignupPressed,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: mQWidth / 4,
                    vertical: mQHeight / 70,
                  ),
                  child: const Text(
                    'Create Account',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: mQHeight / 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already Have a account ?',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Color(0xffBA172F),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: mQHeight / 25,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> onSignupPressed() async {
    if (signupFormKey.currentState!.validate()) {
      print("Valid data!");

      try {
        final response = await dio.post(
          signupURL,
          data: {
            "FName": firstNameController.text.trim(),
            "LName": lastNameController.text.trim(),
            "mobile": phoneController.text.trim(),
            "email": emailController.text.trim(),
            "pass": passwordController.text.trim(),
          },
        );

        print(response.data);

        if (response.statusCode == 200) {
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('firstname', response.data['Name']);
          await prefs.setString('lastname', response.data['last_name']);
          await prefs.setString('email', response.data['Email']);
          await prefs.setString('mobile', response.data['Mobile']);
          await prefs.setString('UID', response.data['UID']);
          Navigator.pushReplacement(
            context,
            PageTransition(
              type: PageTransitionType.rightToLeft,
              child: SelectLocationScreen(
                uid: response.data['UID'],
              ),
            ),
          );
        } else if (response.statusCode == 208) {
          Get.snackbar('Failed', 'Mobile Number already Exist',
              snackPosition: SnackPosition.BOTTOM);
        } else {
          Get.snackbar('Login', 'Failed', snackPosition: SnackPosition.BOTTOM);
        }
      } catch (error) {
        print(error);
      }
    }
  }
}
