// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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

class S3 extends StatefulWidget {
  const S3({super.key});

  @override
  State<S3> createState() => _S3State();
}

class _S3State extends State<S3> {
  // Height of your Container

  static final _containerHeight = 100.0;

  // You don't need to change any of these variables
  var _fromTop = -_containerHeight;
  var _controller = ScrollController();
  var _allowReverse = true, _allowForward = true;
  var _prevOffset = 0.0;
  var _prevForwardOffset = -_containerHeight;
  var _prevReverseOffset = 0.0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_listener);
  }

  // entire logic is inside this listener for ListView
  void _listener() {
    double offset = _controller.offset;
    var direction = _controller.position.userScrollDirection;

    if (direction == ScrollDirection.reverse) {
      _allowForward = true;

      if (_allowReverse) {
        _allowReverse = false;
        _prevOffset = offset;
        _prevForwardOffset = _fromTop;
      }

      var difference = offset - _prevOffset;
      _fromTop = _prevForwardOffset + difference;
      if (_fromTop > 0) _fromTop = 0;
    } else if (direction == ScrollDirection.forward) {
      _allowReverse = true;

      if (_allowForward) {
        _allowForward = false;
        _prevReverseOffset = _fromTop;
      }

      var difference = offset - _prevOffset;

      if (offset > 100.0) {
        _prevOffset = offset;
      }

      if (offset < 100.0) {
        _fromTop = _prevReverseOffset + difference;
        if (_fromTop < -_containerHeight) _fromTop = -_containerHeight;
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ListView")),
      body: Stack(
        children: <Widget>[
          _yourListView(),
          Positioned(
            top: _fromTop,
            left: 0,
            right: 0,
            child: _yourContainer(),
          )
        ],
      ),
    );
  }

  Widget _yourListView() {
    return ListView.builder(
      itemCount: 100,
      controller: _controller,
      itemBuilder: (_, index) => ListTile(title: Text("Item $index")),
    );
  }

  Widget _yourContainer() {
    return Opacity(
      opacity: 1,
      child: Container(
        height: _containerHeight,
        color: Colors.red,
        alignment: Alignment.center,
        child: Text("Your Container",
            style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
      ),
    );
  }
}
