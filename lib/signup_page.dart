import 'package:firebase_getx/login_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    List images = ['img/f.png', 'img/t.png', 'img/g.png'];

    return Scaffold(
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
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
                CircleAvatar(
                  maxRadius: 60,
                  backgroundColor: Colors.white70,
                  backgroundImage: AssetImage(
                    'img/profile1.png',
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: w,
            margin: const EdgeInsets.only(left: 15, right: 15),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                        offset: Offset(1, 1),
                        color: Colors.grey.withOpacity(0.3),
                      )
                    ]),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey),
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.deepOrangeAccent,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        width: 1.0,
                        color: Colors.white,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        width: 1.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
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
                        offset: Offset(1, 1),
                        color: Colors.grey.withOpacity(0.3),
                      )
                    ]),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Password',
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.deepOrangeAccent,
                    ),
                    hintStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        width: 1.0,
                        color: Colors.white,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
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
              const SizedBox(
                height: 40,
              ),
            ]),
          ),
          Container(
            width: w * 0.5,
            height: h * 0.08,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              image: const DecorationImage(
                  image: AssetImage('img/loginbtn.png'), fit: BoxFit.cover),
            ),
            child: const Center(
              child: Text(
                'Sign up',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          SizedBox(
            height: h * 0.1,
          ),
          RichText(
            text: TextSpan(
              text: "Signup with your account",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey),
            ),
          ),
          Wrap(
            spacing: 1,
            children: List<Widget>.generate(
              3,
              (index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.grey[500],
                    child: CircleAvatar(
                      maxRadius: 25,
                      backgroundImage: AssetImage(images[index]),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: h * 0.05,
          ),
          RichText(
            text: TextSpan(
                text: "Already have an account?",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey),
                children: [
                  TextSpan(
                    text: " Signin",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black45),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Get.to(() => const LoginPage()),
                  )
                ]),
          ),
        ],
      ),
    );
  }
}
