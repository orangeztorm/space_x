import 'package:flutter/material.dart';
import 'package:flutter_request_bloc/cubits/index.dart';
import 'package:flutter_request_bloc/widgets/request_builder.dart';
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
        title: Text(
          title,
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
class RequestSimplePage extends StatelessWidget {
  final String title;
  final Widget fab;
  final RequestWidgetBuilderLoaded childBuilder;
  final List<Widget> actions;

  const RequestSimplePage({
    Key key,
    @required this.title,
    @required this.childBuilder,
    this.fab,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: null,
      child: SimplePage(
        title: title,
        fab: fab,
        actions: actions,
        body: RequestBuilder(),
      ),
    );
  }
}

/// This page is similar to `SimplePage`, in regards that it doesn't control state.
/// It holds a `SliverAppBar` and a plethera of others slivers inside.
class SliverPage extends StatelessWidget {
  final String title;
  final Widget header;
  final List<Widget> children, actions;
  final Map<String, String> popupMenu;
  final ScrollController controller;

  const SliverPage({
    Key key,
    @required this.title,
    @required this.header,
    this.children,
    this.actions,
    this.popupMenu,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      key: PageStorageKey(title),
      controller: controller,
      slivers: [
        SliverBar(title: title, header: header, actions: [
          if (popupMenu != null)
              PopupMenuButton<String>(
                itemBuilder: (context) => [
                  for (final item in popupMenu.keys)
                    PopupMenuItem(
                      value: item,
                      child: Text(item),
                    )
                ],
                onSelected: (text) =>
                    Navigator.pushNamed(context, popupMenu[text]),
              ),
              if(actions!= null) ...actions
        ]),
        ...children
      ],
    );
  }
}

// Basic slivery page which has reloading properties.
/// It uses the [SliverPage] widget inside it.
///
/// This page also has state control via a `RequestCubit` parameter.
class RequestSliverPage extends StatelessWidget {
  final String title;
  final RequestWidgetBuilderLoaded headerBuilder;
  final RequestListBuilderLoaded childrenBuilder;
  final List<Widget> actions;
  final Map<String, String> popupMenu;
  final ScrollController controller;

  const RequestSliverPage({
    @required this.title,
    @required this.headerBuilder,
    @required this.childrenBuilder,
    this.controller,
    this.actions,
    this.popupMenu,
  });
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: (){},
      child: RequestBuilder(),
    );
  }
}

