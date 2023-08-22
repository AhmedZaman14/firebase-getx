// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_getx/floating_sheet.dart';
import 'package:firebase_getx/test_screen.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? url;

  getProfile() {}

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    String email = FirebaseAuth.instance.currentUser?.email.toString() ?? '';
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              width: w,
              height: h * 0.5,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('img/signup.png'), fit: BoxFit.cover),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: h * 0.15,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: url != null
                        // ? ClipOval(
                        //     child: Image.network(
                        //       url!,
                        //       width: 100,
                        //       height: 100,
                        //       fit: BoxFit.cover,
                        //     ),
                        //   )

                        ? Stack(
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: Colors.white, width: 4),
                                  ),
                                  child: ClipOval(
                                    child: Image.network(
                                      url!,
                                      width: 150,
                                      height: 150,
                                      fit: BoxFit.cover,
                                    ),
                                  )),
                              Positioned(
                                bottom: 10,
                                right: 0,
                                child: GestureDetector(
                                  onTap: () {
                                    showFloatingModalBottomSheet(
                                        context: context,
                                        builder: (context) => ModalFit());
                                  },
                                  child: CircleAvatar(
                                    radius: 16,
                                    backgroundColor: Colors.grey[400],
                                    child: Icon(
                                      Icons.edit,
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : ClipOval(
                            child: Image.asset(
                              'img/placeholder.jpg',
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
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
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Welcome, now log out',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    email,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      String errorMsg = '';
                      try {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            });

                        //for image upload
                        //  Reference ref = FirebaseStorage.instance.ref().child('userProfile').child('${DateTime.now().millisecondsSinceEpoch}');
                        User? user = FirebaseAuth.instance.currentUser;
                        String uid = user!.uid;
                        // print('user yuid---- ' + uid.toString());
                        Reference ref = await FirebaseStorage.instance
                            .ref()
                            .child('userProfile.jpg$uid');
                        print('userProfile.jpg$uid');
                        // print(uid.toString() + ' ---------------uid111');
                        // await ref.putFile(File(selectedImage!.path));

                        url = ref.getDownloadURL().then((value) {
                          setState(() {
                            url = value;
                          });
                          print('url is ' + url.toString());
                          // ignore: avoid_print
                          print(uid.toString() + ' ---------------uid');
                          Navigator.pop(context);
                        }) as String?;
                        // ignore: use_build_context_synchronously
                        Navigator.pop(context);
                        Get.snackbar('Signed In', "You're signed in");

                        Get.to(() => const HomePage());

                        // .onError((error, stackTrace) {
                        //   Get.snackbar(
                        //     'Error',
                        //     error.toString(),
                        //     snackPosition: SnackPosition.BOTTOM,
                        //     backgroundColor: Colors.red,
                        //     colorText: Colors.white,
                        //     snackStyle: SnackStyle.FLOATING,
                        //   );
                        // });
                      } on FirebaseAuthException catch (e) {
                        errorMsg = e.code;

                        Get.snackbar(
                          'Error',
                          errorMsg,
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.red,
                          colorText: Colors.white,
                          snackStyle: SnackStyle.FLOATING,
                        );

                        Navigator.pop(context);
                      }
                    },
                    child: Text('click here to see image  ' + url.toString()),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                FirebaseAuth.instance.signOut().then((value) {
                  FirebaseAuth.instance.authStateChanges().listen((User? user) {
                    if (user == null) {
                      // print('User signed out');
                    } else {
                      //  print("not signed out");
                    }
                  });
                });
                Get.to(() => const LoginPage());
                Get.snackbar('Signed out', 'You have been signed out',
                    snackPosition: SnackPosition.TOP,
                    backgroundColor: Colors.deepPurple[300],
                    colorText: Colors.white);
              },
              child: Container(
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
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  showFloatingModalBottomSheet(
                      context: context, builder: (context) => ModalFit());
                },
                child: const Text('Bottom Sheet')),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(TestScreen());
              },
              child: Text('Next Screen'),
            ),
            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
