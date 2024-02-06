import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/criarperguntasmanualmente_widget.dart';
import '/components/editarperguntas_widget.dart';
import '/components/tutorialimportacao_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'adicionarperguntas_widget.dart' show AdicionarperguntasWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class AdicionarperguntasModel
    extends FlutterFlowModel<AdicionarperguntasWidget> {
  ///  Local state fields for this page.

  List<PerguntasRecord> perguntasLista = [];
  void addToPerguntasLista(PerguntasRecord item) => perguntasLista.add(item);
  void removeFromPerguntasLista(PerguntasRecord item) =>
      perguntasLista.remove(item);
  void removeAtIndexFromPerguntasLista(int index) =>
      perguntasLista.removeAt(index);
  void insertAtIndexInPerguntasLista(int index, PerguntasRecord item) =>
      perguntasLista.insert(index, item);
  void updatePerguntasListaAtIndex(
          int index, Function(PerguntasRecord) updateFn) =>
      perguntasLista[index] = updateFn(perguntasLista[index]);

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
