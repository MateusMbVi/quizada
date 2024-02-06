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

Future deletarPerguntas(List<PerguntasRecord> perguntas) async {
  CollectionReference colecao =
      FirebaseFirestore.instance.collection('perguntas');

  var ids = [];

  for (var pergunta in perguntas) {
    ids.add('pergunta.reference.id');
  }

  for (var referencia in ids) {
    colecao.doc(referencia).delete();
  }
}
