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

  Future updateNote(Notes note) async {
    CollectionReference notes = FirebaseFirestore.instance.collection('notes');

    notes.doc(note.id).update({
      'noteDetail': note.noteDetail,
      'subjectId': note.subjectId,
      'tutorId': note.tutorId,
    });
  }

  Future createNote(Notes note) async {
    _noteRef.doc().set({
      'noteDetail': note.noteDetail,
      'subjectId': note.subjectId,
      'tutorId': note.tutorId,
    });
  }

  Future deleteNote(String id) async {
    await _noteRef.doc(id).delete();
  }
}
