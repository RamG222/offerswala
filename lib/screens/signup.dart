// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:offerswala/screens/Select_location_Screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:simple_form_validations/simple_form_validations.dart';

final signupFormKey = GlobalKey<FormState>();
var firstNameController = TextEditingController();
var lastNameController = TextEditingController();
var emailController = TextEditingController();
var phoneController = TextEditingController();
var passwordController = TextEditingController();

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
                  controller: firstNameController,
                  validator: (value) => SimpleValidations.nameValidator(value),
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    fillColor: Color.fromARGB(255, 255, 255, 255),
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
                  validator: (value) => SimpleValidations.nameValidator(value),
                  controller: lastNameController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    fillColor: Color.fromARGB(255, 255, 255, 255),
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
                  validator: (value) => SimpleValidations.emailValidator(value),
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    fillColor: Color.fromARGB(255, 255, 255, 255),
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
                  validator: (value) =>
                      SimpleValidations.phoneNumberValidator(value),
                  controller: phoneController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    fillColor: Color.fromARGB(255, 255, 255, 255),
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
                  validator: (value) =>
                      SimpleValidations.passwordValidator(value),
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    fillColor: Color.fromARGB(255, 255, 255, 255),
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
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return "Required";
                    } else if (value != passwordController.text) {
                      return "Password doesn't match";
                    } else if (value == passwordController.text) {
                      return null;
                    }
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    fillColor: Color.fromARGB(255, 255, 255, 255),
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
                onPressed: () {
                  if (signupFormKey.currentState!.validate()) {
                    print("Valid data!");
                    passwordController.clear();
                  }
                },
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
                        color: const Color(0xffBA172F),
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
}
