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
import 'adm_usuarios_model.dart';
export 'adm_usuarios_model.dart';

class AdmUsuariosWidget extends StatefulWidget {
  const AdmUsuariosWidget({super.key});

  @override
  State<AdmUsuariosWidget> createState() => _AdmUsuariosWidgetState();
}

class _AdmUsuariosWidgetState extends State<AdmUsuariosWidget> {
  late AdmUsuariosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdmUsuariosModel());

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
                              return Container(
                                width: double.infinity,
                                height: 100.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 12.0,
                                      color: Color(0x33000000),
                                      offset: Offset(0.0, 5.0),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5.0, 0.0, 0.0, 0.0),
                                        child: InkWell(
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
                                                mainAxisSize: MainAxisSize.max,
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
                                                                FontWeight.w500,
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
                                                              fontSize: 11.0,
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
                                      AuthUserStreamWidget(
                                        builder: (context) => FFButtonWidget(
                                          onPressed: () async {
                                            if ((currentUserDocument
                                                        ?.administradoresConvidados
                                                        ?.toList() ??
                                                    [])
                                                .contains(containerUserRecord
                                                    .reference)) {
                                              await currentUserReference!
                                                  .update({
                                                ...mapToFirestore(
                                                  {
                                                    'administradores_convidados':
                                                        FieldValue.arrayRemove([
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
                                                    'Convite cancelado! ',
                                                    style: GoogleFonts.getFont(
                                                      'Roboto',
                                                      color: Colors.white,
                                                      fontSize: 15.0,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 2000),
                                                  backgroundColor:
                                                      Color(0xFFFF000E),
                                                ),
                                              );
                                            } else if ((currentUserDocument
                                                        ?.meusAdministradores
                                                        ?.toList() ??
                                                    [])
                                                .contains(containerUserRecord
                                                    .reference)) {
                                              await containerUserRecord
                                                  .reference
                                                  .update(createUserRecordData(
                                                adm: false,
                                              ));

                                              await currentUserReference!
                                                  .update({
                                                ...mapToFirestore(
                                                  {
                                                    'meus_administradores':
                                                        FieldValue.arrayRemove([
                                                      containerUserRecord
                                                          .reference
                                                    ]),
                                                  },
                                                ),
                                              });
                                            } else {
                                              var notificacoesRecordReference =
                                                  NotificacoesRecord.collection
                                                      .doc();
                                              await notificacoesRecordReference
                                                  .set(
                                                      createNotificacoesRecordData(
                                                titulo:
                                                    'Quer se tornar um ADM?',
                                                descricao:
                                                    '${containerUserRecord.displayName}, você gostaria de se tornar um dos administradores do aplicativo?',
                                                data: getCurrentTimestamp,
                                                usuario: containerUserRecord
                                                    .reference,
                                                usuarioEnviouNotificacao:
                                                    currentUserReference,
                                                visualizado: false,
                                                botaoAceitarAdm: true,
                                                botaoRecusarAdm: true,
                                              ));
                                              _model.convidarparaadm =
                                                  NotificacoesRecord
                                                      .getDocumentFromData(
                                                          createNotificacoesRecordData(
                                                            titulo:
                                                                'Quer se tornar um ADM?',
                                                            descricao:
                                                                '${containerUserRecord.displayName}, você gostaria de se tornar um dos administradores do aplicativo?',
                                                            data:
                                                                getCurrentTimestamp,
                                                            usuario:
                                                                containerUserRecord
                                                                    .reference,
                                                            usuarioEnviouNotificacao:
                                                                currentUserReference,
                                                            visualizado: false,
                                                            botaoAceitarAdm:
                                                                true,
                                                            botaoRecusarAdm:
                                                                true,
                                                          ),
                                                          notificacoesRecordReference);

                                              await currentUserReference!
                                                  .update({
                                                ...mapToFirestore(
                                                  {
                                                    'administradores_convidados':
                                                        FieldValue.arrayUnion([
                                                      containerUserRecord
                                                          .reference
                                                    ]),
                                                  },
                                                ),
                                              });
                                              if (containerUserRecord
                                                      .receberNotificacoes ==
                                                  true) {
                                                triggerPushNotification(
                                                  notificationTitle:
                                                      'Quer se tornar um ADM?',
                                                  notificationText:
                                                      '${containerUserRecord.displayName}, você gostaria de se tornar um dos administradores do aplicativo?',
                                                  scheduledTime:
                                                      getCurrentTimestamp,
                                                  notificationSound: 'default',
                                                  userRefs: [
                                                    containerUserRecord
                                                        .reference
                                                  ],
                                                  initialPageName:
                                                      'notificacoes',
                                                  parameterData: {},
                                                );
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Convite enviado!',
                                                      style:
                                                          GoogleFonts.getFont(
                                                        'Roboto',
                                                        color: Colors.white,
                                                        fontSize: 14.0,
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
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Convite enviado!',
                                                      style:
                                                          GoogleFonts.getFont(
                                                        'Roboto',
                                                        color: Colors.white,
                                                        fontSize: 14.0,
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
                                            if ((currentUserDocument
                                                        ?.administradoresConvidados
                                                        ?.toList() ??
                                                    [])
                                                .contains(containerUserRecord
                                                    .reference)) {
                                              return 'CANCELAR';
                                            } else if ((currentUserDocument
                                                        ?.meusAdministradores
                                                        ?.toList() ??
                                                    [])
                                                .contains(containerUserRecord
                                                    .reference)) {
                                              return 'DESFAZER ADM';
                                            } else {
                                              return 'TORNAR ADM';
                                            }
                                          }(),
                                          options: FFButtonOptions(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Nunito',
                                                      color: Colors.white,
                                                      fontSize: 12.0,
                                                      fontWeight:
                                                          FontWeight.normal,
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
