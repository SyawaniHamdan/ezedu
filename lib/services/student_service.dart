//simpan data ke firestore
import 'package:ezedu/models/student.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StudentService {
  Future<Student> getTutor({String? id = ""}) async {
    var document =
        await FirebaseFirestore.instance.collection('students').doc(id).get();

    Student student = Student(
      id: id,
      name: document.get("name"),
      email: document.get("email"),
      phone: document.get("phone"),
      gender: document.get("gender"),
      address: document.get("address"),
    );

    return student;
  }

  Future createTutor(Student student) async {
    CollectionReference tutors =
        FirebaseFirestore.instance.collection('students');

    tutors.doc(student.id).set({
      'id': student.id,
      'name': student.name,
      'email': student.email,
      'phone': student.phone,
      'gender': student.gender,
      'address': student.address,
    });
  }

  Future updateTutor(Student student) async {
    CollectionReference tutors =
        FirebaseFirestore.instance.collection('students');

    tutors.doc(student.id).update({
      'name': student.name,
      'phone': student.phone,
      'gender': student.gender,
      'address': student.address,
    });
  }
}
