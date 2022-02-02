import 'package:cloud_firestore/cloud_firestore.dart';

class Notes {
  String? id;
  String noteDetail;
  String subjectId;
  String tutorId;

  Notes(
      {this.id = '',
      this.noteDetail = '',
      this.subjectId = '',
      this.tutorId = ''});

  factory Notes.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> json = snapshot.data() as Map<String, dynamic>;
    json['id'] = snapshot.id;
    return Notes.fromJson(json);
  }

  Notes.copy(from)
      : this(
          id: from.id,
          noteDetail: from.noteDetail,
          subjectId: from.subjectId,
          tutorId: from.tutorId,
        );

  Notes.fromJson(Map<String, dynamic> json)
      : this(
            id: json['id'],
            noteDetail: json['noteDetail'],
            subjectId: json['subjectId'],
            tutorId: json['tutorId']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'noteDetail': noteDetail,
        'subjectId': subjectId,
        'tutorId': tutorId
      };
}
