import 'package:cloud_firestore/cloud_firestore.dart';

class StudentSubject {
  String? id;
  String subjectId;
  String studentId;
  double price;
  String status;
  String date;

  StudentSubject(
      {this.id = '',
      this.subjectId = '',
      this.studentId = '',
      this.price = 0.00,
      this.status = '',
      this.date = ''});

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
            price: from.price,
            status: from.status,
            date: from.date);

  StudentSubject.fromJson(Map<String, dynamic> json)
      : this(
            id: json['id'],
            subjectId: json['subjectId'],
            studentId: json['studentId'],
            price: double.parse(json['price'].toString()),
            status: json['status'],
            date: json['date']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'subjectId': subjectId,
        'studentId': studentId,
        'price': price,
        'status': status,
        'date': date
      };
}
