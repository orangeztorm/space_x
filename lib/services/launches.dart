import 'package:dio/dio.dart';
import 'package:flutter_request_bloc/flutter_request_bloc.dart';

import '../utils/index.dart';

/// Services that retrieve information about spaceX launches
class LaunchesService extends BaseService<Dio> {
  const LaunchesService(Dio client) : super(client);

  Future<Response> getLaunches() async {
    return client.post(Url.launches, data: ApiQuery.launch);
  }
}
