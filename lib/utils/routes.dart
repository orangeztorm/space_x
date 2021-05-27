import 'package:flutter/material.dart';

import '../utils/index.dart';
import '../ui/views/general/index.dart';

/// Class that holds both route names & generate methods.
/// Used by the Flutter routing system
class Routes {
  /// Methods that generate all routes
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    try {
      switch (routeSettings.name) {
        case StartScreen.route:
          return MaterialPageRoute(
            settings: routeSettings,
            builder: (_) => StartScreen(),
          );
        case AboutScreen.route:
          return MaterialPageRoute(
            settings: routeSettings,
            builder: (_) => AboutScreen(),
          );
        case SettingsScreen.route:
          return MaterialPageRoute(
            settings: routeSettings,
            builder: (_) => SettingsScreen(),
          );
        default:
          return errorRoute(routeSettings);
      }
    } catch (_) {
      return errorRoute(routeSettings);
    }
  }

  static Route<dynamic> errorRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
        settings: routeSettings, builder: (_) => ErrorScreen());
  }
}
