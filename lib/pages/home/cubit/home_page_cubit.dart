import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_manager/model/students_model.dart';
import 'package:student_manager/pages/home/cubit/home_page_state.dart';
import 'package:student_manager/service/students_service.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required this.studentService,
  }) : super(HomeInitial()) {
    emit(HomeInitial());
  }
  final IStudentService studentService;

  late final students;

  void studentEventController() async {
    try {
      emit(HomeLoading());
      students = await studentService.fetchStudents();
      emit(HomeLoaded(students));
    } catch (e, stack) {
      return print('${e.toString()}, stack: $stack' ' ERROR');
    }
  }
}
