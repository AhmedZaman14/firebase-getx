import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    String email = FirebaseAuth.instance.currentUser?.email.toString() ?? '';

    return Scaffold(
      body: Column(
        children: [
          Container(
            width: w,
            height: h * 0.3,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('img/signup.png'), fit: BoxFit.cover),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: h * 0.15,
                ),
                const CircleAvatar(
                  maxRadius: 60,
                  backgroundColor: Colors.white70,
                  backgroundImage: AssetImage(
                    'img/profile1.png',
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: h * 0.1,
          ),
          Container(
            width: w,
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Welcome, now log out',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  email,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              FirebaseAuth.instance.signOut().then((value) {
                print(FirebaseAuth.instance.currentUser?.email.toString() ??
                    'nothing');
              });
              Get.to(() => const LoginPage());
              Get.snackbar('Signed out', 'You have been signed out',
                  snackPosition: SnackPosition.TOP,
                  backgroundColor: Colors.deepPurple[300],
                  colorText: Colors.white);
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
                  'Sign out',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
