
import 'package:ezedu/app/locator.dart';
import 'package:ezedu/models/student.dart';
import 'package:ezedu/screens/viewmodel.dart';
import 'package:ezedu/services/students/student_service.dart';

class StudentTabViewModel extends ViewModel{
   final StudentService _studentService = locator<StudentService>();

  Future<Student> getStudent({String? id = ""}) async {
    setBusy(true);

    Student student = await _studentService.getStudent(id: id);

    setBusy(false);

    return student;
  }
}