//simpan data ke firestore
import 'package:ezedu/models/tutor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TutorService {
  final CollectionReference _tutorRef =
      FirebaseFirestore.instance.collection('tutors');

  Future<Tutor> getTutor({String? id = ""}) async {
    var document =
        await FirebaseFirestore.instance.collection('tutors').doc(id).get();

    Tutor tutor = Tutor(
      id: document.id,
      name: document.get("name"),
      email: document.get("email"),
      phone: document.get("phone"),
      gender: document.get("gender"),
      address: document.get("address"),
      proPictuce: document.get("proPictuce"),
      qualification: document.get("qualification"),
      about: document.get("about"),
    );

    return tutor;
  }

  Future<List<Tutor>> getTutors() async {
    QuerySnapshot snapshots = await _tutorRef.get();
    return snapshots.docs
        .map((snapshot) => Tutor.fromSnapshot(snapshot))
        .toList();
  }

  Future createTutor(Tutor tutor) async {
    CollectionReference tutors =
        FirebaseFirestore.instance.collection('tutors');

    tutors.doc(tutor.id).set({
      'id': tutor.id,
      'name': tutor.name,
      'email': tutor.email,
      'phone': tutor.phone,
      'gender': tutor.gender,
      'address': tutor.address,
      'proPictuce': "",
      'qualification': "",
      'about': "",
    });
  }

  Future updateTutor(Tutor tutor) async {
    CollectionReference tutors =
        FirebaseFirestore.instance.collection('tutors');

    tutors.doc(tutor.id).update({
      'name': tutor.name,
      'phone': tutor.phone,
      'gender': tutor.gender,
      'address': tutor.address,
      'qualification': tutor.qualification,
      'about': tutor.about,
    });
  }
}
