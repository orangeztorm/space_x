import 'package:hydrated_bloc/hydrated_bloc.dart';

enum BrowserType { inApp, system }

class BrowserCubit extends HydratedCubit<BrowserType> {

  static const defaultBrowser = BrowserType.inApp;

  BrowserCubit() : super(defaultBrowser);

  @override
  BrowserType fromJson(Map<String, dynamic> json) {
    return BrowserType.values[json['value']];
  }

  @override
  Map<String, dynamic> toJson(BrowserType state) {
    return{
      'value': state.index
    };
  }

  BrowserType get browserType => state;

  set browserType(BrowserType browserType) => emit(browserType);
}