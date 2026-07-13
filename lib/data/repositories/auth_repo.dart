import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/auth_model.dart';
import '../models/user_model.dart';

class AuthRepo {
  final FirebaseAuth instance = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> login({required AuthModel model}) async {
    await instance.signInWithEmailAndPassword(
      email: model.email,
      password: model.password,
    );
  }

  Future<void> register({
    required AuthModel model,
    required String phone,
    required String city,
    required String address,
  }) async {
    // Create account
    UserCredential credential =
        await instance.createUserWithEmailAndPassword(
      email: model.email,
      password: model.password,
    );

    String uid = credential.user!.uid;

    // Save user profile in Firestore
    UserModel user = UserModel(
      uid: uid,
      email: model.email,
      phone: phone,
      city: city,
      address: address,
    );

    await firestore.collection("users").doc(uid).set(user.toMap());
  }
}
