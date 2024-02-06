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

Future exportSimpleQuizFunciona(QuizRecord quiz) async {
  // quiz = quiz ??
  // QuizRecord(); // Replace QuizRecord() with your default constructor or default values

  // Add the company name and address as a header
  String tema = "tema";
  String descricao = "descricao";
  String header = "$tema,$descricao,\n\n";
  String fileContent = header;

  // Add the quiz record to the file content
  fileContent += "\n" + quiz.tema.toString() + "," + quiz.descricao.toString();

  final fileName = "Quiz_" + DateTime.now().toString() + ".csv";

  // Encode the string as a List<int> of UTF-8 bytes
  var bytes = utf8.encode(fileContent);

  final stream = Stream.fromIterable(bytes);
  return download(stream, fileName);
}
