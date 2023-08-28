// ignore_for_file: prefer_const_constructors

import 'package:firebase_getx/floating_sheet.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Filters extends StatefulWidget {
  const Filters({
    super.key,
  });

  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  List<String> selectedFilters = [];

  List titles = [
    'Sort by',
    "Cuisines",
    'Rating 4.0+',
    'Free delivery',
    'Under 30 mins',
    'Newly added'
  ];
  List icons = [
    Icons.compare_arrows,
    Icons.diamond_sharp,
    null,
    null,
    null,
    null
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(top: 20, left: 10),
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      child: Wrap(
          spacing: 10,
          children: List.generate(titles.length, (index) {
            return filterContainer(
              titles[index],
              icons[index],
            );
          })),
    );
  }

  Widget filterContainer(String title, IconData? icon) {
    return FilterChip(
        labelPadding: icon != null
            ? EdgeInsets.all(0)
            : EdgeInsets.only(left: 5, right: 5),
        label: icon != null && !selectedFilters.contains(title)
            ? Wrap(
                spacing: 5,
                children: [
                  Icon(
                    icon,
                    color: !selectedFilters.contains(title)
                        ? Colors.black54
                        : Colors.white,
                  ),
                  Text(
                    " $title",
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        color: !selectedFilters.contains(title)
                            ? Colors.black54
                            : Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: !selectedFilters.contains(title)
                        ? Colors.black54
                        : Colors.white,
                  )
                ],
              )
            : Text(
                " $title",
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      color: !selectedFilters.contains(title)
                          ? Colors.black54
                          : Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      wordSpacing: 3),
                ),
              ),
        showCheckmark: false,
        avatar: selectedFilters.contains(title)
            ? Icon(Icons.close_outlined, color: Colors.white)
            : null,
        backgroundColor: Colors.white,
        selectedColor: Colors.deepOrangeAccent,
        selected: selectedFilters.contains(title),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(52),
          side: BorderSide(color: Colors.grey.withOpacity(0.3), width: 5.1),
        ),
        onSelected: (selected) {
          setState(() {
            if (selected && title != 'Sort by' && title != 'Cuisines') {
              selectedFilters.add(title);
            } else if (selected &&
                (title == 'Sort by' || title == 'Cuisines')) {
              showFloatingModalBottomSheet(
                  context: context,
                  builder: (context) => ModalFit()).then((value) {
                setState(() {
                  selectedFilters.add(title);
                });
              });
            } else {
              if (title == 'Sort by' || title == 'Cuisines') {
                showFloatingModalBottomSheet(
                    context: context,
                    builder: (context) => ModalFit()).then((value) {
                  setState(() {
                    selectedFilters.remove(title);
                  });
                });
              } else {
                selectedFilters.remove(title);
              }
            }
          });
        });
  }
}
