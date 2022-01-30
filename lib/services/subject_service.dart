//simpan data ke firestore
import 'package:ezedu/models/subject.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SubjectService {

  final CollectionReference _subjectRef =
      FirebaseFirestore.instance.collection('subjects');

  Future<Subject> getSubject({String? id = ""}) async {
    var document =
        await FirebaseFirestore.instance.collection('subjects').doc(id).get();

    Subject subject = Subject(
      id: document.id,
      subjectName: document.get("subjectName"),
      subjectDesc: document.get("subjectDesc"),
      subjectPrice: document.get("subjectPrice"),
      subjectSlot: document.get("subjectSlot"),
      tutorId: document.get("tutorId")
    );

    return subject;
  }


  Future<List<Subject>> getSubjectByTutorId(String tutorId) async {

    QuerySnapshot snapshots =
        await _subjectRef.where('tutorId', isEqualTo: tutorId).get();
     return snapshots.docs
        .map((snapshot) => Subject.fromSnapshot(snapshot))
        .toList();    
  }
  

  Future createSubject(Subject subject) async {

    _subjectRef.doc().set({
      'subjectName': subject.subjectName,
      'subjectDesc': subject.subjectDesc,
      'subjectPrice': subject.subjectPrice,
      'subjectSlot': subject.subjectSlot,
      'tutorId' : subject.tutorId
    });
  }

    Future deleteSubject(String id) async {
    await _subjectRef.doc(id).delete();
  }

}