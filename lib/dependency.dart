import 'package:get_it/get_it.dart';
import 'package:munch_app/services/data_service.dart';

GetIt service = GetIt.instance;

void init() {
  service.registerLazySingleton(
    () => DataService(),
  );
}
