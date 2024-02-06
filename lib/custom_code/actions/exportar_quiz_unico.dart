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
import 'dart:io';
import 'package:download/download.dart';
import 'package:path_provider/path_provider.dart';

Future<String?> exportarQuizUnico(QuizRecord quiz) async {
  // Add the company name and address as a header
  String tema = "tema";
  String descricao = "descricao";
  String imagem = "imagem";
  String jogadas = "jogadas";
  String favoritados = "favoritados";
  String header = "$tema,$descricao,$imagem,$jogadas,$favoritados,\n\n";
  String fileContent = header;

  // Add the quiz record to the file content
  fileContent += "\n" +
      quiz.tema.toString() +
      "," +
      quiz.descricao.toString() +
      "," +
      quiz.imagem.toString() +
      "," +
      quiz.jogadas.toString() +
      "," +
      quiz.favoritados.toString();

  final fileName = "Quiz_" + DateTime.now().toString() + ".csv";

  // Encode the string as a List<int> of UTF-8 bytes
  var bytes = utf8.encode(fileContent);

  // Get the device's download directory
  final directory = await getExternalStorageDirectory();
  final filePath = '${directory!.path}/$fileName';

  // Write the file to the device's download directory
  File(filePath).writeAsBytesSync(bytes);

  return filePath;
}
