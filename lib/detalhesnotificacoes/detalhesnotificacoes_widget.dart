import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'detalhesnotificacoes_model.dart';
export 'detalhesnotificacoes_model.dart';

class DetalhesnotificacoesWidget extends StatefulWidget {
  const DetalhesnotificacoesWidget({
    super.key,
    required this.detalhesnotificacoes,
  });

  final DocumentReference? detalhesnotificacoes;

  @override
  State<DetalhesnotificacoesWidget> createState() =>
      _DetalhesnotificacoesWidgetState();
}

class _DetalhesnotificacoesWidgetState
    extends State<DetalhesnotificacoesWidget> {
  late DetalhesnotificacoesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetalhesnotificacoesModel());
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

    return StreamBuilder<NotificacoesRecord>(
      stream: NotificacoesRecord.getDocument(widget.detalhesnotificacoes!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        final detalhesnotificacoesNotificacoesRecord = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: Colors.white,
          body: Column(
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
                        Icons.arrow_back,
                        color: Colors.black,
                        size: 28.0,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 0.0),
                        child: Text(
                          'Detalhes',
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
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
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 15.0, 20.0, 0.0),
                child: Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  color: Colors.white,
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).primary,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    detalhesnotificacoesNotificacoesRecord
                                        .titulo,
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ),
                                if (detalhesnotificacoesNotificacoesRecord
                                            .imagem !=
                                        null &&
                                    detalhesnotificacoesNotificacoesRecord
                                            .imagem !=
                                        '')
                                  Container(
                                    width: 50.0,
                                    height: 50.0,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.network(
                                      valueOrDefault<String>(
                                        detalhesnotificacoesNotificacoesRecord
                                            .imagem,
                                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/quiz-u4gc3g/assets/mahzy9grz5da/Auto_Layout_Vertical.png',
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Text(
                                    detalhesnotificacoesNotificacoesRecord
                                        .descricao,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Nunito',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Text(
                                    '${dateTimeFormat('d/M/y', detalhesnotificacoesNotificacoesRecord.data)}/${dateTimeFormat('Hm', detalhesnotificacoesNotificacoesRecord.data)}',
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (detalhesnotificacoesNotificacoesRecord
                                  .botaoAceitar ==
                              true)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 8.0, 8.0, 20.0),
                              child: StreamBuilder<UserRecord>(
                                stream: UserRecord.getDocument(
                                    detalhesnotificacoesNotificacoesRecord
                                        .usuarioEnviouNotificacao!),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  final rowUserRecord = snapshot.data!;
                                  return Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      if (detalhesnotificacoesNotificacoesRecord
                                              .botaoAceitar ==
                                          true)
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 8.0, 0.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              await detalhesnotificacoesNotificacoesRecord
                                                  .reference
                                                  .update(
                                                      createNotificacoesRecordData(
                                                botaoAceitar: false,
                                                botaoRecusar: false,
                                              ));

                                              await currentUserReference!
                                                  .update({
                                                ...mapToFirestore(
                                                  {
                                                    'pendentes':
                                                        FieldValue.arrayRemove([
                                                      rowUserRecord.reference
                                                    ]),
                                                    'amigos':
                                                        FieldValue.arrayUnion([
                                                      rowUserRecord.reference
                                                    ]),
                                                  },
                                                ),
                                              });

                                              await rowUserRecord.reference
                                                  .update({
                                                ...mapToFirestore(
                                                  {
                                                    'amigos':
                                                        FieldValue.arrayUnion([
                                                      currentUserReference
                                                    ]),
                                                    'solicitacoes_enviado':
                                                        FieldValue.arrayRemove([
                                                      currentUserReference
                                                    ]),
                                                  },
                                                ),
                                              });
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Agora você e ${rowUserRecord.displayName} são amigos!',
                                                    style: GoogleFonts.getFont(
                                                      'Roboto',
                                                      color: Colors.white,
                                                      fontSize: 15.0,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 3000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                ),
                                              );
                                            },
                                            text: 'Aceitar',
                                            options: FFButtonOptions(
                                              height: 35.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Nunito',
                                                        color: Colors.white,
                                                        fontSize: 16.0,
                                                      ),
                                              elevation: 0.0,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                          ),
                                        ),
                                      if (detalhesnotificacoesNotificacoesRecord
                                              .botaoRecusar ==
                                          true)
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 0.0, 0.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              await rowUserRecord.reference
                                                  .update({
                                                ...mapToFirestore(
                                                  {
                                                    'solicitacoes_enviado':
                                                        FieldValue.arrayRemove([
                                                      currentUserReference
                                                    ]),
                                                  },
                                                ),
                                              });

                                              await currentUserReference!
                                                  .update({
                                                ...mapToFirestore(
                                                  {
                                                    'pendentes':
                                                        FieldValue.arrayRemove([
                                                      rowUserRecord.reference
                                                    ]),
                                                  },
                                                ),
                                              });

                                              await detalhesnotificacoesNotificacoesRecord
                                                  .reference
                                                  .update(
                                                      createNotificacoesRecordData(
                                                botaoAceitar: false,
                                                botaoRecusar: false,
                                              ));
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Solicitação recusada!',
                                                    style: GoogleFonts.getFont(
                                                      'Roboto',
                                                      color: Colors.white,
                                                      fontSize: 15.0,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 3000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                ),
                                              );
                                            },
                                            text: 'Recusar',
                                            options: FFButtonOptions(
                                              height: 35.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: Color(0xFFFF000E),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Nunito',
                                                        color: Colors.white,
                                                        fontSize: 16.0,
                                                      ),
                                              elevation: 0.0,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                          ),
                                        ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          if (detalhesnotificacoesNotificacoesRecord
                                  .botaoRecusarAdm ==
                              true)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 8.0, 8.0, 20.0),
                              child: StreamBuilder<UserRecord>(
                                stream: UserRecord.getDocument(
                                    detalhesnotificacoesNotificacoesRecord
                                        .usuarioEnviouNotificacao!),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  final rowUserRecord = snapshot.data!;
                                  return Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      if (detalhesnotificacoesNotificacoesRecord
                                              .botaoAceitarAdm ==
                                          true)
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 8.0, 0.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              await rowUserRecord.reference
                                                  .update({
                                                ...mapToFirestore(
                                                  {
                                                    'meus_administradores':
                                                        FieldValue.arrayUnion([
                                                      currentUserReference
                                                    ]),
                                                    'administradores_convidados':
                                                        FieldValue.arrayRemove([
                                                      currentUserReference
                                                    ]),
                                                  },
                                                ),
                                              });

                                              await currentUserReference!
                                                  .update(createUserRecordData(
                                                adm: true,
                                              ));

                                              await detalhesnotificacoesNotificacoesRecord
                                                  .reference
                                                  .update(
                                                      createNotificacoesRecordData(
                                                botaoAceitarAdm: false,
                                                botaoRecusarAdm: false,
                                              ));
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Agora você é um administrador, novas funções liberadas para você!',
                                                    style: GoogleFonts.getFont(
                                                      'Roboto',
                                                      color: Colors.white,
                                                      fontSize: 15.0,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 3000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                ),
                                              );
                                            },
                                            text: 'Sim',
                                            options: FFButtonOptions(
                                              height: 35.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Nunito',
                                                        color: Colors.white,
                                                        fontSize: 16.0,
                                                      ),
                                              elevation: 0.0,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                          ),
                                        ),
                                      if (detalhesnotificacoesNotificacoesRecord
                                              .botaoRecusarAdm ==
                                          true)
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 0.0, 0.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              await rowUserRecord.reference
                                                  .update({
                                                ...mapToFirestore(
                                                  {
                                                    'administradores_convidados':
                                                        FieldValue.arrayRemove([
                                                      currentUserReference
                                                    ]),
                                                  },
                                                ),
                                              });

                                              await detalhesnotificacoesNotificacoesRecord
                                                  .reference
                                                  .update(
                                                      createNotificacoesRecordData(
                                                botaoAceitarAdm: false,
                                                botaoRecusarAdm: false,
                                              ));
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Solicitação recusada!',
                                                    style: GoogleFonts.getFont(
                                                      'Roboto',
                                                      color: Colors.white,
                                                      fontSize: 15.0,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 3000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                ),
                                              );
                                            },
                                            text: 'Não',
                                            options: FFButtonOptions(
                                              height: 35.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: Color(0xFFFF000E),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Nunito',
                                                        color: Colors.white,
                                                        fontSize: 16.0,
                                                      ),
                                              elevation: 0.0,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                          ),
                                        ),
                                    ],
                                  );
                                },
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
        );
      },
    );
  }
}
