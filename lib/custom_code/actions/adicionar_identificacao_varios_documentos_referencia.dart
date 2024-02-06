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

Future<void> adicionarIdentificacaoVariosDocumentosReferencia(
    List<DocumentReference> referenciasPerguntas, String novoDado) async {
  // Get a reference to the Firestore collection
  final collection = FirebaseFirestore.instance.collection('perguntas');

  // Loop through each DocumentReference in the list
  for (final referencia in referenciasPerguntas) {
    // Get a reference to the document using the provided DocumentReference
    final document = collection.doc(referencia.id);

    // Get the current 'identificacao' list from the document
    DocumentSnapshot perguntaSnapshot = await document.get();
    List<String>? currentIdentificacao =
        (perguntaSnapshot.data() as Map<String, dynamic>?)?['identificacao']
            ?.cast<String>();

    // Ensure that currentIdentificacao is not null before calling 'add'
    if (currentIdentificacao != null) {
      // Add the new String to the 'identificacao' list
      currentIdentificacao.add(novoDado);

      // Update the 'identificacao' field in the document with the new list
      await document.update({
        'identificacao': novoDado,
      });
    }
  }
}
