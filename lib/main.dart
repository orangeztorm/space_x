import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:space_x/ui/views/general/index.dart';
import 'package:path_provider/path_provider.dart';

import 'cubits/index.dart';
import 'repositories/index.dart';
import 'services/index.dart';
import 'utils/index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: kIsWeb
          ? HydratedStorage.webStorageDirectory
          : await getTemporaryDirectory());
  Bloc.observer = CherryBlocObserver();

  final httpClient = Dio();
  runApp(MyApp(
    vehiclesRepository: VehiclesRepository(VehiclesService(httpClient)),
    launchRepository: LaunchRepository(LaunchesService(httpClient)),
    achievementsRepository:
        AchievementsRepository(AchievementsService(httpClient)),
    changelogRepository: ChangelogRepository(ChangelogService(httpClient)),
    companyRepository: CompanyRepository(CompanyService(httpClient)),
  ));
}

class MyApp extends StatelessWidget {
  final VehiclesRepository vehiclesRepository;
  final LaunchRepository launchRepository;
  final AchievementsRepository achievementsRepository;
  final CompanyRepository companyRepository;
  final ChangelogRepository changelogRepository;

  // This widget is the root of your application.

  const MyApp({
    Key key,
    this.vehiclesRepository,
    this.launchRepository,
    this.achievementsRepository,
    this.companyRepository,
    this.changelogRepository,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SpaceX Go',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StartScreen(),
    );
  }
}
