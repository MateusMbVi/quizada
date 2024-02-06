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

import 'dart:convert';
import 'package:csv/csv.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

Future<void> importFromCsvOrJson(
  BuildContext context,
  String? divider,
  DocumentReference usuarioRef,
) async {
  // null safety check
  divider = divider ?? ',';

  // Get a reference to the Firestore database
  final firestore = FirebaseFirestore.instance;

  // Get a reference to the storage
  final storage = FirebaseStorage.instance;

  // Get the current user
  final User? user = FirebaseAuth.instance.currentUser;

  if (user == null) {
    print("No user is currently signed in.");
    return;
  }

  final quizRef = firestore
      .collection('Quiz')
      .doc(); // Create a new document reference for the quiz

  // TODO: Add your logic to upload image to Firebase Storage if needed
  // Example: await uploadImageToStorage(selectedFile);

  final selectedFile = await selectFile(allowedExtensions: ['csv', 'json']);

  if (selectedFile != null) {
    showUploadMessage(
      context,
      'Carregando arquivo...',
      showLoading: true,
    );

    final fileString = utf8.decode(selectedFile.files.single.bytes!);

    List<List<dynamic>> rows = [];
    String fileType = 'csv';

    // if file is json
    if (selectedFile.files.single.extension!.toLowerCase() == 'json') {
      fileType = 'json';
      List<dynamic> decodedData = jsonDecode(fileString);

      if (decodedData is List<List<dynamic>>) {
        rows = decodedData;
      } else {
        print("Formato inválido.");
        return;
      }
    } else {
      rows = CsvToListConverter(fieldDelimiter: divider).convert(fileString);

      // Skip the header row
      rows.removeAt(0);
    }

    for (var row in rows) {
      // Extract data from the row
      String textoPergunta = row[0].toString();
      String alternativaA = row[1].toString();
      String alternativaB = row[2].toString();
      String alternativaC = row[3].toString();
      String alternativaD = row[4].toString();
      String correta = row[5].toString();

      // Create a new document in the "Perguntas" collection
      final perguntasRef = firestore.collection('Perguntas').doc();
      await perguntasRef.set({
        'texto_pergunta': textoPergunta,
        'alternativa_A': alternativaA,
        'alternativa_B': alternativaB,
        'alternativa_C': alternativaC,
        'alternativa_D': alternativaD,
        'correta': correta,
        'quiz': quizRef,
      });
    }

    // Create a new document in the "Quiz" collection
    await quizRef.set({
      'descricao': 'descricao',
      'imagem': 'imagem', // Update with actual image URL or handle image upload
      'usuario': usuarioRef,
      'tema': 'tema',
    });

    showUploadMessage(
      context,
      'Successo!',
    );
  }
}

Future<FilePickerResult?> selectFile({List<String>? allowedExtensions}) async {
  return await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: allowedExtensions,
  );
}

void showUploadMessage(BuildContext context, String message,
    {bool showLoading = false}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        children: [
          if (showLoading) CircularProgressIndicator(),
          SizedBox(width: 12),
          Text(message),
        ],
      ),
    ),
  );
}

Future<void> uploadImageToStorage(FilePickerResult selectedFile) async {
  // TODO: Add your logic to upload image to Firebase Storage
  // Example: Upload image to a specific folder with a unique name
  // and get the download URL
}
