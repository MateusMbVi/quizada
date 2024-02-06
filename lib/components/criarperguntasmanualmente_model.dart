import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'criarperguntasmanualmente_widget.dart'
    show CriarperguntasmanualmenteWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CriarperguntasmanualmenteModel
    extends FlutterFlowModel<CriarperguntasmanualmenteWidget> {
  ///  Local state fields for this component.

  String? alternativaA;

  String? alternativaB;

  String? alternativaC;

  String? alternativaD;

  String? alternativaE;

  String? alternativaF;

  List<String> alternativas = [];
  void addToAlternativas(String item) => alternativas.add(item);
  void removeFromAlternativas(String item) => alternativas.remove(item);
  void removeAtIndexFromAlternativas(int index) => alternativas.removeAt(index);
  void insertAtIndexInAlternativas(int index, String item) =>
      alternativas.insert(index, item);
  void updateAlternativasAtIndex(int index, Function(String) updateFn) =>
      alternativas[index] = updateFn(alternativas[index]);

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for pergunta widget.
  FocusNode? perguntaFocusNode;
  TextEditingController? perguntaController;
  String? Function(BuildContext, String?)? perguntaControllerValidator;
  String? _perguntaControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório *';
    }

    return null;
  }

  // State field(s) for alternativaA widget.
  FocusNode? alternativaAFocusNode;
  TextEditingController? alternativaAController;
  String? Function(BuildContext, String?)? alternativaAControllerValidator;
  String? _alternativaAControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório *';
    }

    return null;
  }

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

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  PerguntasRecord? addquestoes;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  PerguntasRecord? addquestoessemfoto;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    perguntaControllerValidator = _perguntaControllerValidator;
    alternativaAControllerValidator = _alternativaAControllerValidator;
  }

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
