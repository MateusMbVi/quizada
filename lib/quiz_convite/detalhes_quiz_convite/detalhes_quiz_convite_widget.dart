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
import 'package:provider/provider.dart';
import 'detalhes_quiz_convite_model.dart';
export 'detalhes_quiz_convite_model.dart';

class DetalhesQuizConviteWidget extends StatefulWidget {
  const DetalhesQuizConviteWidget({
    super.key,
    this.detalhesQuiz,
    required this.convites,
    required this.identificacao,
  });

  final QuizRecord? detalhesQuiz;
  final ConvitesRecord? convites;
  final String? identificacao;

  @override
  State<DetalhesQuizConviteWidget> createState() =>
      _DetalhesQuizConviteWidgetState();
}

class _DetalhesQuizConviteWidgetState extends State<DetalhesQuizConviteWidget> {
  late DetalhesQuizConviteModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetalhesQuizConviteModel());
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

    return StreamBuilder<QuizRecord>(
      stream: QuizRecord.getDocument(widget.detalhesQuiz!.reference),
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
        final detalhesQuizConviteQuizRecord = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Container(
                            width: 100.0,
                            height: 110.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(15.0),
                                bottomRight: Radius.circular(15.0),
                                topLeft: Radius.circular(0.0),
                                topRight: Radius.circular(0.0),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 20.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Expanded(
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pop();
                                          },
                                          child: Icon(
                                            Icons.chevron_left,
                                            color: Colors.black,
                                            size: 34.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 15.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image.network(
                                valueOrDefault<String>(
                                  detalhesQuizConviteQuizRecord.imagem !=
                                              null &&
                                          detalhesQuizConviteQuizRecord
                                                  .imagem !=
                                              ''
                                      ? detalhesQuizConviteQuizRecord.imagem
                                      : 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/quiz-u4gc3g/assets/hm47vtpfud5k/WhatsApp_Image_2023-12-27_at_23.27.55.jpeg',
                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/quiz-u4gc3g/assets/hm47vtpfud5k/WhatsApp_Image_2023-12-27_at_23.27.55.jpeg',
                                ),
                                width: 300.0,
                                height: 180.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              detalhesQuizConviteQuizRecord.tema,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Nunito',
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        height: 70.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: StreamBuilder<List<PerguntasRecord>>(
                                stream: queryPerguntasRecord(
                                  queryBuilder: (perguntasRecord) =>
                                      perguntasRecord.where(
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
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<PerguntasRecord>
                                      containerPerguntasRecordList =
                                      snapshot.data!;
                                  return Container(
                                    width: 100.0,
                                    height: 70.0,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10.0),
                                        bottomRight: Radius.circular(0.0),
                                        topLeft: Radius.circular(10.0),
                                        topRight: Radius.circular(0.0),
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          formatNumber(
                                            containerPerguntasRecordList.length,
                                            formatType: FormatType.decimal,
                                            decimalType:
                                                DecimalType.commaDecimal,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Nunito',
                                                color: Color(0xFF0F0F0F),
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                        Text(
                                          'Questões',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Nunito',
                                                color: Color(0xFF222222),
                                              ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                            SizedBox(
                              height: 40.0,
                              child: VerticalDivider(
                                width: 1.0,
                                thickness: 1.0,
                                color: Color(0xFFA1A1A1),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                width: 100.0,
                                height: 70.0,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      formatNumber(
                                        detalhesQuizConviteQuizRecord.jogadas,
                                        formatType: FormatType.decimal,
                                        decimalType: DecimalType.commaDecimal,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Nunito',
                                            color: Color(0xFF0F0F0F),
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                    Text(
                                      'Jogados',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Nunito',
                                            color: Color(0xFF222222),
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40.0,
                              child: VerticalDivider(
                                width: 1.0,
                                thickness: 1.0,
                                color: Color(0xFFA1A1A1),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                width: 100.0,
                                height: 70.0,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(0.0),
                                    bottomRight: Radius.circular(10.0),
                                    topLeft: Radius.circular(0.0),
                                    topRight: Radius.circular(10.0),
                                  ),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      formatNumber(
                                        detalhesQuizConviteQuizRecord
                                            .favoritados,
                                        formatType: FormatType.decimal,
                                        decimalType: DecimalType.commaDecimal,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Nunito',
                                            color: Color(0xFF0F0F0F),
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                    Text(
                                      'Favoritado',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Nunito',
                                            color: Color(0xFF222222),
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: StreamBuilder<UserRecord>(
                        stream: UserRecord.getDocument(
                            detalhesQuizConviteQuizRecord.usuario!),
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
                          final rowUserRecord = snapshot.data!;
                          return Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: 50.0,
                                height: 50.0,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.network(
                                  valueOrDefault<String>(
                                    rowUserRecord.photoUrl,
                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/quiz-u4gc3g/assets/mahzy9grz5da/Auto_Layout_Vertical.png',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              rowUserRecord.displayName,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                rowUserRecord.apelido,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          fontSize: 12.0,
                                                          fontWeight:
                                                              FontWeight.normal,
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
                            ],
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          20.0, 20.0, 20.0, 10.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              'Descrição:',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Nunito Sans',
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 20.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              detalhesQuizConviteQuizRecord.descricao,
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: StreamBuilder<List<ScoreRecord>>(
                        stream: queryScoreRecord(
                          queryBuilder: (scoreRecord) => scoreRecord
                              .where(
                                'quiz',
                                isEqualTo:
                                    detalhesQuizConviteQuizRecord.reference,
                              )
                              .where(
                                'usuario',
                                isEqualTo: currentUserReference,
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
                          List<ScoreRecord> scoresScoreRecordList =
                              snapshot.data!;
                          final scoresScoreRecord =
                              scoresScoreRecordList.isNotEmpty
                                  ? scoresScoreRecordList.first
                                  : null;
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              StreamBuilder<List<PerguntasRecord>>(
                                stream: queryPerguntasRecord(
                                  queryBuilder: (perguntasRecord) =>
                                      perguntasRecord.where(
                                    'identificacao',
                                    arrayContains: widget.identificacao,
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
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<PerguntasRecord>
                                      pergntasPerguntasRecordList =
                                      snapshot.data!;
                                  // Return an empty Container when the item does not exist.
                                  if (snapshot.data!.isEmpty) {
                                    return Container();
                                  }
                                  final pergntasPerguntasRecord =
                                      pergntasPerguntasRecordList.isNotEmpty
                                          ? pergntasPerguntasRecordList.first
                                          : null;
                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(10.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: StreamBuilder<
                                                  List<PerguntasRecord>>(
                                                stream: queryPerguntasRecord(
                                                  queryBuilder:
                                                      (perguntasRecord) =>
                                                          perguntasRecord.where(
                                                    'quiz',
                                                    isEqualTo:
                                                        detalhesQuizConviteQuizRecord
                                                            .reference,
                                                  ),
                                                ),
                                                builder: (context, snapshot) {
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
                                                  List<PerguntasRecord>
                                                      containerPerguntasRecordList =
                                                      snapshot.data!;
                                                  return Container(
                                                    decoration: BoxDecoration(),
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
                                                          queryBuilder:
                                                              (respostasRecord) =>
                                                                  respostasRecord
                                                                      .where(
                                                            'quiz',
                                                            isEqualTo:
                                                                detalhesQuizConviteQuizRecord
                                                                    .reference,
                                                          ),
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
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
                                                          List<RespostasRecord>
                                                              buttonRespostasRecordList =
                                                              snapshot.data!;
                                                          return FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              if (buttonRespostasRecordList
                                                                      .length >
                                                                  0) {
                                                                setState(() {
                                                                  FFAppState().alternativasAleatorias = functions
                                                                      .baguncarAlternativas(pergntasPerguntasRecord!
                                                                          .alternativas
                                                                          .toList())
                                                                      .toList()
                                                                      .cast<
                                                                          String>();
                                                                });
                                                                await scoresScoreRecord!
                                                                    .reference
                                                                    .delete();
                                                                await actions
                                                                    .deletarRespostas(
                                                                  detalhesQuizConviteQuizRecord
                                                                      .reference,
                                                                  currentUserReference!,
                                                                  buttonRespostasRecordList
                                                                      .toList(),
                                                                );

                                                                await currentUserReference!
                                                                    .update({
                                                                  ...mapToFirestore(
                                                                    {
                                                                      'plays': FieldValue
                                                                          .increment(
                                                                              1),
                                                                    },
                                                                  ),
                                                                });

                                                                await detalhesQuizConviteQuizRecord
                                                                    .reference
                                                                    .update({
                                                                  ...mapToFirestore(
                                                                    {
                                                                      'jogadas':
                                                                          FieldValue.increment(
                                                                              1),
                                                                    },
                                                                  ),
                                                                });
                                                                setState(() {
                                                                  FFAppState()
                                                                      .perguntasFeitas = [];
                                                                });
                                                                setState(() {
                                                                  FFAppState().perguntaAtual = functions.getValueIndex(
                                                                      containerPerguntasRecordList
                                                                          .toList(),
                                                                      FFAppState()
                                                                          .perguntasFeitas
                                                                          .toList());
                                                                  FFAppState().addToPerguntasFeitas(
                                                                      FFAppState()
                                                                          .perguntaAtual);
                                                                });

                                                                context
                                                                    .pushNamed(
                                                                  'perguntasQuizConvite',
                                                                  queryParameters:
                                                                      {
                                                                    'perguntasQuiz':
                                                                        serializeParam(
                                                                      detalhesQuizConviteQuizRecord
                                                                          .reference,
                                                                      ParamType
                                                                          .DocumentReference,
                                                                    ),
                                                                    'identificacao':
                                                                        serializeParam(
                                                                      widget
                                                                          .convites
                                                                          ?.identificacao,
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'convite':
                                                                        serializeParam(
                                                                      widget
                                                                          .convites
                                                                          ?.reference,
                                                                      ParamType
                                                                          .DocumentReference,
                                                                    ),
                                                                  }.withoutNulls,
                                                                );
                                                              } else if ((currentUserDocument
                                                                          ?.quizesConcluidos
                                                                          ?.toList() ??
                                                                      [])
                                                                  .contains(
                                                                      detalhesQuizConviteQuizRecord
                                                                          .reference)) {
                                                                await showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (alertDialogContext) {
                                                                    return AlertDialog(
                                                                      title: Text(
                                                                          'Você já realizou este quiz!'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                          child:
                                                                              Text('Ok'),
                                                                        ),
                                                                      ],
                                                                    );
                                                                  },
                                                                );
                                                              } else {
                                                                await currentUserReference!
                                                                    .update({
                                                                  ...mapToFirestore(
                                                                    {
                                                                      'plays': FieldValue
                                                                          .increment(
                                                                              1),
                                                                    },
                                                                  ),
                                                                });

                                                                await detalhesQuizConviteQuizRecord
                                                                    .reference
                                                                    .update({
                                                                  ...mapToFirestore(
                                                                    {
                                                                      'jogadas':
                                                                          FieldValue.increment(
                                                                              1),
                                                                    },
                                                                  ),
                                                                });

                                                                context
                                                                    .pushNamed(
                                                                  'perguntasQuizConvite',
                                                                  queryParameters:
                                                                      {
                                                                    'perguntasQuiz':
                                                                        serializeParam(
                                                                      detalhesQuizConviteQuizRecord
                                                                          .reference,
                                                                      ParamType
                                                                          .DocumentReference,
                                                                    ),
                                                                    'identificacao':
                                                                        serializeParam(
                                                                      widget
                                                                          .convites
                                                                          ?.identificacao,
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'convite':
                                                                        serializeParam(
                                                                      widget
                                                                          .convites
                                                                          ?.reference,
                                                                      ParamType
                                                                          .DocumentReference,
                                                                    ),
                                                                  }.withoutNulls,
                                                                );
                                                              }
                                                            },
                                                            text: 'Iniciar',
                                                            options:
                                                                FFButtonOptions(
                                                              height: 50.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Nunito',
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            18.0,
                                                                      ),
                                                              elevation: 0.0,
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Colors
                                                                    .transparent,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          50.0),
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
                                    ],
                                  );
                                },
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
        );
      },
    );
  }
}
