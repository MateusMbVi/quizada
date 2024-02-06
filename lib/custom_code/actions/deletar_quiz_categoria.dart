// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future deletarQuizCategoria(
  DocumentReference categorias,
  List<QuizRecord> quiz,
) async {
  CollectionReference quizCollection =
      FirebaseFirestore.instance.collection('quiz');

  List quizReferencias = [];

  for (var quiz in quiz) {
    if (quiz.categorias == categorias) {
      quizReferencias.add(quiz.reference.id);
    }
  }

  for (var referencia in quizReferencias) {
    quizCollection.doc(referencia).delete();
  }
}
