import 'package:allinone/model/student_model.dart';
import 'package:allinone/state/student_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class StudentCubit extends Cubit<StudentState> {
  StudentCubit() : super(StudentState.initial());

  void addStudent(StudentModel student) {
    emit(state.copyWith(isLoading: true));

    Future.delayed(Duration(seconds: 1), () {
      final updatedList = List<StudentModel>.from(state.lstStudents)
        ..add(student);
      emit(state.copyWith(lstStudents: updatedList, isLoading: false));
    });
  }

  void deleteStudent(int index) {
    emit(state.copyWith(isLoading: true));
    // wait for 1 second
    Future.delayed(Duration(seconds: 1), () {
      final updatedList = List<StudentModel>.from(state.lstStudents)
        ..removeAt(index);
      emit(
        state.copyWith(
          lstStudents: updatedList,
          isLoading: false,
        ),
      );
    });
  }
}
