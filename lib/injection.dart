import 'package:get_it/get_it.dart';
import 'package:student_manager/service/students_service.dart';

final locator = GetIt.instance;

Future<void> init() async {
  locator.registerLazySingleton<IStudentService>(() => StudentService());
}
