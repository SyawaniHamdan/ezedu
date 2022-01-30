import 'package:cloud_firestore/cloud_firestore.dart';

class Subject {
  String? id;
  String subjectName;
  String subjectDesc;
  double subjectPrice;
  String subjectSlot;
  String tutorId;

  Subject(
      {this.id = '',
      this.subjectName = '',
      this.subjectDesc = '',
      this.subjectPrice = 0.00,
      this.subjectSlot = '',
      this.tutorId = ''
      });

  factory Subject.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> json = snapshot.data() as Map<String, dynamic>;
    json['id'] = snapshot.id;
    return Subject.fromJson(json);
  }
  
  Subject.copy(from)
      : this(
            id: from.id,
            subjectName: from.subjectName,
            subjectDesc: from.subjectDesc,
            subjectPrice: from.subjectPrice,
            subjectSlot: from.subjectSlot,
            tutorId: from.tutorId
            );

  Subject.fromJson(Map<String, dynamic> json)
      : this(
            id: json['id'],
            subjectName: json['subjectName'],
            subjectDesc: json['subjectDesc'],
            subjectPrice: json['subjectPrice'],
            subjectSlot: json['subjectSlot'],
            tutorId: json['tutorId']
            );

  Map<String, dynamic> toJson() => {
        'id': id,
        'subjectName': subjectName,
        'subjectDesc': subjectDesc,
        'subjectPrice': subjectPrice,
        'subjectSlot': subjectSlot,
        'tutorId': tutorId
        
      };
}
