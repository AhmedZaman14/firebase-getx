import 'package:firebase_getx/widgets/restaurant_containers.dart';

import 'package:flutter/material.dart';
import 'package:firebase_getx/widgets/expanded_restaurant.dart';
import 'package:google_fonts/google_fonts.dart';

class TalabadScreen3 extends StatefulWidget {
  const TalabadScreen3({super.key});

  @override
  State<TalabadScreen3> createState() => _TalabadScreen3State();
}

class _TalabadScreen3State extends State<TalabadScreen3>
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
              title: InvisibleExpandedHeader(
                child: Text(
                  'Love Diet Food',
                  style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              backgroundColor: Colors.white,
              scrolledUnderElevation: 0.0,
              elevation: 0,
              automaticallyImplyLeading: true,
              flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: Stack(
                    children: [
                      Image.asset(
                        "img/cover.jpg",
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.3,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        top: MediaQuery.of(context).size.height * 0.18,
                        left: 10,
                        right: 10,
                        child: restaurantInfoContainer(),
                      ),
                    ],
                  )),
              actions: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    padding: const EdgeInsets.all(0),
                    icon: const Icon(
                      Icons.ios_share_rounded,
                      color: Colors.black87,
                      size: 25,
                    ),
                    onPressed: () {},
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    padding: const EdgeInsets.all(0),
                    icon: const Icon(
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
              bottom: TabBar(
                unselectedLabelStyle: GoogleFonts.lato(
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                labelStyle: GoogleFonts.lato(
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                dividerColor: Colors.black54,
                indicatorColor: Colors.deepOrange,
                labelColor: Colors.deepOrange,
                unselectedLabelColor: Colors.grey,
                indicatorWeight: 4,
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

class SamplePage extends StatelessWidget {
  const SamplePage({Key? key, required this.label}) : super(key: key);
  final String label;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.all(20),
        child: Wrap(
          spacing: 20,
          children: List.generate(20, (index) {
            return restaurantContainerShort();
          }),
        ),
      ),
    );
  }
}

class InvisibleExpandedHeader extends StatefulWidget {
  final Widget child;
  const InvisibleExpandedHeader({
    Key? key,
    required this.child,
  }) : super(key: key);
  @override
  State<InvisibleExpandedHeader> createState() {
    return _InvisibleExpandedHeaderState();
  }
}

class _InvisibleExpandedHeaderState extends State<InvisibleExpandedHeader> {
  ScrollPosition? _position;
  bool? _visible;

  @override
  void dispose() {
    _removeListener();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _removeListener();
    _addListener();
  }

  void _addListener() {
    _position = Scrollable.of(context).position;
    _position?.addListener(_positionListener);
    _positionListener();
  }

  void _removeListener() {
    _position?.removeListener(_positionListener);
  }

  void _positionListener() {
    final FlexibleSpaceBarSettings? settings =
        context.dependOnInheritedWidgetOfExactType<FlexibleSpaceBarSettings>();
    bool visible =
        settings == null || settings.currentExtent <= settings.minExtent;
    if (_visible != visible) {
      setState(() {
        _visible = visible;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _visible ?? false,
      child: widget.child,
    );
  }
}
