//simpan data ke firestore
import 'package:ezedu/models/subject.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TutorClassService {

  Future<Subject> getClass({String? id = ""}) async {
    var document =
        await FirebaseFirestore.instance.collection('subjects').doc(id).get();

    Subject subject = Subject(
      id: id,
      subjectName: document.get("subjectName"),
      subjectDesc: document.get("subjectDesc"),
      subjectPrice: document.get("subjectPrice"),
      subjectSlot: document.get("subjectSlot"),
      tutorId: document.get("tutorId")
    );

    return subject;
  }

  Future createClass(Subject subject) async {
    CollectionReference colClass =
        FirebaseFirestore.instance.collection('subjects');

    colClass.doc(subject.id).set({
      'id': subject.id,
      'subjectName': subject.subjectName,
      'subjectDesc': subject.subjectDesc,
      'subjectPrice': subject.subjectPrice,
      'subjectSlot': subject.subjectSlot,
      'tutorId' : subject.tutorId
    });
  }
}
