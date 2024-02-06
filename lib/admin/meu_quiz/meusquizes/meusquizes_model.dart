import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/criar_quizes_widget.dart';
import '/components/exportar_quizes_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'meusquizes_widget.dart' show MeusquizesWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MeusquizesModel extends FlutterFlowModel<MeusquizesWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - exportarQuizEPerguntasCopy] action in Icon widget.
  String? exportarQuizUnico;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
