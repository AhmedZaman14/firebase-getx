// ignore_for_file: prefer_const_constructors

import 'package:firebase_getx/widgets/sliding_appbar.dart';
import 'package:flutter/material.dart';

class TalabadScreen3 extends StatefulWidget {
  const TalabadScreen3({super.key});

  @override
  State<TalabadScreen3> createState() => _TalabadScreen3State();
}

class _TalabadScreen3State extends State<TalabadScreen3>
    with SingleTickerProviderStateMixin {
  bool _visible = true;
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      // appBar: AppBar(
      //   actions: [
      //     IconButton(
      //       icon: Icon(
      //         Icons.ios_share_rounded,
      //         color: Colors.black54,
      //         size: 30,
      //       ),
      //       onPressed: () {},
      //     ),
      //     IconButton(
      //       icon: Icon(
      //         Icons.search,
      //         color: Colors.black54,
      //         size: 30,
      //       ),
      //       onPressed: () {},
      //     ),
      //   ],
      // ),
      appBar: SlidingAppBar(
        controller: _controller,
        visible: _visible,
        child: AppBar(title: Text('AppBar')),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text(_visible ? 'Hide' : 'Show'),
        onPressed: () => setState(() => _visible = !_visible),
      ),
    );
  }

  Widget upperBody() {
    return Container();
  }
}
