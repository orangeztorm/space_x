import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quick_actions/quick_actions.dart';

import '../tabs/index.dart';

class StartScreen extends StatefulWidget {
  static const route = '/';

  const StartScreen({Key key}) : super(key: key);

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    try {
      // Reading app shortcuts input
      final QuickActions quickActions = QuickActions();
      quickActions.initialize((type) {
        switch (type) {
          case 'vehicles':
            setState(() => _currentIndex = 1);
            break;
          case 'upcoming':
            setState(() => _currentIndex = 2);
            break;
          case 'latest':
            setState(() => _currentIndex = 3);
            break;
          default:
            setState(() => _currentIndex = 0);
        }
      });

      Future.delayed(Duration.zero, () async{
        // Setting app shortcuts
        await quickActions.setShortcutItems(<ShortcutItem>[
          ShortcutItem(
            type: 'vehicles',
            localizedTitle: 'vehicle',
            icon: 'action_vehicle',
          ),
          ShortcutItem(
            type: 'upcoming',
            localizedTitle: 'upcoming',
            icon: 'action_upcoming',
          ),
          ShortcutItem(
            type: 'latest',
            localizedTitle: 'latest',
            icon: 'action_latest',
          ),
        ]);
      });
    } catch (_) {
      debugPrint('could set quick actions');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          HomeTab(),
          VehiclesTab(),
          LaunchesTab(),
          LaunchesTab(),
          CompanyTab(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (index) => _currentIndex != index
            ? setState(() => _currentIndex = index)
            : null,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/capsule.svg',
                  colorBlendMode: BlendMode.srcATop,
                  width: 24,
                  height: 24,
                  color: _currentIndex != 1
                      ? Theme.of(context).brightness == Brightness.light
                          ? Theme.of(context).textTheme.caption.color
                          : Colors.black26
                      : Theme.of(context).brightness == Brightness.light
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).accentColor),
              label: 'Vehicle'),
          BottomNavigationBarItem(
            label: 'Upcoming',
            icon: Icon(Icons.access_time),
          ),
          BottomNavigationBarItem(
            label: 'latest',
            icon: Icon(Icons.library_books),
          ),
          BottomNavigationBarItem(
            label: 'company',
            icon: Icon(Icons.location_city),
          ),
        ],
      ),
    );
  }
}
