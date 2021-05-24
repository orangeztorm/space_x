import 'package:flutter_request_bloc/flutter_request_bloc.dart';
import 'package:space_x/models/index.dart';
import 'package:space_x/services/index.dart';

class AchievementsRepository
    extends BaseRepository<AchievementsService, List<Achievement>> {
  AchievementsRepository(AchievementsService service) : super(service);

  @override
  Future<List<Achievement>> fetchData() async {
    final response = await service.getAchievements();
    return [for(final item in response.data) Achievement.fromJson(item)];
  }
}
