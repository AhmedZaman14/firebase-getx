// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

Widget categoryContainer(String image, String name, String? subField,
    double? imgWidth, double? imgHeight) {
  return Stack(
    alignment: Alignment.center,
    children: [
      Container(
        height: 150,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          //    color: Colors.black45,
        ),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                color: Colors.grey[200],
              ),
              padding: const EdgeInsets.only(left: 12, right: 12),
              // width: 150,
              //height: 100,
              child: Image.asset(
                image,
                width: imgWidth ?? 90,
                height: imgHeight ?? 90,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              color: Colors.transparent,
              child: Text(
                name,
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
      subField != null
          ? Positioned(
              top: 80,
              child: Container(
                alignment: Alignment.center,
                //width: 80,
                //height: 20,
                padding: const EdgeInsets.only(left: 5, right: 5),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Colors.deepOrange,
                ),
                child: Text(
                  subField,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    wordSpacing: 2,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            )
          : Container(),
    ],
  );
}

Widget subCategoryContainer(
  String image,
  String name,
  Color? color,
) {
  return Column(
    children: [
      Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          color: color ?? Colors.grey[200],
        ),
        padding: const EdgeInsets.all(10),
        // width: 150,
        //height: 100,
        child: Image.asset(
          image,
          width: 70,
          height: 70,
        ),
      ),
      const SizedBox(
        height: 5,
      ),
      Container(
        color: Colors.transparent,
        child: Text(
          name,
          textAlign: TextAlign.center,
          style: GoogleFonts.lato(
            textStyle: const TextStyle(
              color: Colors.black87,
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    ],
  );
}

Widget subCategoryContainer2(
  IconData icon,
  String name,
  Color? color,
) {
  return Column(
    children: [
      Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          color: color ?? Colors.grey[200],
        ),
        padding: const EdgeInsets.all(15),
        // width: 150,
        //height: 100,
        child: Shimmer.fromColors(
          baseColor: Colors.deepOrange,
          highlightColor: Colors.grey.shade100,
          direction: ShimmerDirection.rtl,
          child: Icon(
            icon,
            size: 45,
            color: Colors.deepOrange,
          ),
        ),
      ),
      const SizedBox(
        height: 5,
      ),
      Container(
        color: Colors.transparent,
        child: Text(
          name,
          textAlign: TextAlign.center,
          style: GoogleFonts.lato(
            textStyle: const TextStyle(
              color: Colors.black87,
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    ],
  );
}

Widget simpleContainer() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 4), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          Shimmer.fromColors(
            baseColor: Colors.pink,
            highlightColor: Colors.grey.shade100,
            period: const Duration(seconds: 2),
            child: const Icon(
              Icons.sticky_note_2_sharp,
              size: 60,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Got a code?',
                  style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Add your code and save on your order.',
                  style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                      color: Colors.black54,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}

Widget popularRestaurants(
  String image,
  String name,
  Color? color,
) {
  return SizedBox(
    width: 85,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 85,
          height: 85,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 6,
                offset: const Offset(0, 2), // changes position of shadow
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),

            //   padding: const EdgeInsets.all(10),
            // width: 150,
            //height: 100,
            child: Image.asset(
              image,
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
          name,
          textAlign: TextAlign.center,
          style: GoogleFonts.lato(
            textStyle: const TextStyle(
              color: Colors.black87,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.access_time, size: 14, color: Colors.black45),
            Text(
              '  24 mins',
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                textStyle: const TextStyle(
                  color: Colors.black45,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        )
      ],
    ),
  );
}
