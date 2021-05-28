import 'package:big_tip/big_tip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_request_bloc/flutter_request_bloc.dart';
import 'package:search_page/search_page.dart';

import '../../../cubits/index.dart';
import '../../../models/index.dart';
import '../../../utils/index.dart';
import '../../widgets/index.dart';

/// This tab holds information about all kind of SpaceX's vehicles,
/// such as rockets, capsules, Tesla Roadster & ships.
class VehiclesTab extends StatelessWidget {
  const VehiclesTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RequestSliverPage<VehicleCubit, List<Vehicle>>(
        title: context.translate('spacex.vehicle.title'),
        headerBuilder: (context, state, value) {
          final photos = [
            for(final vehicle in value) vehicle.getRandomPhoto()
          ];
          return SwiperHeader(list: photos.sublist(0,4),);
        },
        popupMenu: Menu.home,
        childrenBuilder: (context, state, value) => [
          SliverList(delegate: SliverChildBuilderDelegate(
              (context, index) => VehicleCell(vehicle: value[index],),
            childCount: value.length
          ))
        ],
      ),
    );
  }
}
