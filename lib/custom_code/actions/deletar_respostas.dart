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

Future deletarRespostas(
  DocumentReference quiz,
  DocumentReference usuario,
  List<RespostasRecord> respostas,
) async {
  CollectionReference respostasCollection =
      FirebaseFirestore.instance.collection('respostas');

  List respostasReferencias = [];

  for (var resposta in respostas) {
    if (resposta.quiz == quiz && resposta.usuario == usuario) {
      respostasReferencias.add(resposta.reference.id);
    }
  }

  for (var referencia in respostasReferencias) {
    respostasCollection.doc(referencia).delete();
  }
}
