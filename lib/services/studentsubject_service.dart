//simpan data ke firestore
import 'package:ezedu/models/studentsubject.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StudentSubjectService {
  final CollectionReference _studentsubjectRef =
      FirebaseFirestore.instance.collection('studentsubjects');

  Future<StudentSubject> getStudentSubject({String? id = ""}) async {
    var document = await FirebaseFirestore.instance
        .collection('studentsubjects')
        .doc(id)
        .get();

    StudentSubject studentsubject = StudentSubject(
        id: document.id,
        subjectId: document.get("subjectId"),
        studentId: document.get("studentId"),
        price: document.get("price"),
        status: document.get("status"),
        date: document.get("date"));

    return studentsubject;
  }

  Future<List<StudentSubject>> getStudentSubjectByStudentId(
      String studentId) async {
    QuerySnapshot snapshots =
        await _studentsubjectRef.where('studentId', isEqualTo: studentId).get();
    return snapshots.docs
        .map((snapshot) => StudentSubject.fromSnapshot(snapshot))
        .toList();
  }

  Future<List<StudentSubject>> getStudentSubjectBySubjectId(
      String subjectId) async {
    QuerySnapshot snapshots =
        await _studentsubjectRef.where('subjectId', isEqualTo: subjectId).get();

    return snapshots.docs
        .map((snapshot) => StudentSubject.fromSnapshot(snapshot))
        .toList();
  }

  Future<List<StudentSubject>> getCompletedStudentSubjectBySubjectId(
      String subjectId) async {
    QuerySnapshot snapshots = await _studentsubjectRef
        .where('subjectId', isEqualTo: subjectId)
        .where('status', isEqualTo: "complete")
        .get();

    return snapshots.docs
        .map((snapshot) => StudentSubject.fromSnapshot(snapshot))
        .toList();
  }

  Future<List<StudentSubject>> getApprovedStudentSubjectBySubjectId(
      String subjectId) async {
    QuerySnapshot snapshots = await _studentsubjectRef
        .where('subjectId', isEqualTo: subjectId)
        .where('status', isEqualTo: "approve")
        .get();

    return snapshots.docs
        .map((snapshot) => StudentSubject.fromSnapshot(snapshot))
        .toList();
  }

  Future createStudentSubject(StudentSubject studentsubject) async {
    _studentsubjectRef.doc().set({
      'subjectId': studentsubject.subjectId,
      'studentId': studentsubject.studentId,
      'price': studentsubject.price,
      'status': studentsubject.status,
      'date': studentsubject.date
    });
  }

  Future studentApproval({String? id, String? status}) async {
    CollectionReference studentsubjects =
        FirebaseFirestore.instance.collection('studentsubjects');

    studentsubjects.doc(id).update({
      'status': status,
    });
  }

  Future deleteSubject(String id) async {
    await _studentsubjectRef.doc(id).delete();
  }
}
