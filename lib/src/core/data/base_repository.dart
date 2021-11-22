import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// Every repository should be inherited from this
class BaseRepository {
  var firestoreUserData = FirebaseFirestore.instance.collection('userData');
  var firestoreTaskData = FirebaseFirestore.instance.collection('taskData');
  var firebase = FirebaseAuth.instance;
  String uid = FirebaseAuth.instance.currentUser!.uid;
}
