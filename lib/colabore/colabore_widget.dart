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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'colabore_model.dart';
export 'colabore_model.dart';

class ColaboreWidget extends StatefulWidget {
  const ColaboreWidget({super.key});

  @override
  State<ColaboreWidget> createState() => _ColaboreWidgetState();
}

class _ColaboreWidgetState extends State<ColaboreWidget> {
  late ColaboreModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ColaboreModel());

    _model.nomePixController ??= TextEditingController();
    _model.nomePixFocusNode ??= FocusNode();

    _model.sobrenomePixController ??= TextEditingController();
    _model.sobrenomePixFocusNode ??= FocusNode();

    _model.emailPixController ??= TextEditingController();
    _model.emailPixFocusNode ??= FocusNode();

    _model.cpfPixController ??= TextEditingController();
    _model.cpfPixFocusNode ??= FocusNode();

    _model.cnpjPixController ??= TextEditingController();
    _model.cnpjPixFocusNode ??= FocusNode();

    _model.valorPixController ??= TextEditingController();
    _model.valorPixFocusNode ??= FocusNode();

    _model.nomeimpressoCardController ??= TextEditingController();
    _model.nomeimpressoCardFocusNode ??= FocusNode();

    _model.numeroCartaoController1 ??= TextEditingController();
    _model.numeroCartaoFocusNode1 ??= FocusNode();

    _model.mesCartaoController ??= TextEditingController();
    _model.mesCartaoFocusNode ??= FocusNode();

    _model.anoCartaoController ??= TextEditingController();
    _model.anoCartaoFocusNode ??= FocusNode();

    _model.cvvCartaoController ??= TextEditingController();
    _model.cvvCartaoFocusNode ??= FocusNode();

    _model.numeroCartaoController2 ??= TextEditingController();
    _model.numeroCartaoFocusNode2 ??= FocusNode();

    _model.cepCartaoController ??= TextEditingController();
    _model.cepCartaoFocusNode ??= FocusNode();

    _model.valorCartaoController ??= TextEditingController();
    _model.valorCartaoFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: double.infinity,
              height: 120.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primary,
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 20.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pop();
                      },
                      child: Icon(
                        Icons.arrow_back_ios_sharp,
                        color: Colors.white,
                        size: 24.0,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                        child: Text(
                          'Colabore',
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Nunito',
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: StreamBuilder<List<DescricaoCheckoutRecord>>(
                stream: queryDescricaoCheckoutRecord(
                  singleRecord: true,
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                      ),
                    );
                  }
                  List<DescricaoCheckoutRecord>
                      containerDescricaoCheckoutRecordList = snapshot.data!;
                  final containerDescricaoCheckoutRecord =
                      containerDescricaoCheckoutRecordList.isNotEmpty
                          ? containerDescricaoCheckoutRecordList.first
                          : null;
                  return Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 12.0,
                          color: Color(0x33000000),
                          offset: Offset(0.0, 5.0),
                        )
                      ],
                      borderRadius: BorderRadius.circular(13.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 10.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Text(
                                      valueOrDefault<String>(
                                        containerDescricaoCheckoutRecord
                                            ?.titulo,
                                        'AJUDE COM O VALOR QUE PUDER',
                                      ),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Nunito',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              thickness: 1.0,
                              color: Color(0xFFCFCFCF),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 20.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Text(
                                      valueOrDefault<String>(
                                        containerDescricaoCheckoutRecord
                                            ?.descricao,
                                        'O app foi criado como uma realização pessoal e uma contribuição minha com a educação e o autoconhecimento.   Todo o valor arrecadado serão carreiras para novas funções, suporte e conteúdo',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Nunito',
                                            fontSize: 17.0,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Text(
                                    'Escolha como deseja contribuir',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: Colors.black,
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  setState(() {
                                    FFAppState().metodoPagamento = 'cartao';
                                  });
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: 60.0,
                                  decoration: BoxDecoration(
                                    color: valueOrDefault<Color>(
                                      FFAppState().metodoPagamento == 'cartao'
                                          ? FlutterFlowTheme.of(context).primary
                                          : Colors.white,
                                      Colors.white,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                    border: Border.all(
                                      color: valueOrDefault<Color>(
                                        FFAppState().metodoPagamento == 'cartao'
                                            ? FlutterFlowTheme.of(context)
                                                .primary
                                            : Color(0xFFCFCFCF),
                                        Color(0xFFCFCFCF),
                                      ),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Icon(
                                          Icons.credit_card_rounded,
                                          color: valueOrDefault<Color>(
                                            FFAppState().metodoPagamento ==
                                                    'cartao'
                                                ? Colors.white
                                                : FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                          ),
                                          size: 30.0,
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'CARTÃO DE CRÉDITO ',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Roboto',
                                                    color:
                                                        valueOrDefault<Color>(
                                                      FFAppState().metodoPagamento ==
                                                              'cartao'
                                                          ? Colors.white
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryText,
                                                    ),
                                                    fontSize: 17.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  setState(() {
                                    FFAppState().metodoPagamento = 'pix';
                                  });
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: 60.0,
                                  decoration: BoxDecoration(
                                    color: valueOrDefault<Color>(
                                      FFAppState().metodoPagamento == 'pix'
                                          ? FlutterFlowTheme.of(context).primary
                                          : Colors.white,
                                      Colors.white,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                    border: Border.all(
                                      color: valueOrDefault<Color>(
                                        FFAppState().metodoPagamento == 'pix'
                                            ? FlutterFlowTheme.of(context)
                                                .primary
                                            : Color(0xFFCFCFCF),
                                        Color(0xFFCFCFCF),
                                      ),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Icon(
                                          Icons.pix,
                                          color: valueOrDefault<Color>(
                                            FFAppState().metodoPagamento ==
                                                    'pix'
                                                ? Colors.white
                                                : FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                          ),
                                          size: 30.0,
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'PIX',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Roboto',
                                                    color:
                                                        valueOrDefault<Color>(
                                                      FFAppState().metodoPagamento ==
                                                              'pix'
                                                          ? Colors.white
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryText,
                                                    ),
                                                    fontSize: 17.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            if (FFAppState().metodoPagamento == 'pix')
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 50.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 12.0,
                        color: Color(0x33000000),
                        offset: Offset(0.0, 5.0),
                      )
                    ],
                    borderRadius: BorderRadius.circular(13.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 20.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Text(
                                    'Preencha os campos abaixo para gerar o código pix',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Nunito',
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 20.0),
                            child: Container(
                              width: double.infinity,
                              height: 40.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: TextFormField(
                                controller: _model.nomePixController,
                                focusNode: _model.nomePixFocusNode,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Nome',
                                  labelStyle:
                                      FlutterFlowTheme.of(context).labelMedium,
                                  hintStyle:
                                      FlutterFlowTheme.of(context).labelMedium,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFCFCFCF),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                                validator: _model.nomePixControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 20.0),
                            child: Container(
                              width: double.infinity,
                              height: 40.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: TextFormField(
                                controller: _model.sobrenomePixController,
                                focusNode: _model.sobrenomePixFocusNode,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Sobrenome',
                                  labelStyle:
                                      FlutterFlowTheme.of(context).labelMedium,
                                  hintStyle:
                                      FlutterFlowTheme.of(context).labelMedium,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFCFCFCF),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                                validator: _model
                                    .sobrenomePixControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 20.0),
                            child: Container(
                              width: double.infinity,
                              height: 40.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: TextFormField(
                                controller: _model.emailPixController,
                                focusNode: _model.emailPixFocusNode,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'E-mail',
                                  labelStyle:
                                      FlutterFlowTheme.of(context).labelMedium,
                                  hintStyle:
                                      FlutterFlowTheme.of(context).labelMedium,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFCFCFCF),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                                validator: _model.emailPixControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 20.0),
                            child: FlutterFlowDropDown<String>(
                              controller: _model.dropPixValueController ??=
                                  FormFieldController<String>(
                                _model.dropPixValue ??= 'CPF',
                              ),
                              options: ['CPF', 'CNPJ'],
                              onChanged: (val) =>
                                  setState(() => _model.dropPixValue = val),
                              width: double.infinity,
                              height: 40.0,
                              textStyle:
                                  FlutterFlowTheme.of(context).bodyMedium,
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                              fillColor: Colors.white,
                              elevation: 0.0,
                              borderColor: Color(0xFFCFCFCF),
                              borderWidth: 1.0,
                              borderRadius: 10.0,
                              margin: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 4.0, 16.0, 4.0),
                              hidesUnderline: true,
                              isSearchable: false,
                              isMultiSelect: false,
                            ),
                          ),
                          if (_model.dropPixValue == 'CPF')
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 20.0),
                              child: Container(
                                width: double.infinity,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: TextFormField(
                                  controller: _model.cpfPixController,
                                  focusNode: _model.cpfPixFocusNode,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Número CPF',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFFCFCFCF),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  keyboardType: TextInputType.number,
                                  validator: _model.cpfPixControllerValidator
                                      .asValidator(context),
                                  inputFormatters: [_model.cpfPixMask],
                                ),
                              ),
                            ),
                          if (_model.dropPixValue == 'CNPJ')
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 20.0),
                              child: Container(
                                width: double.infinity,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: TextFormField(
                                  controller: _model.cnpjPixController,
                                  focusNode: _model.cnpjPixFocusNode,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Número CNPJ',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFFCFCFCF),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  keyboardType: TextInputType.number,
                                  validator: _model.cnpjPixControllerValidator
                                      .asValidator(context),
                                  inputFormatters: [_model.cnpjPixMask],
                                ),
                              ),
                            ),
                          if (_model.dropPixValue == 'CNPJ')
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 20.0),
                              child: Container(
                                width: double.infinity,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: TextFormField(
                                  controller: _model.valorPixController,
                                  focusNode: _model.valorPixFocusNode,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.valorPixController',
                                    Duration(milliseconds: 0),
                                    () => setState(() {}),
                                  ),
                                  onFieldSubmitted: (_) async {
                                    setState(() {
                                      FFAppState().valorDoacao = double.parse(
                                          _model.valorPixController.text);
                                    });
                                  },
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Valor',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFFCFCFCF),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  validator: _model.valorPixControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    _model.gerarPix = await PayPixCall.call(
                                      amount: functions.converteStringEmDouble(
                                          double.parse(
                                              _model.valorPixController.text)),
                                      productTitle: 'Doação',
                                      email: currentUserEmail,
                                      firstName: _model.nomePixController.text,
                                      lastName:
                                          _model.sobrenomePixController.text,
                                      identificationType: _model.dropPixValue,
                                      numberCpf: FFAppState().cpfOuCnpj,
                                    );
                                    if ((_model.gerarPix?.succeeded ?? true)) {
                                      var doacoesRecordReference =
                                          DoacoesRecord.collection.doc();
                                      await doacoesRecordReference
                                          .set(createDoacoesRecordData(
                                        valor: double.tryParse(
                                            _model.valorPixController.text),
                                        data: getCurrentTimestamp,
                                        idPedido: PayPixCall.idPedido(
                                          (_model.gerarPix?.jsonBody ?? ''),
                                        ),
                                        usuario: currentUserReference,
                                        chavePix: PayPixCall.chavePix(
                                          (_model.gerarPix?.jsonBody ?? ''),
                                        ),
                                      ));
                                      _model.doacaopix =
                                          DoacoesRecord.getDocumentFromData(
                                              createDoacoesRecordData(
                                                valor: double.tryParse(_model
                                                    .valorPixController.text),
                                                data: getCurrentTimestamp,
                                                idPedido: PayPixCall.idPedido(
                                                  (_model.gerarPix?.jsonBody ??
                                                      ''),
                                                ),
                                                usuario: currentUserReference,
                                                chavePix: PayPixCall.chavePix(
                                                  (_model.gerarPix?.jsonBody ??
                                                      ''),
                                                ),
                                              ),
                                              doacoesRecordReference);
                                      setState(() {
                                        _model.nomePixController?.clear();
                                        _model.sobrenomePixController?.clear();
                                        _model.emailPixController?.clear();
                                        _model.cpfPixController?.clear();
                                        _model.cnpjPixController?.clear();
                                        _model.valorPixController?.clear();
                                      });
                                      setState(() {
                                        _model.dropPixValueController?.reset();
                                      });

                                      context.goNamed(
                                        'detalhesdoacao',
                                        queryParameters: {
                                          'detalhesdoacao': serializeParam(
                                            _model.doacaopix?.reference,
                                            ParamType.DocumentReference,
                                          ),
                                        }.withoutNulls,
                                      );
                                    } else {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text('Falha!'),
                                            content: Text(
                                                'Estamos enfrentando um problema ténico, tente novamente mais tarde!'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: Text('Ok'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    }

                                    setState(() {});
                                  },
                                  text: 'Gerar código pix',
                                  options: FFButtonOptions(
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Nunito',
                                          color: Colors.white,
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                    elevation: 0.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(250.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            if (FFAppState().metodoPagamento == 'cartao')
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 50.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 12.0,
                        color: Color(0x33000000),
                        offset: Offset(0.0, 5.0),
                      )
                    ],
                    borderRadius: BorderRadius.circular(13.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 20.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Text(
                                    'Preencha os campos abaixo',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Roboto',
                                          fontSize: 17.0,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 15.0),
                            child: Container(
                              width: double.infinity,
                              height: 40.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: TextFormField(
                                controller: _model.nomeimpressoCardController,
                                focusNode: _model.nomeimpressoCardFocusNode,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Nome impresso',
                                  labelStyle:
                                      FlutterFlowTheme.of(context).labelMedium,
                                  hintStyle:
                                      FlutterFlowTheme.of(context).labelMedium,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFCFCFCF),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                                validator: _model
                                    .nomeimpressoCardControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 15.0),
                            child: Container(
                              width: double.infinity,
                              height: 40.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: TextFormField(
                                controller: _model.numeroCartaoController1,
                                focusNode: _model.numeroCartaoFocusNode1,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Número do cartão',
                                  labelStyle:
                                      FlutterFlowTheme.of(context).labelMedium,
                                  hintStyle:
                                      FlutterFlowTheme.of(context).labelMedium,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFCFCFCF),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                                keyboardType: TextInputType.number,
                                validator: _model
                                    .numeroCartaoController1Validator
                                    .asValidator(context),
                                inputFormatters: [_model.numeroCartaoMask1],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 15.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 10.0, 0.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: TextFormField(
                                        controller: _model.mesCartaoController,
                                        focusNode: _model.mesCartaoFocusNode,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'Mês',
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium,
                                          hintText: '09',
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFCFCFCF),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          filled: true,
                                          fillColor: Colors.white,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        keyboardType: TextInputType.number,
                                        validator: _model
                                            .mesCartaoControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 10.0, 0.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: TextFormField(
                                        controller: _model.anoCartaoController,
                                        focusNode: _model.anoCartaoFocusNode,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'Ano',
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium,
                                          hintText: '2031',
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFCFCFCF),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          filled: true,
                                          fillColor: Colors.white,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        keyboardType: TextInputType.number,
                                        validator: _model
                                            .anoCartaoControllerValidator
                                            .asValidator(context),
                                        inputFormatters: [_model.anoCartaoMask],
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 10.0, 0.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: TextFormField(
                                        controller: _model.cvvCartaoController,
                                        focusNode: _model.cvvCartaoFocusNode,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'CVV',
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium,
                                          hintText: '123',
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFCFCFCF),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          filled: true,
                                          fillColor: Colors.white,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        keyboardType: TextInputType.number,
                                        validator: _model
                                            .cvvCartaoControllerValidator
                                            .asValidator(context),
                                        inputFormatters: [_model.cvvCartaoMask],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 15.0),
                            child: Container(
                              width: double.infinity,
                              height: 40.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: TextFormField(
                                controller: _model.numeroCartaoController2,
                                focusNode: _model.numeroCartaoFocusNode2,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'CPF',
                                  labelStyle:
                                      FlutterFlowTheme.of(context).labelMedium,
                                  hintStyle:
                                      FlutterFlowTheme.of(context).labelMedium,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFCFCFCF),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                                keyboardType: TextInputType.number,
                                validator: _model
                                    .numeroCartaoController2Validator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 15.0),
                            child: Container(
                              width: double.infinity,
                              height: 40.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: TextFormField(
                                controller: _model.cepCartaoController,
                                focusNode: _model.cepCartaoFocusNode,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'CEP',
                                  labelStyle:
                                      FlutterFlowTheme.of(context).labelMedium,
                                  hintStyle:
                                      FlutterFlowTheme.of(context).labelMedium,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFCFCFCF),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                                keyboardType: TextInputType.number,
                                validator: _model.cepCartaoControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 15.0),
                            child: Container(
                              width: double.infinity,
                              height: 40.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: TextFormField(
                                controller: _model.valorCartaoController,
                                focusNode: _model.valorCartaoFocusNode,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Valor',
                                  labelStyle:
                                      FlutterFlowTheme.of(context).labelMedium,
                                  hintStyle:
                                      FlutterFlowTheme.of(context).labelMedium,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFCFCFCF),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                                keyboardType: TextInputType.number,
                                validator: _model.valorCartaoControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 20.0),
                            child: FlutterFlowDropDown<int>(
                              controller: _model.dropDownValueController ??=
                                  FormFieldController<int>(
                                _model.dropDownValue ??= 1,
                              ),
                              options: List<int>.from([1, 2, 3, 4, 5, 6]),
                              optionLabels: ['1', '2', '3', '4', '5', '6'],
                              onChanged: (val) =>
                                  setState(() => _model.dropDownValue = val),
                              width: double.infinity,
                              height: 40.0,
                              textStyle:
                                  FlutterFlowTheme.of(context).bodyMedium,
                              hintText: 'Parcelar em até',
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                              fillColor: Colors.white,
                              elevation: 0.0,
                              borderColor: Color(0xFFCFCFCF),
                              borderWidth: 1.0,
                              borderRadius: 10.0,
                              margin: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 4.0, 16.0, 4.0),
                              hidesUnderline: true,
                              isSearchable: false,
                              isMultiSelect: false,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 15.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      _model.criarTokencard =
                                          await CriarTokenCall.call(
                                        cardNumber:
                                            _model.numeroCartaoController1.text,
                                        cardholderName: _model
                                            .nomeimpressoCardController.text,
                                        cardExpirationMonth:
                                            _model.mesCartaoController.text,
                                        cardExpirationYear:
                                            _model.anoCartaoController.text,
                                        securityCode:
                                            _model.cvvCartaoController.text,
                                        identificationType: 'CPF',
                                        identificationNumber:
                                            _model.numeroCartaoController2.text,
                                        accessToken:
                                            'APP_USR-5570841106048696-081720-cdd35822f2d7ed41f532c855e0f80fc0-152474592',
                                        publicKey:
                                            'APP_USR-17e52e32-f92f-4151-82dc-560e8fcf27dd',
                                      );
                                      if ((_model.criarTokencard?.succeeded ??
                                          true)) {
                                        _model.gerarPedidoCard =
                                            await CriarPagamentoMPCall.call(
                                          transactionAmount: double.tryParse(
                                              _model
                                                  .valorCartaoController.text),
                                          token: getJsonField(
                                            (_model.criarTokencard?.jsonBody ??
                                                ''),
                                            r'''$.id''',
                                          ).toString(),
                                          firstName: currentUserDisplayName,
                                          lastName: 'Não consta',
                                          email: currentUserEmail,
                                          identificationType: 'CPF',
                                          identificationNumber: _model
                                              .numeroCartaoController2.text,
                                          zipCode:
                                              _model.cepCartaoController.text,
                                          streetName: 'Não consta',
                                          streetNumber:
                                              random_data.randomString(
                                            2,
                                            4,
                                            false,
                                            false,
                                            true,
                                          ),
                                          neighborhood: 'Não consta',
                                          city: 'Não consta',
                                          federalUnit: 'Não consta',
                                          description: 'Doação',
                                          accessToken:
                                              'APP_USR-5570841106048696-081720-cdd35822f2d7ed41f532c855e0f80fc0-152474592',
                                          installments: valueOrDefault<int>(
                                            _model.dropDownValue,
                                            1,
                                          ),
                                        );
                                        if ((_model
                                                .gerarPedidoCard?.succeeded ??
                                            true)) {
                                          var notificacoesRecordReference =
                                              NotificacoesRecord.collection
                                                  .doc();
                                          await notificacoesRecordReference
                                              .set(createNotificacoesRecordData(
                                            titulo:
                                                'Uuuoouu, você fez uma doação!',
                                            descricao:
                                                '${currentUserDisplayName}, estamos muito felizes pela sua excelente atitude. O valor que você doou, será investido em melhorias neste aplicativo. Obrigado pela sua colaboração!',
                                            data: getCurrentTimestamp,
                                            usuario: currentUserReference,
                                            visualizado: false,
                                          ));
                                          _model.doacaorealizadaokcard =
                                              NotificacoesRecord.getDocumentFromData(
                                                  createNotificacoesRecordData(
                                                    titulo:
                                                        'Uuuoouu, você fez uma doação!',
                                                    descricao:
                                                        '${currentUserDisplayName}, estamos muito felizes pela sua excelente atitude. O valor que você doou, será investido em melhorias neste aplicativo. Obrigado pela sua colaboração!',
                                                    data: getCurrentTimestamp,
                                                    usuario:
                                                        currentUserReference,
                                                    visualizado: false,
                                                  ),
                                                  notificacoesRecordReference);

                                          var doacoesRecordReference =
                                              DoacoesRecord.collection.doc();
                                          await doacoesRecordReference
                                              .set(createDoacoesRecordData(
                                            valor: double.tryParse(_model
                                                .valorCartaoController.text),
                                            data: getCurrentTimestamp,
                                            idPedido: getJsonField(
                                              (_model.gerarPedidoCard
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$.id''',
                                            ),
                                            usuario: currentUserReference,
                                          ));
                                          _model.doacaocardok =
                                              DoacoesRecord.getDocumentFromData(
                                                  createDoacoesRecordData(
                                                    valor: double.tryParse(_model
                                                        .valorCartaoController
                                                        .text),
                                                    data: getCurrentTimestamp,
                                                    idPedido: getJsonField(
                                                      (_model.gerarPedidoCard
                                                              ?.jsonBody ??
                                                          ''),
                                                      r'''$.id''',
                                                    ),
                                                    usuario:
                                                        currentUserReference,
                                                  ),
                                                  doacoesRecordReference);
                                          triggerPushNotification(
                                            notificationTitle:
                                                'Parabéns, você realizou uma doação!',
                                            notificationText:
                                                'O valor que você dooou, será investido em melhorias no aplicativo! :)',
                                            scheduledTime: getCurrentTimestamp,
                                            notificationSound: 'default',
                                            userRefs: [currentUserReference!],
                                            initialPageName: 'notificacoes',
                                            parameterData: {},
                                          );

                                          context.goNamed('Homepage');
                                        } else {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text('Falha!'),
                                                content: Text(
                                                    CriarPagamentoMPCall
                                                        .erroMensagem(
                                                  (_model.gerarPedidoCard
                                                          ?.jsonBody ??
                                                      ''),
                                                ).toString()),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('Ok'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        }
                                      }

                                      setState(() {});
                                    },
                                    text: 'Efetuar doação',
                                    options: FFButtonOptions(
                                      height: 40.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Nunito',
                                            color: Colors.white,
                                          ),
                                      elevation: 0.0,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(250.0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
