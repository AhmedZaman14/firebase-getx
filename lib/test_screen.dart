// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'floating_sheet.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

int currentIndex = 0;

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        leading: BackButton(onPressed: () {
          Navigator.pop(context);
        }),
      ),
      body: currentIndex == 0
          ? S1()
          : currentIndex == 1
              ? S2()
              : S3(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        elevation: 20,
        landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
        selectedFontSize: 20,
        selectedIconTheme: IconThemeData(color: Colors.deepPurple),
        selectedItemColor: Colors.deepPurple,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        unselectedFontSize: 15,
        unselectedItemColor: Colors.grey[600],
        showUnselectedLabels: true,
        unselectedLabelStyle:
            TextStyle(fontWeight: FontWeight.normal, color: Colors.black),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.login,
            ),
            label: 'T0',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.app_registration),
            label: 'T1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restore),
            label: 'T2',
          ),
        ],
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
      ),
    );
  }
}

class S1 extends StatelessWidget {
  const S1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: ElevatedButton(
          style: ButtonStyle(
              elevation: MaterialStateProperty.all(10),
              padding: MaterialStateProperty.all(
                  EdgeInsets.only(left: 50, right: 50))),
          onPressed: () {
            showFloatingModalBottomSheet(
                context: context, builder: (context) => ModalFit());
          },
          child: Text(
            'To',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 20,
        onPressed: () {
          _settingModalBottomSheet(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
        showDragHandle: true,
        anchorPoint: Offset(1, 2),
        enableDrag: true,
        elevation: 10,
        context: context,
        builder: (BuildContext bc) {
          return Wrap(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.image),
                title: Text('Images'),
                onTap: () => {Navigator.pop(context)},
              ),
              ListTile(
                leading: Icon(Icons.videocam),
                title: Text('Video'),
                onTap: () => {Navigator.pop(context)},
              ),
            ],
          );
        });
  }
}

class S2 extends StatefulWidget {
  S2({Key? key}) : super(key: key);

  @override
  State<S2> createState() => _S2State();
}

class _S2State extends State<S2> {
  String? imageUrl;

  @override
  void initState() {
    super.initState();
    fetchProfile();
  }

  Future<void> fetchProfile() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        return;
      }

      String uid = user.uid;
      Reference ref =
          FirebaseStorage.instance.ref().child('userProfile.jpg$uid');
      String downloadUrl = await ref.getDownloadURL();

      setState(() {
        imageUrl = downloadUrl;
      });

      Get.snackbar('Success', 'Image Fetched');
    } catch (error) {
      Get.snackbar('Error', "$error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          if (imageUrl != null)
            Container(
              color: Colors.black12,
              width: 100,
              height: 100,
              child: Image.network(imageUrl!),
            ),
        ],
      ),
    );
  }
}

class S3 extends StatelessWidget {
  const S3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Text(
        'T2',
        style: TextStyle(fontSize: 20),
      )),
    );
  }
}
