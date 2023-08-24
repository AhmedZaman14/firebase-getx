// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget loginContainer() {
  return Stack(children: [
    Container(
      height: 200,
      width: double.infinity,
      padding: EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
        color: Colors.orange.withOpacity(0.07),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Hey there!',
            style: GoogleFonts.lato(
              textStyle: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            'Log in or create an account for a faster \nordering experience.',
            style: GoogleFonts.lato(
              textStyle: TextStyle(
                color: Colors.black,
                wordSpacing: 2,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.only(left: 20, right: 20),
                backgroundColor: Colors.deepOrange.withOpacity(0.85),
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
              ),
              onPressed: () {},
              child: Text(
                'Sign up',
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    color: Colors.white,
                    wordSpacing: 2,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ))
        ],
      ),
    ),
    Positioned(
        right: -40,
        bottom: -20,
        child: Transform.flip(
          flipX: true,
          child: Image.asset(
            'img/p2.png',
            height: 150,
            width: 150,
          ),
        ))
  ]);
}
