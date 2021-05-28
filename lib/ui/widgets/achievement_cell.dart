import 'package:cherry_components/cherry_components.dart';
import 'package:flutter/material.dart';
import 'package:row_collection/row_collection.dart';

import '../../models/achievement.dart';
import '../../utils/index.dart';

class AchievementCell extends StatelessWidget {
  final Achievement achievement;
  final int index;

  const AchievementCell({Key key, this.achievement, this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DetailsCell(
          title: achievement.name,
          body: achievement.details,
          leading: (index + 1).toString(),
          onTap: achievement.hasLink
              ? () => context.openUrl(achievement.url)
              : null,
        ),
        Separator.divider(indent: 16),
      ],
    );
  }
}
