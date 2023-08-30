// ignore_for_file: prefer_const_constructors

import 'package:card_swiper/card_swiper.dart';
import 'package:firebase_getx/talabad_screen2.dart';
import 'package:firebase_getx/widgets/category_container.dart';
import 'package:firebase_getx/widgets/login_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class TalabadHomeView extends StatefulWidget {
  const TalabadHomeView({super.key});

  @override
  State<TalabadHomeView> createState() => _TalabadHomeViewState();
}

class _TalabadHomeViewState extends State<TalabadHomeView> {
  int currentIndex = 0;

  Widget cardSwiper(
    List img,
  ) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(8),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Swiper(
              layout: SwiperLayout.CUSTOM,
              customLayoutOption:
                  CustomLayoutOption(startIndex: -1, stateCount: 3)
                    ..addTranslate([
                      Offset(-400.0, 0.0),
                      Offset(0.0, 0.0),
                      Offset(400.0, 0.0)
                    ]),
              itemHeight: 200.0,
              itemWidth: double.infinity,
              itemBuilder: (context, index) {
                return Image.asset(
                  img[index],
                  fit: BoxFit.cover,
                );
              },
              itemCount: img.length,
              autoplay: true,
              duration: 200,
              autoplayDelay: 3000,
              autoplayDisableOnInteraction: true,
              onIndexChanged: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            img.length,
            (index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: CircleAvatar(
                radius: 4,
                backgroundColor:
                    index == currentIndex ? Colors.black54 : Colors.grey[400],
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
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
      Icons.padding_sharp,
      Icons.offline_bolt_sharp,
      Icons.shopify_sharp,
      Icons.all_inclusive_sharp,
      Icons.handshake,
      Icons.offline_bolt,
      Icons.diamond,
    ];
    List img = ['img/promo1.jpg', 'img/promo2.jpg', 'img/macdonald.png'];
    List restaurantImgs = [
      'img/macdonald.png',
      'img/macdonald.png',
      'img/macdonald.png',
      'img/kfc.png',
      'img/kfc.png'
    ];
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.orange.withOpacity(0.07),
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
                  GestureDetector(
                    onTap: () {
                      Get.to(
                        TalabadScreen2(),
                      );
                    },
                    child: categoryContainer(
                      'img/burger.png',
                      'Food',
                      'Up to 50%',
                      null,
                      null,
                    ),
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
                    'Flowers',
                    null,
                  ),
                  subCategoryContainer(
                    'img/coffee.png',
                    'Coffee',
                    null,
                  ),
                  subCategoryContainer(
                    'img/shop.png',
                    'More Shops',
                    null,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              simpleContainer(),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 20, bottom: 20),
                child: Text(
                  'Shortcuts',
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
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
                    children: List.generate(shortCutImgs.length, (index) {
                      return subCategoryContainer2(
                        shortCutImgs[index],
                        shortCuts[index],
                        Colors.deepOrange.withOpacity(0.1),
                      );
                    })),
              ),
              SizedBox(
                height: 20,
              ),
              cardSwiper(img),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 20, bottom: 20),
                child: Text(
                  'Popular restaurants nearby',
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
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
                    children: List.generate(restaurantImgs.length, (index) {
                      return popularRestaurants(
                          restaurantImgs[index], 'KFC', Colors.grey[200]);
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
