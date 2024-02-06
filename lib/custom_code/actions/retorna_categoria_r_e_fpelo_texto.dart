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

Future<DocumentReference> retornaCategoriaREFpeloTexto(
  List<CategoriaRecord> categorias,
  String nome,
) async {
  var referencia;

  for (var categoria in categorias) {
    if (categoria.nome == nome) {
      referencia = categoria.reference;
    }
  }

  return referencia;
}
