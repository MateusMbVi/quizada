import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'colabore_widget.dart' show ColaboreWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class ColaboreModel extends FlutterFlowModel<ColaboreWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for nomePix widget.
  FocusNode? nomePixFocusNode;
  TextEditingController? nomePixController;
  String? Function(BuildContext, String?)? nomePixControllerValidator;
  // State field(s) for sobrenomePix widget.
  FocusNode? sobrenomePixFocusNode;
  TextEditingController? sobrenomePixController;
  String? Function(BuildContext, String?)? sobrenomePixControllerValidator;
  // State field(s) for emailPix widget.
  FocusNode? emailPixFocusNode;
  TextEditingController? emailPixController;
  String? Function(BuildContext, String?)? emailPixControllerValidator;
  // State field(s) for dropPix widget.
  String? dropPixValue;
  FormFieldController<String>? dropPixValueController;
  // State field(s) for cpfPix widget.
  FocusNode? cpfPixFocusNode;
  TextEditingController? cpfPixController;
  final cpfPixMask = MaskTextInputFormatter(mask: '###########');
  String? Function(BuildContext, String?)? cpfPixControllerValidator;
  // State field(s) for cnpjPix widget.
  FocusNode? cnpjPixFocusNode;
  TextEditingController? cnpjPixController;
  final cnpjPixMask = MaskTextInputFormatter(mask: '##.###.###/####-##');
  String? Function(BuildContext, String?)? cnpjPixControllerValidator;
  // State field(s) for valorPix widget.
  FocusNode? valorPixFocusNode;
  TextEditingController? valorPixController;
  String? Function(BuildContext, String?)? valorPixControllerValidator;
  // Stores action output result for [Backend Call - API (Pay Pix)] action in Button widget.
  ApiCallResponse? gerarPix;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  DoacoesRecord? doacaopix;
  // State field(s) for nomeimpressoCard widget.
  FocusNode? nomeimpressoCardFocusNode;
  TextEditingController? nomeimpressoCardController;
  String? Function(BuildContext, String?)? nomeimpressoCardControllerValidator;
  // State field(s) for numeroCartao widget.
  FocusNode? numeroCartaoFocusNode1;
  TextEditingController? numeroCartaoController1;
  final numeroCartaoMask1 = MaskTextInputFormatter(mask: '################');
  String? Function(BuildContext, String?)? numeroCartaoController1Validator;
  // State field(s) for mesCartao widget.
  FocusNode? mesCartaoFocusNode;
  TextEditingController? mesCartaoController;
  String? Function(BuildContext, String?)? mesCartaoControllerValidator;
  // State field(s) for anoCartao widget.
  FocusNode? anoCartaoFocusNode;
  TextEditingController? anoCartaoController;
  final anoCartaoMask = MaskTextInputFormatter(mask: '####');
  String? Function(BuildContext, String?)? anoCartaoControllerValidator;
  // State field(s) for cvvCartao widget.
  FocusNode? cvvCartaoFocusNode;
  TextEditingController? cvvCartaoController;
  final cvvCartaoMask = MaskTextInputFormatter(mask: '###');
  String? Function(BuildContext, String?)? cvvCartaoControllerValidator;
  // State field(s) for numeroCartao widget.
  FocusNode? numeroCartaoFocusNode2;
  TextEditingController? numeroCartaoController2;
  String? Function(BuildContext, String?)? numeroCartaoController2Validator;
  // State field(s) for cepCartao widget.
  FocusNode? cepCartaoFocusNode;
  TextEditingController? cepCartaoController;
  String? Function(BuildContext, String?)? cepCartaoControllerValidator;
  // State field(s) for valorCartao widget.
  FocusNode? valorCartaoFocusNode;
  TextEditingController? valorCartaoController;
  String? Function(BuildContext, String?)? valorCartaoControllerValidator;
  // State field(s) for DropDown widget.
  int? dropDownValue;
  FormFieldController<int>? dropDownValueController;
  // Stores action output result for [Backend Call - API (Criar Token)] action in Button widget.
  ApiCallResponse? criarTokencard;
  // Stores action output result for [Backend Call - API (Criar Pagamento MP)] action in Button widget.
  ApiCallResponse? gerarPedidoCard;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  NotificacoesRecord? doacaorealizadaokcard;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  DoacoesRecord? doacaocardok;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    nomePixFocusNode?.dispose();
    nomePixController?.dispose();

    sobrenomePixFocusNode?.dispose();
    sobrenomePixController?.dispose();

    emailPixFocusNode?.dispose();
    emailPixController?.dispose();

    cpfPixFocusNode?.dispose();
    cpfPixController?.dispose();

    cnpjPixFocusNode?.dispose();
    cnpjPixController?.dispose();

    valorPixFocusNode?.dispose();
    valorPixController?.dispose();

    nomeimpressoCardFocusNode?.dispose();
    nomeimpressoCardController?.dispose();

    numeroCartaoFocusNode1?.dispose();
    numeroCartaoController1?.dispose();

    mesCartaoFocusNode?.dispose();
    mesCartaoController?.dispose();

    anoCartaoFocusNode?.dispose();
    anoCartaoController?.dispose();

    cvvCartaoFocusNode?.dispose();
    cvvCartaoController?.dispose();

    numeroCartaoFocusNode2?.dispose();
    numeroCartaoController2?.dispose();

    cepCartaoFocusNode?.dispose();
    cepCartaoController?.dispose();

    valorCartaoFocusNode?.dispose();
    valorCartaoController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
