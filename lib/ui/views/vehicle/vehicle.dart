import 'package:flutter/material.dart';
import 'package:space_x/cubits/index.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VehiclePage extends StatelessWidget {
  final String vehicleId;

  static const route = '/vehicle';

  const VehiclePage({Key key, this.vehicleId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (context.watch<VehicleCubit>().getVehicle(vehicleId).type){
      case 'rocket':
        return null;
      case 'capsule':
        return null;
      case 'ship':
        return null;
      case 'roadster':
        return null;
      default :
        return null;
    }
  }
}
