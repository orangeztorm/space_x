import 'package:flutter/material.dart';
import 'package:space_x/ui/views/general/index.dart';


import '../utils/index.dart';

/// Class that holds both route names & generate methods.
/// Used by the Flutter routing system
class Routes{
  /// Methods that generate all routes
  static Route<dynamic> generateRoute(RouteSettings routeSettings){
    try{
      switch (routeSettings.name){
        case StartScreen.route:
          return MaterialPageRoute(
            settings: routeSettings,
            builder: (_) => StartScreen(),
          );
        default:
          return errorRoute(routeSettings);
      }
    }catch(_){
      return errorRoute(routeSettings);
    }
  }

  static Route<dynamic> errorRoute(RouteSettings routeSettings){
    return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => ErrorScreen());
  }
}