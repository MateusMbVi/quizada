import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAh_DBgrOcYLPaL0r5OYlESZQ0fUsYzT24",
            authDomain: "quiz-8294c.firebaseapp.com",
            projectId: "quiz-8294c",
            storageBucket: "quiz-8294c.appspot.com",
            messagingSenderId: "1026959416702",
            appId: "1:1026959416702:web:4388c3a978d462608aa72f",
            measurementId: "G-Q88RKFL246"));
  } else {
    await Firebase.initializeApp();
  }
}
