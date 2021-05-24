import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StartScreen extends StatefulWidget {
  static const route = '/';

  const StartScreen({Key key}) : super(key: key);

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  int _currentIndex = 0;

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
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: 'spacex.vehicle.icon'),
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
              label: 'spacex.vehicle.icon'),
          BottomNavigationBarItem(
            label: 'spacex.upcoming.icon',
            icon: Icon(Icons.access_time),
          ),
          BottomNavigationBarItem(
            label: 'spacex.latest.icon',
            icon: Icon(Icons.library_books),
          ),
          BottomNavigationBarItem(
            label: 'spacex.company.icon',
            icon: Icon(Icons.location_city),
          ),
        ],
      ),
    );
  }
}
