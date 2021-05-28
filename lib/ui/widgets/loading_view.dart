import 'package:flutter/material.dart';

/// Basic loading with a circular progress indocator at the center
class LoadingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: const CircularProgressIndicator(),
    );
  }
}

/// Places a `CircularProgressIndicator` widget in the middle of a slivered widget.
class LoadingSliverView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      child: LoadingView(),
    );
  }
}
