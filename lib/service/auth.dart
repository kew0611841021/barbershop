import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  Future<void> signInWithEmail(String email, String password) async {
    try {
      final user = FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print(e.code);
    } catch (e) {
      print(e);
    }
  }

  Future<void> addNewInfo(String name, String tel) async {
    final currentUser = FirebaseAuth.instance.currentUser;
    final uid = currentUser!.uid;

    // Store User infomation (name, tel) to FireStore
    FirebaseFirestore.instance.collection("Users").doc(uid).set({
      "name": name,
      "tel": tel,
    });
  }
}
