// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class InfoGet {
//   final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
//   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

//   Future intro(String intro, String country, String state,String city, ) async {
//     try {
//       final currentUserId = _firebaseAuth.currentUser!.uid;

//       _firebaseFirestore.collection('users').add({
//         'intro': intro,
//         'userId':currentUserId,
//         'country': country,
//         'state': state,
//         'city': city,
//       });
//     } on FirebaseAuthException catch (e) {
//       throw Exception(e.code);
//     }
//   }
// }
