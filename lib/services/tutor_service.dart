//simpan data ke firestore
import 'package:ezedu/models/tutor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TutorService {
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
    });
  }
}
