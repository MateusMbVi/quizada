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

Future exportCSVQuizAction(List<QuizRecord>? docs) async {
  docs = docs ?? [];

  // Add the company name and address as a header
  String tema = "tema";
  String descricao = "descricao";

  String header = "$tema,$descricao,\n\n";

  String fileContent = header;

  docs.asMap().forEach((index, record) => fileContent +=
      "\n" + record.tema.toString() + "," + record.descricao.toString());

  final fileName = "FF" + DateTime.now().toString() + ".csv";

  // Encode the string as a List<int> of UTF-8 bytes
  var bytes = utf8.encode(fileContent);

  final stream = Stream.fromIterable(bytes);
  return download(stream, fileName);
}
