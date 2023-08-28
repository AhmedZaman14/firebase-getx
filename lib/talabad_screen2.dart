// ignore_for_file: prefer_const_constructors

import 'package:firebase_getx/talabad_screen3.dart';
import 'package:firebase_getx/widgets/filters.dart';
import 'package:firebase_getx/widgets/restaurant_containers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class TalabadScreen2 extends StatefulWidget {
  const TalabadScreen2({super.key});

  @override
  State<TalabadScreen2> createState() => _TalabadScreen2State();
}

class _TalabadScreen2State extends State<TalabadScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              size: 30,
            ),
            onPressed: () {},
          ),
        ],
        forceMaterialTransparency: true,
        backgroundColor: Colors.transparent,
        title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
          Text(
            'Johar, Karachi',
            style: GoogleFonts.lato(
              textStyle: TextStyle(
                color: Colors.grey[800],
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ]),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Filters(),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15, top: 20, bottom: 20, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Great value deals',
                    style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  restaurantContainerShort(),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'All restaurants',
                    style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(TalabadScreen3());
                    },
                    child: restaurantContainerFull(
                        'img/shwarma.jpg',
                        'img/reslogo.jpg',
                        '34 mins',
                        'AED 5.90',
                        "Abayomi Cafe & Restaurant",
                        "Afreican cafe, international",
                        '4.4',
                        '100'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  restaurantContainerFull(
                      'img/promo1.jpg',
                      'img/macdonald.png',
                      '34 mins',
                      'AED 5.90',
                      "Abayomi Cafe & Restaurant",
                      "Afreican cafe, international",
                      '4.4',
                      '100'),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Popular restaurants',
                    style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              padding: EdgeInsets.only(top: 20, left: 10),
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              child: Wrap(
                  spacing: 10,
                  children: List.generate(4, (index) {
                    return restaurantContainerShort();
                  })),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15, top: 20, bottom: 20, right: 15),
              child: restaurantContainerFull(
                  'img/shwarma.jpg',
                  'img/macdonald.png',
                  '34 mins',
                  'AED 5.90',
                  "Abayomi Cafe & Restaurant",
                  "Afreican cafe, international",
                  '4.4',
                  '100'),
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
