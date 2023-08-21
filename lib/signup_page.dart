import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_getx/auth.dart';
import 'package:firebase_getx/home_page.dart';
import 'package:firebase_getx/login_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  File? selectedImage;

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    List images = ['img/f.png', 'img/git.jpg', 'img/g.png'];

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: GestureDetector(
                      onTap: () async {
                        final ImagePicker picker = ImagePicker();
                        final XFile? image =
                            await picker.pickImage(source: ImageSource.gallery);

                        if (image != null) {
                          setState(() {
                            selectedImage = File(image.path);
                          });
                        }
                      },
                      child: CircleAvatar(
                        maxRadius: 60,
                        backgroundColor: Colors.transparent,
                        child: selectedImage != null
                            ? ClipOval(
                                child: Image.file(
                                  selectedImage!,
                                  width: 120,
                                  height: 120,
                                  fit: BoxFit.cover,
                                ),
                              )
                            : ClipOval(
                                child: Image.asset(
                                  'img/placeholder.jpg',
                                  width: 120,
                                  height: 120,
                                  fit: BoxFit.cover,
                                ),
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: w,
              margin: const EdgeInsets.only(left: 15, right: 15),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10,
                              spreadRadius: 7,
                              offset: const Offset(1, 1),
                              color: Colors.grey.withOpacity(0.3),
                            )
                          ]),
                      child: TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          hintStyle: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey),
                          prefixIcon: const Icon(
                            Icons.email,
                            color: Colors.deepOrangeAccent,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                              width: 1.0,
                              color: Colors.white,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                              width: 1.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10,
                              spreadRadius: 7,
                              offset: const Offset(1, 1),
                              color: Colors.grey.withOpacity(0.3),
                            )
                          ]),
                      child: TextField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: Colors.deepOrangeAccent,
                          ),
                          hintStyle: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                              width: 1.0,
                              color: Colors.white,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                              width: 1.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                  ]),
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

                  await FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                    email: _emailController.text,
                    password: _passwordController.text,
                  )
                      .then((value) async {
                    //for image upload
                    //  Reference ref = FirebaseStorage.instance.ref().child('userProfile').child('${DateTime.now().millisecondsSinceEpoch}');
                    User? user = FirebaseAuth.instance.currentUser;
                    String uid = user!.uid;

                    Reference ref = FirebaseStorage.instance
                        .ref()
                        .child('userProfile.jpg$uid');

                    await ref.putFile(File(selectedImage!.path));

                    ref.getDownloadURL().then((value) {
                      // ignore: avoid_print
                      print(value);
                    });
                    // ignore: use_build_context_synchronously
                    Navigator.pop(context);
                    Get.snackbar('Signed In', "You're signed in");

                    Get.to(() => const HomePage());
                  });
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
                  if (e.code == 'weak-password') {
                    errorMsg = 'The password provided is too weak.';
                  } else if (e.code == 'email-already-in-use') {
                    errorMsg = 'The account already exists for that email.';
                  } else {
                    errorMsg = e.code;
                  }

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
              child: Container(
                width: w * 0.5,
                height: h * 0.08,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.9),
                        blurRadius: 20,
                        offset: const Offset(5, 10)),
                  ],
                  borderRadius: BorderRadius.circular(30),
                  image: const DecorationImage(
                      image: AssetImage('img/loginbtn.png'), fit: BoxFit.cover),
                ),
                child: const Center(
                  child: Text(
                    'Sign up',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: h * 0.1,
            ),
            RichText(
              text: const TextSpan(
                text: "Signup with your account",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey),
              ),
            ),
            Wrap(
              spacing: 1,
              children: List<Widget>.generate(
                3,
                (index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () async {
                        if (index == 2) {
                          try {
                            await signInWithGoogle().then((value) {
                              Get.to(const HomePage());
                            });
                          } catch (e) {
                            Get.snackbar('Error', e.toString());
                          }
                        }
                      },
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.grey[500],
                        child: CircleAvatar(
                          maxRadius: 25,
                          backgroundImage: AssetImage(images[index]),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: h * 0.05,
            ),
            RichText(
              text: TextSpan(
                  text: "Already have an account?",
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey),
                  children: [
                    TextSpan(
                      text: " Signin",
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black45),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Get.to(() => const LoginPage()),
                    )
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
