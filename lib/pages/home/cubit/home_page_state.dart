import 'package:equatable/equatable.dart';
import 'package:student_manager/model/students_model.dart';

abstract class HomeState extends Equatable {}

class HomeInitial extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeLoading extends HomeState {
  @override
  //HomeLoading();
  List<Object?> get props => [];
}

class HomeStudentDelete extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeLoaded extends HomeState {
  HomeLoaded(
    this.students,
  );

  final List<StudentsModel>? students;
  @override
  List<Object?> get props => [
        students,
      ];

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is HomeLoaded && o.students == o.students;
  }

  @override
  int get hashCode => students.hashCode;
}
