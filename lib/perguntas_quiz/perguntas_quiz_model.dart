import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'perguntas_quiz_widget.dart' show PerguntasQuizWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class PerguntasQuizModel extends FlutterFlowModel<PerguntasQuizWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - retornarProximaPergunta] action in Button widget.
  bool? retornarProximaPergunta;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  RespostasRecord? criarRespostas;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ScoreRecord? scoreSim;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  RankingRecord? criarRanking;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
