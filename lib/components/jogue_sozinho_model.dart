import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'jogue_sozinho_widget.dart' show JogueSozinhoWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class JogueSozinhoModel extends FlutterFlowModel<JogueSozinhoWidget> {
  ///  Local state fields for this component.

  List<PerguntasRecord> perguntas = [];
  void addToPerguntas(PerguntasRecord item) => perguntas.add(item);
  void removeFromPerguntas(PerguntasRecord item) => perguntas.remove(item);
  void removeAtIndexFromPerguntas(int index) => perguntas.removeAt(index);
  void insertAtIndexInPerguntas(int index, PerguntasRecord item) =>
      perguntas.insert(index, item);
  void updatePerguntasAtIndex(int index, Function(PerguntasRecord) updateFn) =>
      perguntas[index] = updateFn(perguntas[index]);

  String numero = '';

  int? numeroPerguntas;

  DocumentReference? quiz;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
