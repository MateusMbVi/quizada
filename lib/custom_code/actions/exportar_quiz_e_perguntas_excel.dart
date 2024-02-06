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
import 'package:path_provider/path_provider.dart';
import 'package:excel/excel.dart';

Future<String?> exportarQuizEPerguntasExcel(
    QuizRecord quiz, List<PerguntasRecord> perguntas) async {
  var excel = Excel.createExcel();
  CellStyle cellStyle = CellStyle(bold: true);

  // Adiciona os títulos das colunas para o Quiz
  var sheetQuiz = excel['Quiz'];
  var titulosQuiz = ['Tema', 'Descricao', 'Imagem', 'Jogadas', 'Favoritados'];
  var titulosQuizCellValue =
      titulosQuiz.map((titulo) => TextCellValue(titulo)).toList();
  sheetQuiz.appendRow(titulosQuizCellValue);

  // Adiciona os dados do Quiz
  sheetQuiz.appendRow([
    TextCellValue(quiz.tema.toString()),
    TextCellValue(quiz.descricao.toString()),
    TextCellValue(quiz.imagem.toString()),
    TextCellValue(quiz.jogadas.toString()),
    TextCellValue(quiz.favoritados.toString()),
  ]);

  // Adiciona uma linha em branco entre o Quiz e as Perguntas
  sheetQuiz.appendRow([]);

  // Adiciona os títulos das colunas para as Perguntas
  var sheetPerguntas = excel['Perguntas'];
  var titulosPerguntas = [
    'Texto Pergunta',
    'Alternativa A',
    'Alternativa B',
    'Alternativa C',
    'Alternativa D',
    'Alternativa E',
    'Alternativa F',
    'Correta',
    'Imagem'
  ];
  var titulosPerguntasCellValue =
      titulosPerguntas.map((titulo) => TextCellValue(titulo)).toList();
  sheetPerguntas.appendRow(titulosPerguntasCellValue);

  // Adiciona os dados das Perguntas
  for (var pergunta in perguntas) {
    sheetPerguntas.appendRow([
      TextCellValue(pergunta.textoPergunta.toString()),
      TextCellValue(pergunta.alternativaA.toString()),
      TextCellValue(pergunta.alternativaB.toString()),
      TextCellValue(pergunta.alternativaC.toString()),
      TextCellValue(pergunta.alternativaD.toString()),
      TextCellValue(pergunta.alternativaE.toString()),
      TextCellValue(pergunta.alternativaF.toString()),
      TextCellValue(pergunta.correta.toString()),
      TextCellValue(pergunta.imagem.toString()),
    ]);
  }

  // Obtém o diretório de downloads do dispositivo
  final directory = await getDownloadsDirectory();

  // Certifica-se de que o diretório existe, se não, cria-o
  if (!(await Directory(directory!.path).exists())) {
    await Directory(directory.path).create(recursive: true);
  }

  // Caminho completo do arquivo no diretório de downloads
  final filePath = '${directory.path}/Quiz_${DateTime.now()}.xlsx';

  // Salva o arquivo XLSX
  var fileBytes = excel.encode();

  // Grava o conteúdo no arquivo
  File(filePath).writeAsBytesSync(fileBytes!);

  return filePath;
}
