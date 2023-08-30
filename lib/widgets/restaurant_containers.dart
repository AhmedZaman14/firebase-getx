// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget restaurantContainerShort() {
  return SizedBox(
    width: 160,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 160,
          height: 120,
          decoration: BoxDecoration(
              // color: Colors.transparent,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border:
                  Border.all(color: Colors.grey.withOpacity(0.3), width: 0.5)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),

            //   padding: const EdgeInsets.all(10),
            // width: 150,
            //height: 100,
            child: Image.asset(
              'img/promo1.jpg',
              fit: BoxFit.cover,

              //width: 70,
              //height: 70,
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          "Shawarmetna",
          style: GoogleFonts.lato(
            textStyle: const TextStyle(
              color: Colors.black87,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Text(
          "Shawarma",
          style: GoogleFonts.lato(
            textStyle: const TextStyle(
              color: Colors.black45,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.star,
                size: 20, color: Color.fromARGB(255, 235, 213, 15)),
            RichText(
              text: TextSpan(
                  text: "  4.4",
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: Colors.black),
                  children: const [
                    TextSpan(
                      text: " (100+)",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey),
                    )
                  ]),
            )
          ],
        )
      ],
    ),
  );
}

Widget restaurantContainerFull(
    String resImg,
    String profileImg,
    String time,
    String deliveryRate,
    String resName,
    String niche,
    String rating,
    String totalRatings) {
  return Stack(
    children: [
      Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey.withOpacity(0.7), width: 0.7),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),

                //   padding: const EdgeInsets.all(10),
                // width: 150,
                //height: 100,
                child: Image.asset(
                  resImg,
                  fit: BoxFit.cover,

                  //width: 70,
                  //height: 70,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 22,
              color: Colors.pink.withOpacity(0.1),
              child: Text(
                '     20% off all orders',
                style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                    color: Color.fromARGB(255, 247, 1, 83),
                    fontSize: 15,
                    wordSpacing: 2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 10, left: 15, right: 15, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    resName,
                    style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                        color: Colors.black87,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          niche,
                          style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                              color: Colors.black45,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      const Icon(Icons.star,
                          size: 20, color: Color.fromARGB(255, 235, 213, 15)),
                      RichText(
                        text: TextSpan(
                            text: "  $rating",
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                                color: Colors.black),
                            children: [
                              TextSpan(
                                text: " ($totalRatings+)",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.grey),
                              )
                            ]),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      Positioned(
        top: 5,
        left: 10,
        child: Row(
          children: [
            indicator(
              time,
              Icons.access_time,
            ),
            SizedBox(
              width: 10,
            ),
            indicator(
              deliveryRate,
              Icons.directions_bike_rounded,
            ),
          ],
        ),
      ),
      Positioned(
        right: 7,
        bottom: 50,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.withOpacity(0.7), width: 0.5),
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              profileImg,
              fit: BoxFit.cover,
              height: 85,
              width: 95,
            ),
          ),
        ),
      ),
    ],
  );
}

Widget indicator(String txt, IconData icon) {
  return Container(
    padding: EdgeInsets.all(7),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: Colors.white,
    ),
//    height: 30,
    child: Row(
      children: [
        Icon(
          icon,
          color: Colors.black54,
          size: 15,
        ),
        Text(
          " $txt",
          style: GoogleFonts.lato(
            textStyle: const TextStyle(
              color: Colors.black87,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
  );
}
