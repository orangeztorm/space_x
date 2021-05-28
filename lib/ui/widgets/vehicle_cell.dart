
import 'package:cherry_components/cherry_components.dart';
import 'package:flutter/material.dart';
import 'package:row_collection/row_collection.dart';
import 'package:space_x/models/index.dart';
import 'package:space_x/ui/views/vehicle/index.dart';
import 'package:space_x/ui/widgets/index.dart';

class VehicleCell extends StatelessWidget {

  final Vehicle vehicle;

  const VehicleCell({Key key, this.vehicle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListCell(
          leading: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            child: ProfileImage.small(vehicle.getProfilePhoto),
          ),
          title: vehicle.name,
          subtitle: vehicle.subtitle(context),
          onTap: () => Navigator.pushNamed(
            context,
            VehiclePage.route,
            arguments: {'id': vehicle.id},
          ),
        ),
        Separator.divider(indent: 72)
      ],
    );
  }
}
