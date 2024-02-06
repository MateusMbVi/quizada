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
import 'package:file_picker/file_picker.dart';
import 'dart:io';

Future<String?> exportSimpleQuizAction(QuizRecord quiz, String nomeQuiz) async {
  // Add the company name and address as a header
  String tema = "tema";
  String descricao = "descricao";
  String header = "$tema,$descricao,\n\n";
  String fileContent = header;

  // Add the quiz record to the file content
  fileContent += "\n" + quiz.tema.toString() + "," + quiz.descricao.toString();

  final fileName = nomeQuiz + ".csv";

  // Use file_picker to let the user choose the download location
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: ['csv'],
  );

  if (result != null && result.files.isNotEmpty) {
    // Get the path chosen by the user
    String filePath = result.files.first.path!;

    // Write the file to the chosen location
    File(filePath).writeAsBytesSync(utf8.encode(fileContent));

    return filePath;
  }

  return null; // Return null if the user cancels the file picker
}
