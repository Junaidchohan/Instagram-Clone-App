import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram_clone_app/resources/storage_methods.dart';

class AuthMethods {
  // Firebase instances
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Sign Up User
  ///
  /// Takes email, password, username, bio, and profile image file.
  /// Returns 'success' if everything goes well, otherwise returns the error message.
  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String bio,
    required Uint8List file,
  }) async {
    String res = "Some error occurred";

    try {
      // Make sure all fields are filled
      if (email.isNotEmpty &&
          password.isNotEmpty &&
          username.isNotEmpty &&
          bio.isNotEmpty) {
        // 1. Register user in Firebase Authentication
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        print("User registered with UID: ${cred.user!.uid}");

        // 2. Upload profile picture to Firebase Storage
        String photoUrl = await StorageMethods().uploadImageToStorage(
          'profilePic',
          file,
          false,
        );

        // 3. Add user info to Firestore database
        await _firestore.collection("users").doc(cred.user!.uid).set({
          "username": username,
          "uid": cred.user!.uid,
          "email": email,
          "bio": bio,
          "followers": [],
          "following": [],
          "photoUrl": photoUrl,
        });

        res = "success";
      } else {
        res = "Please fill all the fields";
      }
    } catch (err) {
      // Catch Firebase errors like email already in use, weak password, etc.
      res = err.toString();
    }

    return res;
  }

  /// Log In User
  ///
  /// Takes email and password.
  /// Returns 'success' if login is successful, otherwise error message.
  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "Some error occurred";

    try {
      // Make sure both email and password are filled
      if (email.isNotEmpty && password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        res = "success";
      } else {
        res = "Please enter all fields";
      }
    } catch (err) {
      // Catch FirebaseAuth errors like wrong password, user not found, etc.
      res = err.toString();
    }

    return res;
  }
}
