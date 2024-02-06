import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/cirarumanovacategoria_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import 'criar_quizes_widget.dart' show CriarQuizesWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CriarQuizesModel extends FlutterFlowModel<CriarQuizesWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for dropCategorias widget.
  String? dropCategoriasValue;
  FormFieldController<String>? dropCategoriasValueController;
  // State field(s) for textNomeQuiz widget.
  FocusNode? textNomeQuizFocusNode;
  TextEditingController? textNomeQuizController;
  String? Function(BuildContext, String?)? textNomeQuizControllerValidator;
  // State field(s) for textDescricaoQuiz widget.
  FocusNode? textDescricaoQuizFocusNode;
  TextEditingController? textDescricaoQuizController;
  String? Function(BuildContext, String?)? textDescricaoQuizControllerValidator;
  // State field(s) for Switch widget.
  bool? switchValue;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // Stores action output result for [Custom Action - retornaCategoriaREFpeloTexto] action in Button widget.
  DocumentReference? retornarCategoria;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  QuizRecord? criarQuizComImagem;
  // Stores action output result for [Custom Action - retornaCategoriaREFpeloTexto] action in Button widget.
  DocumentReference? retornarCategoriaSemFoto;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  QuizRecord? criarQuizSemImagem;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    textNomeQuizFocusNode?.dispose();
    textNomeQuizController?.dispose();

    textDescricaoQuizFocusNode?.dispose();
    textDescricaoQuizController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
