import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/quantidade_perguntas_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'desafio_widget.dart' show DesafioWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DesafioModel extends FlutterFlowModel<DesafioWidget> {
  ///  Local state fields for this page.

  List<PerguntasRecord> perguntas = [];
  void addToPerguntas(PerguntasRecord item) => perguntas.add(item);
  void removeFromPerguntas(PerguntasRecord item) => perguntas.remove(item);
  void removeAtIndexFromPerguntas(int index) => perguntas.removeAt(index);
  void insertAtIndexInPerguntas(int index, PerguntasRecord item) =>
      perguntas.insert(index, item);
  void updatePerguntasAtIndex(int index, Function(PerguntasRecord) updateFn) =>
      perguntas[index] = updateFn(perguntas[index]);

  String? numero = '';

  ///  State fields for stateful widgets in this page.

  // State field(s) for buscarQuiz widget.
  FocusNode? buscarQuizFocusNode;
  TextEditingController? buscarQuizController;
  String? Function(BuildContext, String?)? buscarQuizControllerValidator;
  // State field(s) for buscarUsuario widget.
  FocusNode? buscarUsuarioFocusNode;
  TextEditingController? buscarUsuarioController;
  String? Function(BuildContext, String?)? buscarUsuarioControllerValidator;
  // State field(s) for Checkbox widget.

  Map<DocumentReference, bool> checkboxValueMap = {};
  List<DocumentReference> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ConvitesRecord? criarConviteQuiz;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    buscarQuizFocusNode?.dispose();
    buscarQuizController?.dispose();

    buscarUsuarioFocusNode?.dispose();
    buscarUsuarioController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
