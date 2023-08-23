import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
