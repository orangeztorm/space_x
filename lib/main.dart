import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit()),
        BlocProvider(create: (_) => ImageQualityCubit()),
        BlocProvider(create: (_) => BrowserCubit()),
        BlocProvider(create: (_) => VehicleCubit(vehiclesRepository)),
        BlocProvider(create: (_) => LaunchesCubit(launchRepository)),
        BlocProvider(create: (_) => CompanyCubit(companyRepository)),
        BlocProvider(create: (_) => AchievementsCubit(achievementsRepository)),
        BlocProvider(create: (_) => ChangelogCubit(changelogRepository)),
      ],
      child: BlocConsumer(
        listener: (context, state) => null,
        builder: (context, state) => MaterialApp(
          title: 'SpaceX Go',
          theme: context.watch<ThemeCubit>().lightTheme,
          darkTheme: context.watch<ThemeCubit>().darkTheme,
          themeMode: context.watch<ThemeCubit>().themeMode,
          onGenerateRoute: Routes.generateRoute,
          onUnknownRoute: Routes.errorRoute,
          localizationsDelegates: [
            FlutterI18nDelegate(
              translationLoader: FileTranslationLoader(),
            )..load(null),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate
          ],
        ),
      )
    );
  }
}
