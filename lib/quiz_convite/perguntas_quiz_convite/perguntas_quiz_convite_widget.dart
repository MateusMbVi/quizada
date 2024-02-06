import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'perguntas_quiz_convite_model.dart';
export 'perguntas_quiz_convite_model.dart';

class PerguntasQuizConviteWidget extends StatefulWidget {
  const PerguntasQuizConviteWidget({
    super.key,
    this.perguntasQuiz,
    this.identificacao,
    this.convite,
  });

  final DocumentReference? perguntasQuiz;
  final String? identificacao;
  final DocumentReference? convite;

  @override
  State<PerguntasQuizConviteWidget> createState() =>
      _PerguntasQuizConviteWidgetState();
}

class _PerguntasQuizConviteWidgetState
    extends State<PerguntasQuizConviteWidget> {
  late PerguntasQuizConviteModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PerguntasQuizConviteModel());
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

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: StreamBuilder<List<PerguntasRecord>>(
                stream: queryPerguntasRecord(
                  queryBuilder: (perguntasRecord) => perguntasRecord.where(
                    'identificacao',
                    arrayContains: widget.identificacao,
                  ),
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
                  List<PerguntasRecord> perguntasPerguntasRecordList =
                      snapshot.data!;
                  return Container(
                    width: double.infinity,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                      child: StreamBuilder<List<PerguntasRecord>>(
                        stream: queryPerguntasRecord(
                          queryBuilder: (perguntasRecord) =>
                              perguntasRecord.where(
                            'texto_pergunta',
                            isEqualTo: functions
                                .retornaPerguntaAtual(
                                    FFAppState().perguntaAtual,
                                    perguntasPerguntasRecordList.toList())
                                .textoPergunta,
                          ),
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
                          List<PerguntasRecord> columnPerguntasRecordList =
                              snapshot.data!;
                          // Return an empty Container when the item does not exist.
                          if (snapshot.data!.isEmpty) {
                            return Container();
                          }
                          final columnPerguntasRecord =
                              columnPerguntasRecordList.isNotEmpty
                                  ? columnPerguntasRecordList.first
                                  : null;
                          return SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: Colors.transparent,
                                  elevation: 0.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(12.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 0.0, 20.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 10.0, 0.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    var confirmDialogResponse =
                                                        await showDialog<bool>(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return AlertDialog(
                                                                  title: Text(
                                                                      'Sair do jogo?'),
                                                                  content: Text(
                                                                      'Você quer para por aqui? Você pode continuar mais tarde'),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed: () => Navigator.pop(
                                                                          alertDialogContext,
                                                                          false),
                                                                      child: Text(
                                                                          'Cancelar'),
                                                                    ),
                                                                    TextButton(
                                                                      onPressed: () => Navigator.pop(
                                                                          alertDialogContext,
                                                                          true),
                                                                      child: Text(
                                                                          'Confirmar'),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            ) ??
                                                            false;
                                                    if (confirmDialogResponse) {
                                                      context
                                                          .goNamed('Homepage');
                                                    }
                                                  },
                                                  child: Icon(
                                                    Icons.close,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 35.0,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 10.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              if (columnPerguntasRecord
                                                          ?.imagem ==
                                                      null ||
                                                  columnPerguntasRecord
                                                          ?.imagem ==
                                                      '')
                                                Lottie.asset(
                                                  'assets/lottie_animations/Animation_-_1698150960498.json',
                                                  width: 250.0,
                                                  height: 230.0,
                                                  fit: BoxFit.cover,
                                                  animate: true,
                                                ),
                                              if (columnPerguntasRecord
                                                          ?.imagem !=
                                                      null &&
                                                  columnPerguntasRecord
                                                          ?.imagem !=
                                                      '')
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 40.0,
                                                                0.0, 0.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.network(
                                                        columnPerguntasRecord!
                                                            .imagem,
                                                        width: 300.0,
                                                        height: 150.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 10.0, 10.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 5.0, 0.0, 5.0),
                                                  child: Card(
                                                    clipBehavior: Clip
                                                        .antiAliasWithSaveLayer,
                                                    color: Colors.transparent,
                                                    elevation: 0.0,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    child: Text(
                                                      columnPerguntasRecord!
                                                          .textoPergunta,
                                                      textAlign:
                                                          TextAlign.justify,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Urbanist',
                                                            color: Colors.black,
                                                            fontSize: 18.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Builder(
                                          builder: (context) {
                                            final alternativas = functions
                                                .embaralharAlternativasCopy(
                                                    columnPerguntasRecord!
                                                        .alternativas
                                                        .toList())
                                                .toList();
                                            return ListView.builder(
                                              padding: EdgeInsets.zero,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount: alternativas.length,
                                              itemBuilder:
                                                  (context, alternativasIndex) {
                                                final alternativasItem =
                                                    alternativas[
                                                        alternativasIndex];
                                                return Visibility(
                                                  visible: alternativasItem !=
                                                          null &&
                                                      alternativasItem != '',
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 10.0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        setState(() {
                                                          FFAppState()
                                                                  .alternativaSelecionada =
                                                              alternativasItem;
                                                          FFAppState()
                                                                  .selectIndex =
                                                              alternativasIndex;
                                                          FFAppState()
                                                                  .respostaEscrita =
                                                              alternativasItem;
                                                        });
                                                      },
                                                      child: Container(
                                                        width: 100.0,
                                                        height: 40.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      13.0),
                                                          border: Border.all(
                                                            color: FFAppState()
                                                                        .alternativaSelecionada ==
                                                                    columnPerguntasRecord
                                                                        ?.correta
                                                                ? Color(
                                                                    0xFF09F800)
                                                                : Color(
                                                                    0xFFE5E5E5),
                                                            width: 1.0,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  5.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Expanded(
                                                                child: Text(
                                                                  alternativasItem,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                        if (FFAppState()
                                                    .alternativaSelecionada !=
                                                null &&
                                            FFAppState()
                                                    .alternativaSelecionada !=
                                                '')
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 20.0, 0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(10.0, 10.0,
                                                          10.0, 20.0),
                                                  child:
                                                      StreamBuilder<QuizRecord>(
                                                    stream: QuizRecord
                                                        .getDocument(widget
                                                            .perguntasQuiz!),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 50.0,
                                                            height: 50.0,
                                                            child:
                                                                CircularProgressIndicator(
                                                              valueColor:
                                                                  AlwaysStoppedAnimation<
                                                                      Color>(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      final rowQuizRecord =
                                                          snapshot.data!;
                                                      return Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                              child: StreamBuilder<
                                                                  List<
                                                                      RespostasRecord>>(
                                                                stream:
                                                                    queryRespostasRecord(
                                                                  queryBuilder: (respostasRecord) =>
                                                                      respostasRecord
                                                                          .where(
                                                                            'quiz',
                                                                            isEqualTo:
                                                                                widget.perguntasQuiz,
                                                                          )
                                                                          .where(
                                                                            'usuario',
                                                                            isEqualTo:
                                                                                currentUserReference,
                                                                          )
                                                                          .where(
                                                                            'pergunta',
                                                                            isEqualTo:
                                                                                columnPerguntasRecord?.reference,
                                                                          ),
                                                                  singleRecord:
                                                                      true,
                                                                ),
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
                                                                            FlutterFlowTheme.of(context).primary,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  List<RespostasRecord>
                                                                      buttonRespostasRecordList =
                                                                      snapshot
                                                                          .data!;
                                                                  final buttonRespostasRecord = buttonRespostasRecordList
                                                                          .isNotEmpty
                                                                      ? buttonRespostasRecordList
                                                                          .first
                                                                      : null;
                                                                  return FFButtonWidget(
                                                                    onPressed:
                                                                        () async {
                                                                      var _shouldSetState =
                                                                          false;
                                                                      _model.retornarProximaPergunta =
                                                                          await actions
                                                                              .retornarProximaPergunta(
                                                                        perguntasPerguntasRecordList
                                                                            .toList(),
                                                                        FFAppState()
                                                                            .perguntaAtual,
                                                                      );
                                                                      _shouldSetState =
                                                                          true;
                                                                      if (FFAppState()
                                                                              .perguntasFeitas
                                                                              .length <
                                                                          perguntasPerguntasRecordList
                                                                              .length) {
                                                                        if (FFAppState().alternativaSelecionada ==
                                                                            columnPerguntasRecord?.correta) {
                                                                          setState(
                                                                              () {
                                                                            FFAppState().alternativasAleatorias =
                                                                                functions.embaralharAlternativas(columnPerguntasRecord!.alternativas.toList()).toList().cast<String>();
                                                                          });
                                                                          setState(
                                                                              () {
                                                                            FFAppState().addToPontosUsuariosLista(1);
                                                                          });
                                                                        } else {
                                                                          setState(
                                                                              () {
                                                                            FFAppState().alternativasAleatorias =
                                                                                functions.embaralharAlternativas(columnPerguntasRecord!.alternativas.toList()).toList().cast<String>();
                                                                          });
                                                                          setState(
                                                                              () {
                                                                            FFAppState().removeFromPontosUsuariosLista(1);
                                                                          });
                                                                        }

                                                                        if (buttonRespostasRecord !=
                                                                            null) {
                                                                          await buttonRespostasRecord!
                                                                              .reference
                                                                              .update(createRespostasRecordData(
                                                                            alternativa:
                                                                                FFAppState().alternativaSelecionada,
                                                                          ));
                                                                        } else {
                                                                          var respostasRecordReference1 = RespostasRecord
                                                                              .collection
                                                                              .doc();
                                                                          await respostasRecordReference1
                                                                              .set(createRespostasRecordData(
                                                                            alternativa:
                                                                                () {
                                                                              if (FFAppState().alternativaSelecionada == columnPerguntasRecord?.alternativaA) {
                                                                                return 'A';
                                                                              } else if (FFAppState().alternativaSelecionada == columnPerguntasRecord?.alternativaB) {
                                                                                return 'B';
                                                                              } else if (FFAppState().alternativaSelecionada == columnPerguntasRecord?.alternativaC) {
                                                                                return 'C';
                                                                              } else if (FFAppState().alternativaSelecionada == columnPerguntasRecord?.alternativaD) {
                                                                                return 'D';
                                                                              } else if (FFAppState().alternativaSelecionada == columnPerguntasRecord?.alternativaE) {
                                                                                return 'E';
                                                                              } else {
                                                                                return 'F';
                                                                              }
                                                                            }(),
                                                                            usuario:
                                                                                currentUserReference,
                                                                            alternativaCorreta:
                                                                                columnPerguntasRecord?.correta,
                                                                            pergunta:
                                                                                columnPerguntasRecord?.reference,
                                                                            quiz:
                                                                                widget.perguntasQuiz,
                                                                            respostaEscrita:
                                                                                FFAppState().respostaEscrita,
                                                                          ));
                                                                          _model.criarRespostas = RespostasRecord.getDocumentFromData(
                                                                              createRespostasRecordData(
                                                                                alternativa: () {
                                                                                  if (FFAppState().alternativaSelecionada == columnPerguntasRecord?.alternativaA) {
                                                                                    return 'A';
                                                                                  } else if (FFAppState().alternativaSelecionada == columnPerguntasRecord?.alternativaB) {
                                                                                    return 'B';
                                                                                  } else if (FFAppState().alternativaSelecionada == columnPerguntasRecord?.alternativaC) {
                                                                                    return 'C';
                                                                                  } else if (FFAppState().alternativaSelecionada == columnPerguntasRecord?.alternativaD) {
                                                                                    return 'D';
                                                                                  } else if (FFAppState().alternativaSelecionada == columnPerguntasRecord?.alternativaE) {
                                                                                    return 'E';
                                                                                  } else {
                                                                                    return 'F';
                                                                                  }
                                                                                }(),
                                                                                usuario: currentUserReference,
                                                                                alternativaCorreta: columnPerguntasRecord?.correta,
                                                                                pergunta: columnPerguntasRecord?.reference,
                                                                                quiz: widget.perguntasQuiz,
                                                                                respostaEscrita: FFAppState().respostaEscrita,
                                                                              ),
                                                                              respostasRecordReference1);
                                                                          _shouldSetState =
                                                                              true;
                                                                        }

                                                                        setState(
                                                                            () {
                                                                          FFAppState().perguntaAtual = functions.getValueIndex(
                                                                              perguntasPerguntasRecordList.toList(),
                                                                              FFAppState().perguntasFeitas.toList());
                                                                          FFAppState().alternativaSelecionada =
                                                                              '';
                                                                        });
                                                                        setState(
                                                                            () {
                                                                          FFAppState()
                                                                              .addToPerguntasFeitas(FFAppState().perguntaAtual);
                                                                        });
                                                                        if (_shouldSetState)
                                                                          setState(
                                                                              () {});
                                                                        return;
                                                                      } else {
                                                                        if (FFAppState().alternativaSelecionada ==
                                                                            columnPerguntasRecord?.correta) {
                                                                          setState(
                                                                              () {
                                                                            FFAppState().alternativasAleatorias =
                                                                                functions.embaralharAlternativas(columnPerguntasRecord!.alternativas.toList()).toList().cast<String>();
                                                                          });
                                                                          setState(
                                                                              () {
                                                                            FFAppState().addToPontosUsuariosLista(1);
                                                                          });
                                                                        } else {
                                                                          setState(
                                                                              () {
                                                                            FFAppState().alternativasAleatorias =
                                                                                functions.embaralharAlternativas(columnPerguntasRecord!.alternativas.toList()).toList().cast<String>();
                                                                          });
                                                                          setState(
                                                                              () {
                                                                            FFAppState().removeFromPontosUsuariosLista(1);
                                                                          });
                                                                        }

                                                                        var scoreRecordReference = ScoreRecord
                                                                            .collection
                                                                            .doc();
                                                                        await scoreRecordReference
                                                                            .set(createScoreRecordData(
                                                                          usuario:
                                                                              currentUserReference,
                                                                          metaPontos:
                                                                              perguntasPerguntasRecordList.length,
                                                                          pontuacao: FFAppState()
                                                                              .pontosUsuariosLista
                                                                              .length,
                                                                          quiz:
                                                                              widget.perguntasQuiz,
                                                                        ));
                                                                        _model.scoreSim = ScoreRecord.getDocumentFromData(
                                                                            createScoreRecordData(
                                                                              usuario: currentUserReference,
                                                                              metaPontos: perguntasPerguntasRecordList.length,
                                                                              pontuacao: FFAppState().pontosUsuariosLista.length,
                                                                              quiz: widget.perguntasQuiz,
                                                                            ),
                                                                            scoreRecordReference);
                                                                        _shouldSetState =
                                                                            true;

                                                                        var rankingQuizRecordReference = RankingQuizRecord
                                                                            .collection
                                                                            .doc();
                                                                        await rankingQuizRecordReference
                                                                            .set({
                                                                          ...createRankingQuizRecordData(
                                                                            quiz:
                                                                                rowQuizRecord.reference,
                                                                            usuario:
                                                                                currentUserReference,
                                                                            pontuacao:
                                                                                FFAppState().pontosUsuariosLista.length,
                                                                            convite:
                                                                                widget.convite,
                                                                            data:
                                                                                getCurrentTimestamp,
                                                                          ),
                                                                          ...mapToFirestore(
                                                                            {
                                                                              'participantes': rowQuizRecord.participantes,
                                                                            },
                                                                          ),
                                                                        });
                                                                        _model.criarrankingporquiz =
                                                                            RankingQuizRecord.getDocumentFromData({
                                                                          ...createRankingQuizRecordData(
                                                                            quiz:
                                                                                rowQuizRecord.reference,
                                                                            usuario:
                                                                                currentUserReference,
                                                                            pontuacao:
                                                                                FFAppState().pontosUsuariosLista.length,
                                                                            convite:
                                                                                widget.convite,
                                                                            data:
                                                                                getCurrentTimestamp,
                                                                          ),
                                                                          ...mapToFirestore(
                                                                            {
                                                                              'participantes': rowQuizRecord.participantes,
                                                                            },
                                                                          ),
                                                                        }, rankingQuizRecordReference);
                                                                        _shouldSetState =
                                                                            true;
                                                                        if (buttonRespostasRecord !=
                                                                            null) {
                                                                          context
                                                                              .pushNamed(
                                                                            'scoreQuiz',
                                                                            queryParameters:
                                                                                {
                                                                              'score': serializeParam(
                                                                                _model.scoreSim?.reference,
                                                                                ParamType.DocumentReference,
                                                                              ),
                                                                              'identificacaoQuiz': serializeParam(
                                                                                'convite',
                                                                                ParamType.String,
                                                                              ),
                                                                            }.withoutNulls,
                                                                          );

                                                                          await buttonRespostasRecord!
                                                                              .reference
                                                                              .update(createRespostasRecordData(
                                                                            alternativa:
                                                                                FFAppState().alternativaSelecionada,
                                                                            respostaEscrita:
                                                                                FFAppState().respostaEscrita,
                                                                          ));

                                                                          await currentUserReference!
                                                                              .update({
                                                                            ...mapToFirestore(
                                                                              {
                                                                                'quizes_concluidos_convites': FieldValue.arrayUnion([
                                                                                  widget.convite
                                                                                ]),
                                                                              },
                                                                            ),
                                                                          });
                                                                        } else {
                                                                          context
                                                                              .pushNamed(
                                                                            'scoreQuiz',
                                                                            queryParameters:
                                                                                {
                                                                              'score': serializeParam(
                                                                                _model.scoreSim?.reference,
                                                                                ParamType.DocumentReference,
                                                                              ),
                                                                              'identificacaoQuiz': serializeParam(
                                                                                'convite',
                                                                                ParamType.String,
                                                                              ),
                                                                            }.withoutNulls,
                                                                          );

                                                                          await RespostasRecord
                                                                              .collection
                                                                              .doc()
                                                                              .set(createRespostasRecordData(
                                                                                alternativa: () {
                                                                                  if (FFAppState().alternativaSelecionada == columnPerguntasRecord?.alternativaA) {
                                                                                    return 'A';
                                                                                  } else if (FFAppState().alternativaSelecionada == columnPerguntasRecord?.alternativaB) {
                                                                                    return 'B';
                                                                                  } else if (FFAppState().alternativaSelecionada == columnPerguntasRecord?.alternativaC) {
                                                                                    return 'C';
                                                                                  } else if (FFAppState().alternativaSelecionada == columnPerguntasRecord?.alternativaD) {
                                                                                    return 'D';
                                                                                  } else if (FFAppState().alternativaSelecionada == columnPerguntasRecord?.alternativaE) {
                                                                                    return 'E';
                                                                                  } else {
                                                                                    return 'F';
                                                                                  }
                                                                                }(),
                                                                                usuario: currentUserReference,
                                                                                alternativaCorreta: columnPerguntasRecord?.correta,
                                                                                pergunta: columnPerguntasRecord?.reference,
                                                                                quiz: widget.perguntasQuiz,
                                                                                respostaEscrita: FFAppState().respostaEscrita,
                                                                              ));

                                                                          await currentUserReference!
                                                                              .update({
                                                                            ...mapToFirestore(
                                                                              {
                                                                                'quizes_concluidos_convites': FieldValue.arrayUnion([
                                                                                  widget.convite
                                                                                ]),
                                                                              },
                                                                            ),
                                                                          });
                                                                        }

                                                                        setState(
                                                                            () {
                                                                          FFAppState().alternativaSelecionada =
                                                                              '';
                                                                        });
                                                                        setState(
                                                                            () {
                                                                          FFAppState().alternativasAleatorias = functions
                                                                              .baguncarAlternativas(columnPerguntasRecord!.alternativas.toList())
                                                                              .toList()
                                                                              .cast<String>();
                                                                        });
                                                                        if (_shouldSetState)
                                                                          setState(
                                                                              () {});
                                                                        return;
                                                                      }

                                                                      if (_shouldSetState)
                                                                        setState(
                                                                            () {});
                                                                    },
                                                                    text:
                                                                        'Continuar',
                                                                    options:
                                                                        FFButtonOptions(
                                                                      height:
                                                                          40.0,
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
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'Roboto',
                                                                            color:
                                                                                Colors.white,
                                                                            fontSize:
                                                                                20.0,
                                                                          ),
                                                                      elevation:
                                                                          0.0,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              25.0),
                                                                    ),
                                                                  );
                                                                },
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
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
