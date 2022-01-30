import 'package:cloud_firestore/cloud_firestore.dart';

class StudentSubject {
  String? id;
  String subjectId;
  String studentId;

  StudentSubject(
      {this.id = '',
      this.subjectId= '',
      this.studentId = '',
      });

  factory StudentSubject.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> json = snapshot.data() as Map<String, dynamic>;
    json['id'] = snapshot.id;
    return StudentSubject.fromJson(json);
  }
  
  StudentSubject.copy(from)
      : this(
            id: from.id,
            subjectId: from.subjectId,
            studentId: from.studentId,
            );

  StudentSubject.fromJson(Map<String, dynamic> json)
      : this(
            id: json['id'],
            subjectId: json['subjectId'],
            studentId: json['studentId'],
            );

  Map<String, dynamic> toJson() => {
        'id': id,
        'subjectId': subjectId,
        'studentId': studentId,
        
      };
}
