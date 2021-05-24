import '../models/index.dart';

/// methods to perform task in the list launch
class LaunchUtils {
  /// Returns the most upcoming launch inside a list,
  /// if the list is sorted by date
  static Launch getUpcomingLaunch(List<List<Launch>> launches) {
    if (launches != null) {
      return launches[0].first;
    } else {
      return null;
    }
  }

  /// Returns the most latest launch inside a list,
  /// if the list is sorted by date
  static Launch getLatestLaunch(List<List<Launch>> launches) {
    if (launches != null) {
      return launches[1].first;
    } else {
      return null;
    }
  }

  /// Returns all the list combined into one list
  static List<Launch> getAllLaunches(List<List<Launch>> launches) {
    if (launches != null) {
      return List.from([...launches[0], ...launches[1]]);
    } else {
      return null;
    }
  }
}
