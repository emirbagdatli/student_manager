import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';

import 'package:student_manager/model/students_model.dart';

abstract class IStudentService {
  Future<List<StudentsModel>?> fetchStudents();
  void deleteStudent(String id);
}

class StudentService implements IStudentService {
  late Dio dio;

  StudentService() {
    dio = Dio(BaseOptions(baseUrl: 'http://localhost:3000/api/v1/students/'));
  }
  @override
  Future<List<StudentsModel>?> fetchStudents() async {
    try {
      final response = await dio.get('http://localhost:3000/api/v1/students/');
      //  var body = jsonDecode(response.data);

      if (response.statusCode == HttpStatus.ok) {
        final datas = response.data;

        if (datas is List) {
          List<StudentsModel> studentList = datas.map((e) => StudentsModel.fromJson(e)).toList();
          return studentList;
        } else {
          return null;
        }
      }
    } catch (e) {
      return [];
    }
    return [];
  }

  @override
  void deleteStudent(String id) async {
    var response = await dio.delete('http://localhost:3000/api/v1/students/$id');
    print(response.statusCode);
  }
}
