import 'package:flutter_request_bloc/flutter_request_bloc.dart';
import 'package:space_x/utils/index.dart';

import '../models/index.dart';
import '../repositories/index.dart';

/// Cubit that holds a list of launches.

class LaunchesCubit extends RequestCubit<LaunchRepository, List<List<Launch>>> {
  LaunchesCubit(LaunchRepository repository) : super(repository);

  @override
  Future<void> loadData() async {
    emit(RequestState.loading(state.value));
    try {
      final data = await repository.fetchData();
      emit(RequestState.loaded(data));
    } catch (e) {
      emit(RequestState.error(e.toString()));
    }
  }

  Launch getLaunch(String id){
    if(state.status ==RequestStatus.loaded){
      return LaunchUtils.getAllLaunches(state.value)
          .where((l) => l.id == id)
          .single;
    }else{
      return null;
    }
  }
}
