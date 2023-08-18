import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_getx/reset_password.dart';
import 'package:firebase_getx/signup_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  bool isPassVisible = true;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: w,
              height: h * 0.3,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('img/loginimg.png'), fit: BoxFit.cover),
              ),
            ),
            Container(
              width: w,
              margin: const EdgeInsets.only(left: 15, right: 15),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Hello',
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'Signin to your account',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10,
                              spreadRadius: 7,
                              offset: const Offset(1, 1),
                              color: Colors.grey.withOpacity(0.3),
                            )
                          ]),
                      child: TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: 'example@xyz.com',
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.deepOrangeAccent,
                          ),
                          hintStyle: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                              width: 1.0,
                              color: Colors.white,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                              width: 1.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10,
                              spreadRadius: 7,
                              offset: const Offset(1, 1),
                              color: Colors.grey.withOpacity(0.3),
                            )
                          ]),
                      child: TextField(
                        controller: passController,
                        obscureText: isPassVisible,
                        decoration: InputDecoration(
                          hintText: '***********',
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.deepOrangeAccent,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isPassVisible = !isPassVisible;
                              });
                            },
                            icon: isPassVisible
                                ? Icon(
                                    Icons.visibility_off,
                                    color: Colors.deepOrangeAccent,
                                  )
                                : Icon(
                                    Icons.visibility,
                                    color: Colors.deepOrangeAccent,
                                  ),
                          ),
                          hintStyle: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                              width: 1.0,
                              color: Colors.white,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                              width: 1.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => const ResetPassword());
                          },
                          child: const Text(
                            'Fogot your password?',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                  ]),
            ),
            GestureDetector(
              onTap: () {
                FirebaseAuth.instance
                    .signInWithEmailAndPassword(
                        email: emailController.text,
                        password: passController.text)
                    .then((value) => Get.to(() => const HomePage()))
                    .onError((error, stackTrace) {
                  Get.snackbar('Error', error.toString(),
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Color.fromARGB(255, 206, 52, 52),
                      colorText: Colors.white);
                  return null;
                });
              },
              child: Container(
                width: w * 0.5,
                height: h * 0.08,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: const DecorationImage(
                      image: AssetImage('img/loginbtn.png'), fit: BoxFit.cover),
                ),
                child: const Center(
                  child: Text(
                    'Sign in',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: h * 0.1,
            ),
            RichText(
              text: TextSpan(
                  text: "Don't have an account?",
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey),
                  children: [
                    TextSpan(
                      text: " Signup",
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black45),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Get.to(() => const SignupPage()),
                    )
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
