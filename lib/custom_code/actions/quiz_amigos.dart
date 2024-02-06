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

Future<void> quizAmigos(
  DocumentReference quiz,
  List<DocumentReference> usuarios,
) async {
  try {
    print('Iniciando adição de usuários ao cupom...');

    // Verificar se o documento cupom existe
    if (!(await quiz.get()).exists) {
      print('Erro: Documento "cupom" não encontrado.');
      return;
    }

    // Atualizar o campo 'usuarios' no documento cupom com a nova lista
    await quiz.update({
      'usuarios': FieldValue.arrayUnion(usuarios),
    });

    print('Usuários adicionados com sucesso ao cupom.');
  } catch (e) {
    print('Erro ao adicionar usuários ao cupom: $e');
    // Trate o erro conforme necessário
  }
}

// Exemplo de uso
void main() async {
  // Suponha que você tenha um DocumentReference para o documento "cupom"
  DocumentReference quizRef =
      FirebaseFirestore.instance.collection('quiz').doc('quiz');

  // Suponha que você tenha uma lista de DocumentReference para os usuários
  List<DocumentReference> usuariosRefs = [
    FirebaseFirestore.instance.collection('user').doc('usuarios'),
    FirebaseFirestore.instance.collection('user').doc('usuarios'),
    // Adicione outros DocumentReference conforme necessário
  ];

  // Chame a função para adicionar os usuários à lista de usuários no documento "cupom"
  await quizAmigos(quizRef, usuariosRefs);
}
