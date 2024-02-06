import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'amigos_model.dart';
export 'amigos_model.dart';

class AmigosWidget extends StatefulWidget {
  const AmigosWidget({super.key});

  @override
  State<AmigosWidget> createState() => _AmigosWidgetState();
}

class _AmigosWidgetState extends State<AmigosWidget> {
  late AmigosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AmigosModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
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
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 60.0, 16.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      width: 180.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: valueOrDefault<Color>(
                          FFAppState().solicitacoesAmizades == 'amigos'
                              ? FlutterFlowTheme.of(context).primary
                              : Color(0xFF4B39EF),
                          Color(0xFF4B39EF),
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12.0),
                          bottomRight: Radius.circular(0.0),
                          topLeft: Radius.circular(12.0),
                          topRight: Radius.circular(0.0),
                        ),
                      ),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          setState(() {
                            FFAppState().solicitacoesAmizades = 'amigos';
                          });
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'SUA LISTA DE\nAMIGOS',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Nunito',
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: 180.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: valueOrDefault<Color>(
                          FFAppState().solicitacoesAmizades == 'solicitacoes'
                              ? FlutterFlowTheme.of(context).primary
                              : Color(0xFF4B39EF),
                          FlutterFlowTheme.of(context).primary,
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0.0),
                          bottomRight: Radius.circular(12.0),
                          topLeft: Radius.circular(0.0),
                          topRight: Radius.circular(12.0),
                        ),
                      ),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          setState(() {
                            FFAppState().solicitacoesAmizades = 'solicitacoes';
                          });
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'SOLICITAÇÃO DE\nAMIZADE',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Nunito',
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, -1.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 10.0, 16.0, 0.0),
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).height * 0.65,
                  constraints: BoxConstraints(
                    maxWidth: 570.0,
                  ),
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4.0,
                        color: Color(0x33000000),
                        offset: Offset(0.0, 2.0),
                      )
                    ],
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      color: Color(0x2C57636C),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: TextFormField(
                                            controller: _model.textController,
                                            focusNode:
                                                _model.textFieldFocusNode,
                                            onChanged: (_) =>
                                                EasyDebounce.debounce(
                                              '_model.textController',
                                              Duration(milliseconds: 0),
                                              () async {
                                                await queryUserRecordOnce()
                                                    .then(
                                                      (records) => _model
                                                              .simpleSearchResults =
                                                          TextSearch(
                                                        records
                                                            .map(
                                                              (record) =>
                                                                  TextSearchItem
                                                                      .fromTerms(
                                                                          record,
                                                                          [
                                                                    record
                                                                        .email!,
                                                                    record
                                                                        .displayName!,
                                                                    record
                                                                        .apelido!
                                                                  ]),
                                                            )
                                                            .toList(),
                                                      )
                                                              .search(_model
                                                                  .textController
                                                                  .text)
                                                              .map((r) =>
                                                                  r.object)
                                                              .take(100)
                                                              .toList(),
                                                    )
                                                    .onError((_, __) => _model
                                                            .simpleSearchResults =
                                                        [])
                                                    .whenComplete(
                                                        () => setState(() {}));
                                              },
                                            ),
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText:
                                                  'Nome, Apelido ou E-mail',
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium,
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium,
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              prefixIcon: Icon(
                                                Icons.search,
                                              ),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                            validator: _model
                                                .textControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        if (FFAppState().solicitacoesAmizades ==
                                            'amigos')
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 15.0, 0.0, 0.0),
                                            child: AuthUserStreamWidget(
                                              builder: (context) => Builder(
                                                builder: (context) {
                                                  final amigos =
                                                      (currentUserDocument
                                                                  ?.amigos
                                                                  ?.toList() ??
                                                              [])
                                                          .toList();
                                                  return SingleChildScrollView(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: List.generate(
                                                          amigos.length,
                                                          (amigosIndex) {
                                                        final amigosItem =
                                                            amigos[amigosIndex];
                                                        return Visibility(
                                                          visible: functions.busca(
                                                              _model
                                                                  .textController
                                                                  .text,
                                                              amigosItem.id),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        10.0),
                                                            child:
                                                                StreamBuilder<
                                                                    UserRecord>(
                                                              stream: UserRecord
                                                                  .getDocument(
                                                                      amigosItem),
                                                              builder: (context,
                                                                  snapshot) {
                                                                // Customize what your widget looks like when it's loading.
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return Center(
                                                                    child:
                                                                        SizedBox(
                                                                      width:
                                                                          50.0,
                                                                      height:
                                                                          50.0,
                                                                      child:
                                                                          CircularProgressIndicator(
                                                                        valueColor:
                                                                            AlwaysStoppedAnimation<Color>(
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                final containerUserRecord =
                                                                    snapshot
                                                                        .data!;
                                                                return Container(
                                                                  width: double
                                                                      .infinity,
                                                                  height: 60.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10.0),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            5.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            context.pushNamed(
                                                                              'perfilUsuario',
                                                                              queryParameters: {
                                                                                'perfilUsuario': serializeParam(
                                                                                  containerUserRecord.reference,
                                                                                  ParamType.DocumentReference,
                                                                                ),
                                                                              }.withoutNulls,
                                                                            );
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                40.0,
                                                                            height:
                                                                                40.0,
                                                                            clipBehavior:
                                                                                Clip.antiAlias,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              shape: BoxShape.circle,
                                                                            ),
                                                                            child:
                                                                                Image.network(
                                                                              valueOrDefault<String>(
                                                                                containerUserRecord.photoUrl,
                                                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/quiz-u4gc3g/assets/mahzy9grz5da/Auto_Layout_Vertical.png',
                                                                              ),
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10.0,
                                                                                0.0,
                                                                                10.0,
                                                                                0.0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      child: Text(
                                                                                        containerUserRecord.displayName,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Nunito',
                                                                                              fontSize: 16.0,
                                                                                              fontWeight: FontWeight.w600,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      child: Text(
                                                                                        containerUserRecord.email,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Nunito',
                                                                                              fontSize: 9.0,
                                                                                              fontWeight: FontWeight.w300,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        FFButtonWidget(
                                                                          onPressed:
                                                                              () async {
                                                                            if ((currentUserDocument?.amigos?.toList() ?? []).contains(containerUserRecord.reference)) {
                                                                              var confirmDialogResponse = await showDialog<bool>(
                                                                                    context: context,
                                                                                    builder: (alertDialogContext) {
                                                                                      return AlertDialog(
                                                                                        title: Text('Desfazer amizade? '),
                                                                                        content: Text('Você não será mais amigo de ${containerUserRecord.displayName}, deseja desfazer sua amizade?'),
                                                                                        actions: [
                                                                                          TextButton(
                                                                                            onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                            child: Text('Cancelar'),
                                                                                          ),
                                                                                          TextButton(
                                                                                            onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                            child: Text('Confirmar'),
                                                                                          ),
                                                                                        ],
                                                                                      );
                                                                                    },
                                                                                  ) ??
                                                                                  false;
                                                                              if (confirmDialogResponse) {
                                                                                await containerUserRecord.reference.update({
                                                                                  ...mapToFirestore(
                                                                                    {
                                                                                      'amigos': FieldValue.arrayRemove([
                                                                                        currentUserReference
                                                                                      ]),
                                                                                    },
                                                                                  ),
                                                                                });

                                                                                await currentUserReference!.update({
                                                                                  ...mapToFirestore(
                                                                                    {
                                                                                      'amigos': FieldValue.arrayRemove([
                                                                                        containerUserRecord.reference
                                                                                      ]),
                                                                                    },
                                                                                  ),
                                                                                });
                                                                                ScaffoldMessenger.of(context).showSnackBar(
                                                                                  SnackBar(
                                                                                    content: Text(
                                                                                      'Amizade desfeita com sucesso!',
                                                                                      style: GoogleFonts.getFont(
                                                                                        'Roboto',
                                                                                        color: Colors.white,
                                                                                        fontSize: 14.0,
                                                                                      ),
                                                                                    ),
                                                                                    duration: Duration(milliseconds: 2000),
                                                                                    backgroundColor: FlutterFlowTheme.of(context).primary,
                                                                                  ),
                                                                                );
                                                                              }
                                                                            }
                                                                          },
                                                                          text:
                                                                              'Deixar de seguir',
                                                                          options:
                                                                              FFButtonOptions(
                                                                            height:
                                                                                30.0,
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                24.0,
                                                                                0.0,
                                                                                24.0,
                                                                                0.0),
                                                                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                  fontFamily: 'Nunito',
                                                                                  color: Colors.white,
                                                                                  fontSize: 14.0,
                                                                                  fontWeight: FontWeight.normal,
                                                                                ),
                                                                            elevation:
                                                                                0.0,
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: Colors.transparent,
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(250.0),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        );
                                                      }),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        if (FFAppState().solicitacoesAmizades ==
                                            'solicitacoes')
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 20.0, 0.0, 0.0),
                                            child: AuthUserStreamWidget(
                                              builder: (context) => Builder(
                                                builder: (context) {
                                                  final solicitacoes =
                                                      (currentUserDocument
                                                                  ?.pendentes
                                                                  ?.toList() ??
                                                              [])
                                                          .toList();
                                                  return SingleChildScrollView(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: List.generate(
                                                          solicitacoes.length,
                                                          (solicitacoesIndex) {
                                                        final solicitacoesItem =
                                                            solicitacoes[
                                                                solicitacoesIndex];
                                                        return Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      10.0),
                                                          child: StreamBuilder<
                                                              UserRecord>(
                                                            stream: UserRecord
                                                                .getDocument(
                                                                    solicitacoesItem),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 50.0,
                                                                    height:
                                                                        50.0,
                                                                    child:
                                                                        CircularProgressIndicator(
                                                                      valueColor:
                                                                          AlwaysStoppedAnimation<
                                                                              Color>(
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              final containerUserRecord =
                                                                  snapshot
                                                                      .data!;
                                                              return Container(
                                                                width: double
                                                                    .infinity,
                                                                height: 50.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10.0),
                                                                  border: Border
                                                                      .all(
                                                                    color: Color(
                                                                        0xFFCDCDCD),
                                                                  ),
                                                                ),
                                                                child: Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              6.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          InkWell(
                                                                            splashColor:
                                                                                Colors.transparent,
                                                                            focusColor:
                                                                                Colors.transparent,
                                                                            hoverColor:
                                                                                Colors.transparent,
                                                                            highlightColor:
                                                                                Colors.transparent,
                                                                            onTap:
                                                                                () async {
                                                                              context.pushNamed(
                                                                                'perfilUsuario',
                                                                                queryParameters: {
                                                                                  'perfilUsuario': serializeParam(
                                                                                    containerUserRecord.reference,
                                                                                    ParamType.DocumentReference,
                                                                                  ),
                                                                                }.withoutNulls,
                                                                              );
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              width: 30.0,
                                                                              height: 30.0,
                                                                              clipBehavior: Clip.antiAlias,
                                                                              decoration: BoxDecoration(
                                                                                shape: BoxShape.circle,
                                                                              ),
                                                                              child: Image.network(
                                                                                valueOrDefault<String>(
                                                                                  containerUserRecord.photoUrl,
                                                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/quiz-u4gc3g/assets/mahzy9grz5da/Auto_Layout_Vertical.png',
                                                                                ),
                                                                                fit: BoxFit.cover,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              10.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceAround,
                                                                            children: [
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Text(
                                                                                      containerUserRecord.displayName,
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Roboto',
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Text(
                                                                                      containerUserRecord.email,
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Roboto',
                                                                                            fontSize: 9.0,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          await containerUserRecord
                                                                              .reference
                                                                              .update({
                                                                            ...mapToFirestore(
                                                                              {
                                                                                'amigos': FieldValue.arrayUnion([
                                                                                  currentUserReference
                                                                                ]),
                                                                                'solicitacoes_enviado': FieldValue.arrayRemove([
                                                                                  currentUserReference
                                                                                ]),
                                                                              },
                                                                            ),
                                                                          });

                                                                          await currentUserReference!
                                                                              .update({
                                                                            ...mapToFirestore(
                                                                              {
                                                                                'amigos': FieldValue.arrayUnion([
                                                                                  containerUserRecord.reference
                                                                                ]),
                                                                                'pendentes': FieldValue.arrayRemove([
                                                                                  containerUserRecord.reference
                                                                                ]),
                                                                              },
                                                                            ),
                                                                          });

                                                                          var notificacoesRecordReference = NotificacoesRecord
                                                                              .collection
                                                                              .doc();
                                                                          await notificacoesRecordReference
                                                                              .set(createNotificacoesRecordData(
                                                                            titulo:
                                                                                'Você e ${currentUserDisplayName} agora são novos amigos! ',
                                                                            descricao:
                                                                                '${currentUserDisplayName} aceitou sua solicitação de amizade',
                                                                            imagem:
                                                                                valueOrDefault<String>(
                                                                              currentUserPhoto,
                                                                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/quiz-u4gc3g/assets/9vodftdl8gx9/Ellipse_(3).png',
                                                                            ),
                                                                            data:
                                                                                getCurrentTimestamp,
                                                                            usuario:
                                                                                containerUserRecord.reference,
                                                                            usuarioEnviouNotificacao:
                                                                                currentUserReference,
                                                                            visualizado:
                                                                                false,
                                                                          ));
                                                                          _model.aceitarAmizade = NotificacoesRecord.getDocumentFromData(
                                                                              createNotificacoesRecordData(
                                                                                titulo: 'Você e ${currentUserDisplayName} agora são novos amigos! ',
                                                                                descricao: '${currentUserDisplayName} aceitou sua solicitação de amizade',
                                                                                imagem: valueOrDefault<String>(
                                                                                  currentUserPhoto,
                                                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/quiz-u4gc3g/assets/9vodftdl8gx9/Ellipse_(3).png',
                                                                                ),
                                                                                data: getCurrentTimestamp,
                                                                                usuario: containerUserRecord.reference,
                                                                                usuarioEnviouNotificacao: currentUserReference,
                                                                                visualizado: false,
                                                                              ),
                                                                              notificacoesRecordReference);
                                                                          if (containerUserRecord.receberNotificacoes ==
                                                                              true) {
                                                                            triggerPushNotification(
                                                                              notificationTitle: 'Você e ${currentUserDisplayName} agora são novos amigos! ',
                                                                              notificationText: '${currentUserDisplayName} aceitou sua solicitação de amizade',
                                                                              scheduledTime: getCurrentTimestamp,
                                                                              userRefs: [
                                                                                containerUserRecord.reference
                                                                              ],
                                                                              initialPageName: 'notificacoes',
                                                                              parameterData: {},
                                                                            );
                                                                            ScaffoldMessenger.of(context).showSnackBar(
                                                                              SnackBar(
                                                                                content: Text(
                                                                                  'Você e ${containerUserRecord.displayName} agora são amigos! ',
                                                                                  style: GoogleFonts.getFont(
                                                                                    'Roboto',
                                                                                    color: Colors.white,
                                                                                    fontSize: 14.0,
                                                                                  ),
                                                                                ),
                                                                                duration: Duration(milliseconds: 3000),
                                                                                backgroundColor: FlutterFlowTheme.of(context).primary,
                                                                              ),
                                                                            );
                                                                          } else {
                                                                            ScaffoldMessenger.of(context).showSnackBar(
                                                                              SnackBar(
                                                                                content: Text(
                                                                                  'Você e ${containerUserRecord.displayName} agora são amigos! ',
                                                                                  style: GoogleFonts.getFont(
                                                                                    'Roboto',
                                                                                    color: Colors.white,
                                                                                    fontSize: 14.0,
                                                                                  ),
                                                                                ),
                                                                                duration: Duration(milliseconds: 3000),
                                                                                backgroundColor: FlutterFlowTheme.of(context).primary,
                                                                              ),
                                                                            );
                                                                          }

                                                                          setState(
                                                                              () {});
                                                                        },
                                                                        child:
                                                                            Text(
                                                                          'aceitar',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Nunito',
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                fontSize: 12.0,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                        child:
                                                                            InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            await currentUserReference!.update({
                                                                              ...mapToFirestore(
                                                                                {
                                                                                  'pendentes': FieldValue.arrayRemove([
                                                                                    containerUserRecord.reference
                                                                                  ]),
                                                                                },
                                                                              ),
                                                                            });

                                                                            await containerUserRecord.reference.update({
                                                                              ...mapToFirestore(
                                                                                {
                                                                                  'solicitacoes_enviado': FieldValue.arrayRemove([
                                                                                    currentUserReference
                                                                                  ]),
                                                                                },
                                                                              ),
                                                                            });
                                                                            ScaffoldMessenger.of(context).showSnackBar(
                                                                              SnackBar(
                                                                                content: Text(
                                                                                  'Solicitação negada!',
                                                                                  style: GoogleFonts.getFont(
                                                                                    'Roboto',
                                                                                    color: Colors.white,
                                                                                    fontSize: 15.0,
                                                                                  ),
                                                                                ),
                                                                                duration: Duration(milliseconds: 2000),
                                                                                backgroundColor: FlutterFlowTheme.of(context).primary,
                                                                              ),
                                                                            );
                                                                          },
                                                                          child:
                                                                              Text(
                                                                            'recusar',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Nunito',
                                                                                  color: FlutterFlowTheme.of(context).error,
                                                                                  fontSize: 12.0,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        );
                                                      }),
                                                    ),
                                                  );
                                                },
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
