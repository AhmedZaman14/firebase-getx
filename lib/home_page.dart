import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

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
          SizedBox(
            height: h * 0.1,
          ),
          Container(
            width: w,
            margin: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome, now log out',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'example@etc.com',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
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
                'Sign out',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
