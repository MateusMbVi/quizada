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

import 'dart:convert' show utf8;
import 'package:download/download.dart';

Future exportPerguntasQuizAction(List<PerguntasRecord>? docs) async {
  docs = docs ?? [];

  // Add the company name and address as a header
  String texto_pergunta = "texto_pergunta";
  String alternativa_A = "alternativa_A";
  String alternativa_B = "alternativa_B";
  String alternativa_C = "alternativa_C";
  String alternativa_D = "alternativa_D";
  String alternativa_E = "alternativa_E";
  String alternativa_F = "alternativa_F";
  String correta = "correta";
  String imagem = "imagem";

  String header =
      "$texto_pergunta,$alternativa_A,$alternativa_B,$alternativa_C,$alternativa_D,$alternativa_E,$alternativa_F,$correta,$imagem,\n\n";

  String fileContent = header;

  docs.asMap().forEach((index, record) => fileContent += "\n" +
      record.textoPergunta.toString() +
      "," +
      record.alternativaA.toString() +
      "," +
      record.alternativaB.toString() +
      "," +
      record.alternativaC.toString() +
      "," +
      record.alternativaD.toString() +
      "," +
      record.alternativaE.toString() +
      "," +
      record.alternativaF.toString() +
      "," +
      record.correta.toString() +
      "," +
      record.imagem.toString());

  final fileName = "FF" + DateTime.now().toString() + ".csv";

  // Encode the string as a List<int> of UTF-8 bytes
  var bytes = utf8.encode(fileContent);

  final stream = Stream.fromIterable(bytes);
  return download(stream, fileName);
}
