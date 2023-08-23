// ignore_for_file: prefer_const_constructors

import 'package:firebase_getx/widgets/category_container.dart';
import 'package:firebase_getx/widgets/login_container.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TalabadHomeView extends StatefulWidget {
  const TalabadHomeView({super.key});

  @override
  State<TalabadHomeView> createState() => _TalabadHomeViewState();
}

class _TalabadHomeViewState extends State<TalabadHomeView> {
  List shortCuts = [
    'Past\nOrders',
    'Super\nSaver',
    'Flash Sale',
    'Must-tries',
    'Give\nBack',
    'Past\nOrders',
    'Super\nSaver',
  ];
  List shortCutImgs = [
    'img/health.png',
    'img/flower.png',
    'img/coffee.png',
    'img/shop.png',
    'img/grocery.png',
    'img/shop.png',
    'img/health.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.deepOrange.withOpacity(0.07),
          title:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              'Delivering to',
              style: GoogleFonts.lato(
                textStyle: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              children: [
                Text(
                  'Johar, Karachi',
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Icon(
                  Icons.keyboard_arrow_down,
                  size: 35,
                  color: Colors.deepPurple,
                ),
              ],
            )
          ]),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              loginContainer(),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  categoryContainer(
                    'img/burger.png',
                    'Food',
                    'Up to 50%',
                    null,
                    null,
                  ),
                  categoryContainer(
                    'img/mart.png',
                    'Mart',
                    '10 min',
                    null,
                    null,
                  ),
                  categoryContainer(
                    'img/grocery.png',
                    'Groceries',
                    null,
                    null,
                    null,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  subCategoryContainer(
                    'img/health.png',
                    'Health &\nWellness',
                    null,
                  ),
                  subCategoryContainer(
                    'img/flower.png',
                    'Mart',
                    null,
                  ),
                  subCategoryContainer(
                    'img/coffee.png',
                    'Groceries',
                    null,
                  ),
                  subCategoryContainer(
                    'img/shop.png',
                    'More Shops',
                    null,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 20, bottom: 20),
                child: Text(
                  'Shortcuts',
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SingleChildScrollView(
                padding: EdgeInsets.only(left: 10),
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                child: Wrap(
                    spacing: 10,
                    children: List.generate(7, (index) {
                      return subCategoryContainer(
                        shortCutImgs[index],
                        shortCuts[index],
                        Colors.deepOrange.withOpacity(0.15),
                      );
                    })),
              ),
              SizedBox(
                height: 150,
              ),
            ],
          ),
        ));
  }
}
