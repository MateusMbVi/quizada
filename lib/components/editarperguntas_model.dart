import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'editarperguntas_widget.dart' show EditarperguntasWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditarperguntasModel extends FlutterFlowModel<EditarperguntasWidget> {
  ///  State fields for stateful widgets in this component.

  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for pergunta widget.
  FocusNode? perguntaFocusNode;
  TextEditingController? perguntaController;
  String? Function(BuildContext, String?)? perguntaControllerValidator;
  // State field(s) for alternativaA widget.
  FocusNode? alternativaAFocusNode;
  TextEditingController? alternativaAController;
  String? Function(BuildContext, String?)? alternativaAControllerValidator;
  // State field(s) for alternativaB widget.
  FocusNode? alternativaBFocusNode;
  TextEditingController? alternativaBController;
  String? Function(BuildContext, String?)? alternativaBControllerValidator;
  // State field(s) for alternativaC widget.
  FocusNode? alternativaCFocusNode;
  TextEditingController? alternativaCController;
  String? Function(BuildContext, String?)? alternativaCControllerValidator;
  // State field(s) for alternativaD widget.
  FocusNode? alternativaDFocusNode;
  TextEditingController? alternativaDController;
  String? Function(BuildContext, String?)? alternativaDControllerValidator;
  // State field(s) for alternativaE widget.
  FocusNode? alternativaEFocusNode;
  TextEditingController? alternativaEController;
  String? Function(BuildContext, String?)? alternativaEControllerValidator;
  // State field(s) for alternativaF widget.
  FocusNode? alternativaFFocusNode;
  TextEditingController? alternativaFController;
  String? Function(BuildContext, String?)? alternativaFControllerValidator;
  // State field(s) for dropRespostaCorreta widget.
  String? dropRespostaCorretaValue;
  FormFieldController<String>? dropRespostaCorretaValueController;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    perguntaFocusNode?.dispose();
    perguntaController?.dispose();

    alternativaAFocusNode?.dispose();
    alternativaAController?.dispose();

    alternativaBFocusNode?.dispose();
    alternativaBController?.dispose();

    alternativaCFocusNode?.dispose();
    alternativaCController?.dispose();

    alternativaDFocusNode?.dispose();
    alternativaDController?.dispose();

    alternativaEFocusNode?.dispose();
    alternativaEController?.dispose();

    alternativaFFocusNode?.dispose();
    alternativaFController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
