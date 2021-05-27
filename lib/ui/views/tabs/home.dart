import 'package:flutter/material.dart';

import '../../../cubits/index.dart';
import '../../widgets/index.dart';
import '../../../models/index.dart';
import '../../../utils/index.dart';

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
    return RequestSliverPage<LaunchesCubit, List<List<Launch>>>(
      controller: _controller,
      title: context.translate('spacex.home.title'),
      popupMenu: Menu.home,
      headerBuilder: (context, state, value) => _HeaderView(
          launch: LaunchUtils.getUpcomingLaunch(value), offset: _offset),
      childrenBuilder: (context, state, value) => <Widget>[
        SliverToBoxAdapter(
          child: _HomeView(
            LaunchUtils.getUpcomingLaunch(value),
          ),
        )
      ],
    );
  }
}

class _HeaderView extends StatelessWidget {
  final Launch launch;
  final double offset;

  const _HeaderView({Key key, this.launch, this.offset}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _sliverHeight =
        MediaQuery.of(context).size.height * SliverBar.heightRatio;
    final _isNotLandScape =
        MediaQuery.of(context).orientation != Orientation.landscape;
    return Stack(
      alignment: Alignment.center,
      children: [
        Opacity(
            opacity: launch.isDateTooTentative && _isNotLandScape ? 1.0 : 0.64,
        child: SwiperHeader(),
        ),
      ],
    );
  }
}
