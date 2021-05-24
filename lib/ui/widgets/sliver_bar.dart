import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Custom sliver app bar used in Sliver views.
/// It collapses when user scrolls down.

class SliverBar extends StatelessWidget {
  static const double heightRatio = 0.3;

  final String title;
  final Widget header;
  final num height;
  final List<Widget> actions;

  const SliverBar({Key key, this.title, this.header, this.height, this.actions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: MediaQuery.of(context).size.height * height,
      actions: actions,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.5,
          ),
          child: Text(
            title,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            maxLines: 1,
            style: GoogleFonts.rubik(
              fontWeight: FontWeight.w600,
              shadows: <Shadow>[
                Shadow(
                  color: Theme.of(context).primaryColor,
                  offset: Offset(0, 0),
                  blurRadius: 4,
                ),
              ],
            ),
          ),
        ),
        background: header,
      ),
    );
  }
}
