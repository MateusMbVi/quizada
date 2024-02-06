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

import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> atualizarTextoPergunta(
    List<PerguntasRecord> perguntas, String novoTextoPergunta) async {
  // Get a reference to the Firestore collection
  final collection = FirebaseFirestore.instance.collection('perguntas');

  // Loop through each PerguntasRecord object in the list
  for (final pergunta in perguntas) {
    // Get a reference to the document in the collection
    final document = collection.doc(pergunta.reference.id);

    // Update the 'texto_pergunta' field in the document with the new value
    await document.update({
      'texto_pergunta': novoTextoPergunta,
    });
  }
}
