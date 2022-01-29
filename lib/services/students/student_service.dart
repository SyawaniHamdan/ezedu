//simpan data ke firestore
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ezedu/models/student.dart';

class StudentService {
  Future<Student> getStudent({String? id = ""}) async {
    var document =
        await FirebaseFirestore.instance.collection('students').doc(id).get();

    Student student = Student(
      id: id,
      name: document.get("name"),
      email: document.get("email"),
      phone: document.get("phone"),
      gender: document.get("gender"),
      address: document.get("address"),
      level: document.get("level"),
    );

    return student;
  }

  Future createStudent(Student student) async {
    CollectionReference students =
        FirebaseFirestore.instance.collection('students');

    students.doc(student.id).set({
      'id': student.id,
      'name': student.name,
      'email': student.email,
      'phone': student.phone,
      'gender': student.gender,
      'address': student.address,
      'level': student.level,
    });
  }

  Future updateStudent(Student student) async {
    CollectionReference students =
        FirebaseFirestore.instance.collection('students');

    students.doc(student.id).update({
      'name': student.name,
      'phone': student.phone,
      'gender': student.gender,
      'address': student.address,
      'level': student.level,
    });
  }
}