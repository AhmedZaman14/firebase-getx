// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_getx/talabad_screen3.dart';
import 'package:firebase_getx/widgets/expanded_restaurant.dart';
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
      // appBar: AppBar(
      //   leading: BackButton(onPressed: () {
      //     Navigator.pop(context);
      //   }),
      // ),
      body: currentIndex == 0
          ? S1()
          : currentIndex == 1
              ? S2()
              : SliverTabExample(),
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
  const S2({Key? key}) : super(key: key);

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

class SliverTabExample extends StatefulWidget {
  const SliverTabExample({Key? key}) : super(key: key);

  @override
  State<SliverTabExample> createState() => _SliverTabExampleState();
}

class _SliverTabExampleState extends State<SliverTabExample>
    with SingleTickerProviderStateMixin {
  final _tabs = List.generate(10, (index) => 'Tab#${index + 1}');

  late final TabController _tabCont;
  @override
  void initState() {
    _tabCont = TabController(length: 10, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (_, __) {
          return [
            SliverAppBar(
              backgroundColor: Colors.white,
              scrolledUnderElevation: 0.0,
              elevation: 0,
              automaticallyImplyLeading: false,
              leading: CircleAvatar(
                backgroundColor: Colors.white,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black87,
                    size: 25,
                  ),
                ),
              ),
              flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: Stack(
                    children: [
                      Image.asset(
                        "img/cover.jpg",
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.2,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        top: MediaQuery.of(context).size.height * 0.14,
                        left: 10,
                        right: 10,
                        child: restaurantInfoContainer(),
                      ),
                    ],
                  )),
              actions: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    padding: EdgeInsets.all(0),
                    icon: Icon(
                      Icons.ios_share_rounded,
                      color: Colors.black87,
                      size: 25,
                    ),
                    onPressed: () {},
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    padding: EdgeInsets.all(0),
                    icon: Icon(
                      Icons.search,
                      weight: 0.001,
                      color: Colors.black87,
                      size: 25,
                    ),
                    onPressed: () {},
                  ),
                ),
              ],

              expandedHeight: MediaQuery.of(context).size.height * 0.45,
              collapsedHeight: 70,

              pinned: true,
              floating: false,
              // title: Text('TabBar Example'),
              centerTitle: true,
              bottom: TabBar(
                controller: _tabCont,
                isScrollable: true,
                tabs: [
                  ..._tabs.map(
                    (label) => Tab(
                      child: Text(label),
                    ),
                  ),
                ],
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabCont,
          children: [
            ..._tabs.map(
              (label) => SamplePage(
                label: label,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
