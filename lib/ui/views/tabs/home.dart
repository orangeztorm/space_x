import 'package:flutter/material.dart';


import '../../widgets/index.dart';

/// This tab holds main information about the next launch.
/// It has a countdown widget.
class HomeTab extends StatefulWidget {
  const HomeTab({Key key}) : super(key: key);

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  ScrollController _controller;
  double _offset = 0.0;


  @override
  void initState() {
    super.initState();
    _controller = ScrollController()
    ..addListener(() => setState(() => _offset = _controller.offset));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
