import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'registrar_widget.dart' show RegistrarWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class RegistrarModel extends FlutterFlowModel<RegistrarWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Nome widget.
  FocusNode? nomeFocusNode;
  TextEditingController? nomeController;
  String? Function(BuildContext, String?)? nomeControllerValidator;
  // State field(s) for Apelido widget.
  FocusNode? apelidoFocusNode;
  TextEditingController? apelidoController;
  String? Function(BuildContext, String?)? apelidoControllerValidator;
  // State field(s) for emailCriar widget.
  FocusNode? emailCriarFocusNode;
  TextEditingController? emailCriarController;
  String? Function(BuildContext, String?)? emailCriarControllerValidator;
  // State field(s) for senha widget.
  FocusNode? senhaFocusNode;
  TextEditingController? senhaController;
  late bool senhaVisibility;
  String? Function(BuildContext, String?)? senhaControllerValidator;
  // State field(s) for confirmarsenha widget.
  FocusNode? confirmarsenhaFocusNode;
  TextEditingController? confirmarsenhaController;
  late bool confirmarsenhaVisibility;
  String? Function(BuildContext, String?)? confirmarsenhaControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    senhaVisibility = false;
    confirmarsenhaVisibility = false;
  }

  void dispose() {
    unfocusNode.dispose();
    nomeFocusNode?.dispose();
    nomeController?.dispose();

    apelidoFocusNode?.dispose();
    apelidoController?.dispose();

    emailCriarFocusNode?.dispose();
    emailCriarController?.dispose();

    senhaFocusNode?.dispose();
    senhaController?.dispose();

    confirmarsenhaFocusNode?.dispose();
    confirmarsenhaController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
