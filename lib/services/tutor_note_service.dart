//simpan data ke firestore
import 'package:ezedu/models/note.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ezedu/models/subject.dart';

class NoteService {
  final CollectionReference _noteRef =
      FirebaseFirestore.instance.collection('notes');

  Future<Notes> getNotes({String? id = ""}) async {
    var document =
        await FirebaseFirestore.instance.collection('notes').doc(id).get();

    Notes note = Notes(
      id: document.id,
      noteDetail: document.get("noteDetail"),
      subjectId: document.get("subjectId"),
      tutorId: document.get("tutorId"),
    );
    return note;
  }

  Future<List<Notes>> getNotesAll() async {
    QuerySnapshot snapshots = await _noteRef.get();
    return snapshots.docs
        .map((snapshot) => Notes.fromSnapshot(snapshot))
        .toList();
  }

  Future<List<Notes>> getNotebyTutorId(String tutorId) async {
    QuerySnapshot snapshots =
        await _noteRef.where('tutorId', isEqualTo: tutorId).get();
    return snapshots.docs
        .map((snapshot) => Notes.fromSnapshot(snapshot))
        .toList();
  }

/*rerturn subject lsit if the id is same as the one in note
  Future<List<Notes>> getSubjectListBySubjectId(String subjectId) async {
    QuerySnapshot snapshots =
        await _noteRef.where('subjectId', isEqualTo: subjectId).get();
    return snapshots.docs
        .map((snapshot) => Notes.fromSnapshot(snapshot))
        .toList();
  }*/

  Future createNote(Notes subject) async {
    _noteRef.doc().set({
      'subjectName': subject.noteDetail,
      'subjectDesc': subject.subjectId,
      'tutorId': subject.tutorId,
    });
  }

  Future deleteNote(String id) async {
    await _noteRef.doc(id).delete();
  }
}
