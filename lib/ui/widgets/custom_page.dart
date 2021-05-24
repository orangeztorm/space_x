import 'package:flutter/material.dart';
import 'package:flutter_request_bloc/cubits/index.dart';
import 'package:google_fonts/google_fonts.dart';

import 'index.dart';

typedef RequestListBuilderLoaded<T> = List<Widget> Function(
    BuildContext context, RequestState<T> state, T value);

/// Basic screen with an app bar widget
/// used when pages doesn't have silvers or reloading.
class SimplePage extends StatelessWidget {
  final String title;
  final Widget body, fab;
  final List<Widget> actions;

  const SimplePage({Key key, this.title, this.body, this.fab, this.actions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title,
          style: GoogleFonts.rubik(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        actions: actions,
      ),
      body: body,
      floatingActionButton: fab,
    );
  }
}

/// Basic page which has reloading properties.
/// It uses the [SimplePage] widget inside it.
///
/// This page also has state control via a `RequestCubit` parameter.
