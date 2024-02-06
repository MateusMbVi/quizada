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

import 'dart:io';

import 'dart:convert';
import 'package:csv/csv.dart';
import '../../backend/firebase_storage/storage.dart';
import '../../flutter_flow/flutter_flow_widgets.dart';
import '../../flutter_flow/upload_data.dart';

Future importarPerguntas(
  BuildContext context,
  String? divider,
  String? collectionName,
  DocumentReference quizRef,
) async {
  // null safety check
  divider = divider ?? ',';
  collectionName ??= 'perguntas';

  // Get a reference to the Firestore database
  final firestore = FirebaseFirestore.instance;

  // TODO: Change collection name
  final collectionRef = firestore.collection(collectionName);

  final selectedFile = await selectFile(allowedExtensions: ['csv', 'json']);

  if (selectedFile != null) {
    showUploadMessage(
      context,
      'Carregando arquivo...',
      showLoading: true,
    );

    final fileString = utf8.decode(selectedFile.bytes);

    List<String> rows = [];
    String fileType = 'csv';
    Map<String, dynamic> doc = {};
    // if file is json
    if (selectedFile.storagePath.contains('json')) {
      fileType = 'json';
      List<dynamic> rows = jsonDecode(fileString);

      for (var row in rows) {
        // Convert the `Access_Block` field to a boolean
        // bool accessBlock = row['My Bool'] == 'TRUE';

        // Convert the `CreatedTime` field to a DateTime object
        // final dateFormat = DateFormat("yyyy/MM/dd HH:mm:ss");
        // DateTime createdTime = dateFormat.parse(row['My DateTime']);

        // Get a reference to the `docRef` document
        // DocumentReference docRef = quizRef;

        List<String> alternativas = [
          row['alternativa_A'],
          row['alternativa_B'],
          row['alternativa_C'],
          row['alternativa_D'],
          row['alternativa_E'],
          row['alternativa_F'],
        ];

        await collectionRef.add({
          'texto_pergunta': row['texto_pergunta'],
          'alternativa_A': row['alternativa_A'],
          'alternativa_B': row['alternativa_B'],
          'alternativa_C': row['alternativa_C'],
          'alternativa_D': row['alternativa_D'],
          'alternativa_E': row['alternativa_E'],
          'alternativa_F': row['alternativa_F'],
          'correta': row['correta'],
          'imagem': row['imagem'],
          'alternativas': alternativas,
          'quiz': quizRef,
        });
      }
    } else {
      rows = fileString.split('\n');

      int i = 0;
      for (var row in rows) {
        i++;

        // skip the head fields
        if (i == 1) {
          continue;
        }

        List<String> fields = row.split(divider);

        // Convert the `Access_Block` field to a boolean
        // bool accessBlock = fields[2] == 'TRUE';

        // Convert the `CreatedTime` field to a DateTime object
        // final dateFormat = DateFormat("yyyy/MM/dd HH:mm:ss");
        // DateTime createdTime = dateFormat.parse(fields[3]);

        // Get a reference to the `docRef` document
        // DocumentReference docRef = quizRef;

        // old code
        // doc = createUsersdataRecordData(
        //   username: fields[0],
        //   identifier: int.parse(fields[1]),
        //   onepass: fields[2],
        //   recovery: fields[3],
        //   fname: fields[4],
        //   lname: fields[5],
        //   departament: fields[6],
        //   location: fields[7],
        // );
        // await collectionRef.add(doc);

        // new code
        List<String> alternativas = [
          fields[1],
          fields[2],
          fields[3],
          fields[4],
          fields[5],
          fields[6],
        ];

        await collectionRef.add({
          'texto_pergunta': fields[0],
          'alternativa_A': fields[1],
          'alternativa_B': fields[2],
          'alternativa_C': fields[3],
          'alternativa_D': fields[4],
          'alternativa_E': fields[5],
          'alternativa_F': fields[6],
          'correta': fields[7],
          'imagem': fields[8],
          'alternativas': alternativas,
          'quiz': quizRef,
        });
      }
    }

    showUploadMessage(
      context,
      'Sucesso!',
    );
  }
}
