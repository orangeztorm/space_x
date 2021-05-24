import 'package:flutter_request_bloc/flutter_request_bloc.dart';

import '../models/index.dart';
import '../services/index.dart';
/// Handles retrieve and transformation of [Launch] from the API, both past & future ones.
class LaunchRepository extends BaseRepository<LaunchesService, List<List<Launch>>>