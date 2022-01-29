//simpan data ke firestore
import 'package:ezedu/models/subject.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TutorClass {
  Future<Subject> getTutor({String? id = ""}) async {
    var document =
        await FirebaseFirestore.instance.collection('subjects').doc(id).get();

    Subject subject = Subject(
      id: id,
      subjectName: document.get("subjectName"),
      subjectDesc: document.get("subjectDesc"),
      subjectPrice: document.get("subjectPrice"),
      subjectSlot: document.get("subjectSlot"),
    );

    return subject;
  }

  Future createTutor(Subject subject) async {
    CollectionReference tutors =
        FirebaseFirestore.instance.collection('subjects');

    tutors.doc(subject.id).set({
      'id': subject.id,
      'subjectName': subject.subjectName,
      'subjectDesc': subject.subjectDesc,
      'subjectPrice': subject.subjectPrice,
      'subjectSlot': subject.subjectSlot,
    });
  }

  Future updateTutor(Subject subject) async {
    CollectionReference tutors =
        FirebaseFirestore.instance.collection('subjects');

    tutors.doc(subject.id).set({
      'id': subject.id,
      'subjectName': subject.subjectName,
      'subjectDesc': subject.subjectDesc,
      'subjectPrice': subject.subjectPrice,
      'subjectSlot': subject.subjectSlot,
    });
  }
}
