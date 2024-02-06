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
import 'todosusuarios_model.dart';
export 'todosusuarios_model.dart';

class TodosusuariosWidget extends StatefulWidget {
  const TodosusuariosWidget({
    super.key,
    this.resultado,
  });

  final String? resultado;

  @override
  State<TodosusuariosWidget> createState() => _TodosusuariosWidgetState();
}

class _TodosusuariosWidgetState extends State<TodosusuariosWidget> {
  late TodosusuariosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TodosusuariosModel());

    _model.textController ??= TextEditingController(text: widget.resultado);
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
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 60.0, 20.0, 20.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
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
                      Icons.arrow_back_ios_new,
                      color: Colors.black,
                      size: 24.0,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 0.0),
                      child: Text(
                        'Usuários',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Nunito',
                              fontSize: 20.0,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(15.0, 20.0, 15.0, 15.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      width: 100.0,
                      height: 45.0,
                      decoration: BoxDecoration(),
                      child: TextFormField(
                        controller: _model.textController,
                        focusNode: _model.textFieldFocusNode,
                        onChanged: (_) => EasyDebounce.debounce(
                          '_model.textController',
                          Duration(milliseconds: 0),
                          () => setState(() {}),
                        ),
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Pesquisa',
                          labelStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Nunito',
                                    color: Colors.white,
                                    fontSize: 15.0,
                                  ),
                          hintStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Nunito',
                                    color: Colors.white,
                                    fontSize: 15.0,
                                  ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          filled: true,
                          fillColor: Color(0xFF60A5FA),
                          suffixIcon: Icon(
                            Icons.search_outlined,
                            color: Colors.white,
                            size: 30.0,
                          ),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Nunito',
                              color: Colors.white,
                              fontSize: 15.0,
                            ),
                        validator:
                            _model.textControllerValidator.asValidator(context),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            StreamBuilder<List<UserRecord>>(
              stream: queryUserRecord(),
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
                List<UserRecord> columnUserRecordList = snapshot.data!
                    .where((u) => u.uid != currentUserUid)
                    .toList();
                return SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: List.generate(columnUserRecordList.length,
                        (columnIndex) {
                      final columnUserRecord =
                          columnUserRecordList[columnIndex];
                      return Visibility(
                        visible: functions.busca(_model.textController.text,
                            '${columnUserRecord.email}${columnUserRecord.displayName}'),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 20.0, 20.0, 0.0),
                          child: StreamBuilder<UserRecord>(
                            stream: UserRecord.getDocument(
                                columnUserRecord.reference),
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
                              final containerUserRecord = snapshot.data!;
                              return InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
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
                                child: Container(
                                  width: double.infinity,
                                  height: 60.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
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
                                          child: Container(
                                            width: 40.0,
                                            height: 40.0,
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
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 10.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        containerUserRecord
                                                            .displayName,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Nunito',
                                                              fontSize: 16.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          containerUserRecord
                                                              .email,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Nunito',
                                                                fontSize: 12.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300,
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
                                        if (containerUserRecord.reference !=
                                            currentUserReference)
                                          AuthUserStreamWidget(
                                            builder: (context) =>
                                                FFButtonWidget(
                                              onPressed: () async {
                                                if ((currentUserDocument?.amigos
                                                            ?.toList() ??
                                                        [])
                                                    .contains(
                                                        containerUserRecord
                                                            .reference)) {
                                                  await containerUserRecord
                                                      .reference
                                                      .update({
                                                    ...mapToFirestore(
                                                      {
                                                        'amigos': FieldValue
                                                            .arrayRemove([
                                                          currentUserReference
                                                        ]),
                                                      },
                                                    ),
                                                  });

                                                  await currentUserReference!
                                                      .update({
                                                    ...mapToFirestore(
                                                      {
                                                        'amigos': FieldValue
                                                            .arrayRemove([
                                                          containerUserRecord
                                                              .reference
                                                        ]),
                                                      },
                                                    ),
                                                  });
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Amizade desfeita!',
                                                        style:
                                                            GoogleFonts.getFont(
                                                          'Roboto',
                                                          color: Colors.white,
                                                          fontSize: 15.0,
                                                        ),
                                                      ),
                                                      duration: Duration(
                                                          milliseconds: 2000),
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                    ),
                                                  );
                                                } else if ((currentUserDocument
                                                            ?.solicitacoesEnviado
                                                            ?.toList() ??
                                                        [])
                                                    .contains(
                                                        containerUserRecord
                                                            .reference)) {
                                                  await currentUserReference!
                                                      .update({
                                                    ...mapToFirestore(
                                                      {
                                                        'solicitacoes_enviado':
                                                            FieldValue
                                                                .arrayRemove([
                                                          containerUserRecord
                                                              .reference
                                                        ]),
                                                      },
                                                    ),
                                                  });

                                                  await containerUserRecord
                                                      .reference
                                                      .update({
                                                    ...mapToFirestore(
                                                      {
                                                        'pendentes': FieldValue
                                                            .arrayRemove([
                                                          currentUserReference
                                                        ]),
                                                      },
                                                    ),
                                                  });
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Solicitação cancelada!',
                                                        style:
                                                            GoogleFonts.getFont(
                                                          'Roboto',
                                                          color: Colors.white,
                                                          fontSize: 15.0,
                                                        ),
                                                      ),
                                                      duration: Duration(
                                                          milliseconds: 2000),
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                    ),
                                                  );
                                                } else {
                                                  await containerUserRecord
                                                      .reference
                                                      .update({
                                                    ...mapToFirestore(
                                                      {
                                                        'pendentes': FieldValue
                                                            .arrayUnion([
                                                          currentUserReference
                                                        ]),
                                                      },
                                                    ),
                                                  });

                                                  await currentUserReference!
                                                      .update({
                                                    ...mapToFirestore(
                                                      {
                                                        'solicitacoes_enviado':
                                                            FieldValue
                                                                .arrayUnion([
                                                          containerUserRecord
                                                              .reference
                                                        ]),
                                                      },
                                                    ),
                                                  });

                                                  var notificacoesRecordReference =
                                                      NotificacoesRecord
                                                          .collection
                                                          .doc();
                                                  await notificacoesRecordReference
                                                      .set(
                                                          createNotificacoesRecordData(
                                                    titulo:
                                                        '${currentUserDisplayName} enviou uma solicitação de amizade',
                                                    descricao:
                                                        'Olá ${containerUserRecord.displayName}, vamos ser amigos?',
                                                    imagem:
                                                        valueOrDefault<String>(
                                                      currentUserPhoto,
                                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/quiz-u4gc3g/assets/9vodftdl8gx9/Ellipse_(3).png',
                                                    ),
                                                    data: getCurrentTimestamp,
                                                    usuario: containerUserRecord
                                                        .reference,
                                                    usuarioEnviouNotificacao:
                                                        currentUserReference,
                                                    visualizado: false,
                                                    botaoAceitar: true,
                                                    botaoRecusar: true,
                                                  ));
                                                  _model.adicionaramigo =
                                                      NotificacoesRecord
                                                          .getDocumentFromData(
                                                              createNotificacoesRecordData(
                                                                titulo:
                                                                    '${currentUserDisplayName} enviou uma solicitação de amizade',
                                                                descricao:
                                                                    'Olá ${containerUserRecord.displayName}, vamos ser amigos?',
                                                                imagem:
                                                                    valueOrDefault<
                                                                        String>(
                                                                  currentUserPhoto,
                                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/quiz-u4gc3g/assets/9vodftdl8gx9/Ellipse_(3).png',
                                                                ),
                                                                data:
                                                                    getCurrentTimestamp,
                                                                usuario:
                                                                    containerUserRecord
                                                                        .reference,
                                                                usuarioEnviouNotificacao:
                                                                    currentUserReference,
                                                                visualizado:
                                                                    false,
                                                                botaoAceitar:
                                                                    true,
                                                                botaoRecusar:
                                                                    true,
                                                              ),
                                                              notificacoesRecordReference);
                                                  if (containerUserRecord
                                                          .receberNotificacoes ==
                                                      true) {
                                                    triggerPushNotification(
                                                      notificationTitle:
                                                          '${currentUserDisplayName} enviou uma solicitação de amizade',
                                                      notificationText:
                                                          'Vamos ser amigos?',
                                                      notificationSound:
                                                          'default',
                                                      userRefs: [
                                                        containerUserRecord
                                                            .reference
                                                      ],
                                                      initialPageName:
                                                          'notificacoes',
                                                      parameterData: {},
                                                    );
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Solicitação enviada com sucesso!',
                                                          style: GoogleFonts
                                                              .getFont(
                                                            'Roboto',
                                                            color: Colors.white,
                                                            fontSize: 15.0,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 2000),
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                      ),
                                                    );
                                                  } else {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Solicitação enviada com sucesso!',
                                                          style: GoogleFonts
                                                              .getFont(
                                                            'Roboto',
                                                            color: Colors.white,
                                                            fontSize: 15.0,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 2000),
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                      ),
                                                    );
                                                  }
                                                }

                                                setState(() {});
                                              },
                                              text: () {
                                                if ((currentUserDocument?.amigos
                                                            ?.toList() ??
                                                        [])
                                                    .contains(
                                                        containerUserRecord
                                                            .reference)) {
                                                  return 'Amigos';
                                                } else if ((currentUserDocument
                                                            ?.solicitacoesEnviado
                                                            ?.toList() ??
                                                        [])
                                                    .contains(
                                                        containerUserRecord
                                                            .reference)) {
                                                  return 'Solicitado';
                                                } else {
                                                  return 'Seguir';
                                                }
                                              }(),
                                              options: FFButtonOptions(
                                                height: 30.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 0.0, 24.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Nunito',
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                elevation: 0.0,
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        250.0),
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
                      );
                    }),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
