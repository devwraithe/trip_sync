import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class Constants {
  // String
  static String fontFamily = "Neue";
  static String socketError = "No Internet Connection";
  static String unknownError = "Something went wrong";
  static String timeoutError = "Timeout";

  static double hrPadding = 20;
  static double vrPadding = 34;
  static double tripImgWidth = double.infinity;
  static double tripImgHeight = 380;

  static double radius = 8; // buttons and fields

  static Radius tripImageRadius = const Radius.circular(18);

  static EdgeInsets screenPadding = EdgeInsets.symmetric(
    horizontal: hrPadding,
    vertical: vrPadding,
  );

  // Firebase
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  static FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  static FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  static User? user = firebaseAuth.currentUser;

  // Other
  static AutovalidateMode validateMode = AutovalidateMode.onUserInteraction;
}
