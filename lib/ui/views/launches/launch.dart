import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:cherry_components/cherry_components.dart';
import 'package:expand_widget/expand_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:row_collection/row_collection.dart';
import 'package:row_item/row_item.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sliver_fab/sliver_fab.dart';

import '../../../cubits/index.dart';
import '../../../models/index.dart';
import '../../../utils/index.dart';
import '../../widgets/index.dart';
import 'index.dart';


/// This view displays all information about a specific launch.
class LaunchPage extends StatelessWidget {

  final String id;

  const LaunchPage(this.id);

  static const route = '/launch';

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
