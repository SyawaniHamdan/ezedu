import 'package:cloud_firestore/cloud_firestore.dart';

class Student {
  String? id;
  String name;
  String phone;
  String email;
  String address;
  String gender;
  String level;

  Student(
      {this.id = '',
      this.name = '',
      this.phone = '',
      this.email = '',
      this.address = '',
      this.gender = '',
      this.level = ''});

  factory Student.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> json = snapshot.data() as Map<String, dynamic>;
    json['id'] = snapshot.id;
    return Student.fromJson(json);
  }

  Student.copy(from)
      : this(
            id: from.id,
            name: from.name,
            phone: from.phone,
            email: from.email,
            address: from.address,
            gender: from.gender,
            level: from.level);

  Student.fromJson(Map<String, dynamic> json)
      : this(
            id: json['id'],
            name: json['name'],
            phone: json['phone'],
            email: json['email'],
            address: json['address'],
            gender: json['gender'],
            level: json['level']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'phone': phone,
        'email': email,
        'address': address,
        'gender': gender,
        'level': level
      };
}
