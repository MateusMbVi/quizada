import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

String retornaAlternativa(
  PerguntasRecord pergunta,
  String alternativa,
) {
  var retorno = "";

  switch (alternativa) {
    case 'A':
      retorno = pergunta.alternativaA;
      break;
    case 'B':
      retorno = pergunta.alternativaB;
      break;
    case 'C':
      retorno = pergunta.alternativaC;
      break;
    case 'D':
      retorno = pergunta.alternativaD;
      break;
  }

  return retorno;
}

PerguntasRecord retornaPerguntaAtual(
  int perguntaAtual,
  List<PerguntasRecord> perguntas,
) {
  return perguntas[perguntaAtual];
}

bool busca(
  String textSearchFor,
  String textSearchIn,
) {
  return textSearchIn.toLowerCase().contains(textSearchFor.toLowerCase());
}

int somarMaisUm(int index) {
  // Add 1 more
  return index + 1;
}

List<String> embaralharAlternativasCopy(List<String> alternativas) {
  // Shuffle list items
  var random = math.Random();
  for (var i = alternativas.length - 1; i > 0; i--) {
    var j = random.nextInt(i + 1);
    var temp = alternativas[i];
    alternativas[i] = alternativas[j];
    alternativas[j] = temp;
  }
  return alternativas;
}

String formatarParaDinheiro(double numero) {
  // Format for money
  final formatter = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
  return formatter.format(numero);
}

int getValueIndex(
  List<PerguntasRecord> perguntas,
  List<int> perguntasFeitas,
) {
  final random = math.Random();
  int randomIndex;

  do {
    randomIndex = random.nextInt(perguntas.length);
  } while (perguntasFeitas.contains(randomIndex));

  return randomIndex;
}

List<String> embaralharAlternativas(List<String> alternativas) {
  // Shuffle list items
  var random = math.Random();
  for (var i = alternativas.length - 1; i > 0; i--) {
    var j = random.nextInt(i + 1);
    var temp = alternativas[i];
    alternativas[i] = alternativas[j];
    alternativas[j] = temp;
  }
  return alternativas;
}

List<PerguntasRecord> definirPerguntasAleatoria(
  List<PerguntasRecord> perguntas,
  int quantidade,
) {
  // Return a list of questions randomly according to quantity
  List<PerguntasRecord> perguntasAleatorias = [];
  final random = math.Random();
  for (int i = 0; i < quantidade; i++) {
    int index = random.nextInt(perguntas.length);
    perguntasAleatorias.add(perguntas[index]);
  }
  return perguntasAleatorias;
}

List<String> baguncarAlternativas(List<String> alternativas) {
  // Shuffle alternatives without updating the list by clicking on the item
  var random = math.Random();
  var shuffledAlternativas = List<String>.from(alternativas);
  for (var i = shuffledAlternativas.length - 1; i > 0; i--) {
    var j = random.nextInt(i + 1);
    var temp = shuffledAlternativas[i];
    shuffledAlternativas[i] = shuffledAlternativas[j];
    shuffledAlternativas[j] = temp;
  }
  return shuffledAlternativas;
}

double converteStringEmDouble(double valor) {
  // converte for money
  return double.parse(valor.toStringAsFixed(2));
}
