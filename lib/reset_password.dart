// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_page.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[200],
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Reset Password',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Times New Roman',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              _textField(false, 'Email', _emailController),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    FirebaseAuth.instance
                        .sendPasswordResetEmail(email: _emailController.text)
                        .then((value) {
                      Get.to(LoginPage());
                      Get.snackbar(
                          'Success', 'Check your email to reset password');
                    }).onError((error, stackTrace) {
                      Get.snackbar('Error', error.toString(),
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.red,
                          colorText: Colors.white);
                    });
                  },
                  child: Text(
                    'Reset Password',
                    style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.normal,
                        fontSize: 20),
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }

  Widget _textField(
      bool isPassword, String hint, TextEditingController controller) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.white, width: 1),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 1),
          borderRadius: BorderRadius.circular(30),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.white, width: 1),
        ),
        filled: true,
        fillColor: Colors.grey[200],
        hintText: hint,
        prefixIcon: Icon(
          !isPassword ? Icons.email : Icons.lock,
          color: Colors.grey[600],
        ),
      ),
    );
  }
}
