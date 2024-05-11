import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:student_manager/injection.dart';
import 'package:student_manager/model/students_model.dart';
import 'package:student_manager/pages/home/cubit/home_page_cubit.dart';
import 'package:student_manager/pages/home/cubit/home_page_state.dart';
import 'package:student_manager/service/students_service.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Manager'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: context.padding.low,
          child: BlocProvider<HomeCubit>(
            create: (context) => HomeCubit(
              studentService: locator<IStudentService>(),
            )..studentEventController(),
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state is HomeInitial) {}
                if (state is HomeStudentDelete) {}
                if (state is HomeLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is HomeLoaded) {
                  var students = state.students;
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(onPressed: () {}, child: const Text('Add New Student')),
                      ElevatedButton(onPressed: () {}, child: const Text('Remove Student')),
                      ElevatedButton(onPressed: () {}, child: const Text('Update Student')),
                      Row(
                        children: [
                          Text(
                            'Students',
                            style: context.general.textTheme.titleLarge,
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.refresh),
                          ),
                        ],
                      ),
                      Flexible(
                        // Use Flexible instead of Expanded
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: students?.length ?? 0,
                          itemBuilder: (context, index) {
                            return ListTile(
                                title: Text(students?[index].name ?? ''),
                                trailing: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.cancel),
                                ),
                                subtitle: Text(students?[index].email ?? ''),
                                leading: Text(
                                  students?[index].age.toString() ?? '',
                                ));
                          },
                        ),
                      )
                    ],
                  );
                } else {
                  return Center(child: const Text('Something happened'));
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
