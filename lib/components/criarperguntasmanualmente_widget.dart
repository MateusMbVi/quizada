import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'criarperguntasmanualmente_model.dart';
export 'criarperguntasmanualmente_model.dart';

class CriarperguntasmanualmenteWidget extends StatefulWidget {
  const CriarperguntasmanualmenteWidget({
    super.key,
    required this.importandoperguntas,
  });

  final DocumentReference? importandoperguntas;

  @override
  State<CriarperguntasmanualmenteWidget> createState() =>
      _CriarperguntasmanualmenteWidgetState();
}

class _CriarperguntasmanualmenteWidgetState
    extends State<CriarperguntasmanualmenteWidget> {
  late CriarperguntasmanualmenteModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CriarperguntasmanualmenteModel());

    _model.perguntaController ??= TextEditingController();
    _model.perguntaFocusNode ??= FocusNode();

    _model.alternativaAController ??= TextEditingController();
    _model.alternativaAFocusNode ??= FocusNode();

    _model.alternativaBController ??= TextEditingController();
    _model.alternativaBFocusNode ??= FocusNode();

    _model.alternativaCController ??= TextEditingController();
    _model.alternativaCFocusNode ??= FocusNode();

    _model.alternativaDController ??= TextEditingController();
    _model.alternativaDFocusNode ??= FocusNode();

    _model.alternativaEController ??= TextEditingController();
    _model.alternativaEFocusNode ??= FocusNode();

    _model.alternativaFController ??= TextEditingController();
    _model.alternativaFFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(20.0, 60.0, 20.0, 20.0),
        child: StreamBuilder<QuizRecord>(
          stream: QuizRecord.getDocument(widget.importandoperguntas!),
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
            final containerQuizRecord = snapshot.data!;
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
              child: Form(
                key: _model.formKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 20.0, 20.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(13.0),
                                      child: Image.memory(
                                        _model.uploadedLocalFile1.bytes ??
                                            Uint8List.fromList([]),
                                        width: 300.0,
                                        height: 130.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  final selectedMedia =
                                      await selectMediaWithSourceBottomSheet(
                                    context: context,
                                    allowPhoto: true,
                                  );
                                  if (selectedMedia != null &&
                                      selectedMedia.every((m) =>
                                          validateFileFormat(
                                              m.storagePath, context))) {
                                    setState(
                                        () => _model.isDataUploading1 = true);
                                    var selectedUploadedFiles =
                                        <FFUploadedFile>[];

                                    try {
                                      selectedUploadedFiles = selectedMedia
                                          .map((m) => FFUploadedFile(
                                                name: m.storagePath
                                                    .split('/')
                                                    .last,
                                                bytes: m.bytes,
                                                height: m.dimensions?.height,
                                                width: m.dimensions?.width,
                                                blurHash: m.blurHash,
                                              ))
                                          .toList();
                                    } finally {
                                      _model.isDataUploading1 = false;
                                    }
                                    if (selectedUploadedFiles.length ==
                                        selectedMedia.length) {
                                      setState(() {
                                        _model.uploadedLocalFile1 =
                                            selectedUploadedFiles.first;
                                      });
                                    } else {
                                      setState(() {});
                                      return;
                                    }
                                  }
                                },
                                text: _model.uploadedLocalFile1 != null &&
                                        (_model.uploadedLocalFile1.bytes
                                                ?.isNotEmpty ??
                                            false)
                                    ? 'Alterar imagem'
                                    : 'Adicionar imagem',
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
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 20.0, 20.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: TextFormField(
                              controller: _model.perguntaController,
                              focusNode: _model.perguntaFocusNode,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Pergunta',
                                labelStyle:
                                    FlutterFlowTheme.of(context).labelMedium,
                                hintStyle:
                                    FlutterFlowTheme.of(context).labelMedium,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                              ),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                              maxLines: null,
                              validator: _model.perguntaControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 20.0, 20.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: TextFormField(
                              controller: _model.alternativaAController,
                              focusNode: _model.alternativaAFocusNode,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.alternativaAController',
                                Duration(milliseconds: 2000),
                                () async {
                                  setState(() {
                                    _model.alternativaA =
                                        _model.alternativaAController.text;
                                  });
                                },
                              ),
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Alternativa A',
                                labelStyle:
                                    FlutterFlowTheme.of(context).labelMedium,
                                hintStyle:
                                    FlutterFlowTheme.of(context).labelMedium,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                              ),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                              maxLines: null,
                              validator: _model.alternativaAControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 20.0, 20.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: TextFormField(
                              controller: _model.alternativaBController,
                              focusNode: _model.alternativaBFocusNode,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.alternativaBController',
                                Duration(milliseconds: 2000),
                                () async {
                                  setState(() {
                                    _model.alternativaB =
                                        _model.alternativaBController.text;
                                  });
                                },
                              ),
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Alternativa B',
                                labelStyle:
                                    FlutterFlowTheme.of(context).labelMedium,
                                hintStyle:
                                    FlutterFlowTheme.of(context).labelMedium,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                              ),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                              maxLines: null,
                              validator: _model.alternativaBControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 20.0, 20.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: TextFormField(
                              controller: _model.alternativaCController,
                              focusNode: _model.alternativaCFocusNode,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.alternativaCController',
                                Duration(milliseconds: 2000),
                                () async {
                                  setState(() {
                                    _model.alternativaC =
                                        _model.alternativaCController.text;
                                  });
                                },
                              ),
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Alternativa C',
                                labelStyle:
                                    FlutterFlowTheme.of(context).labelMedium,
                                hintStyle:
                                    FlutterFlowTheme.of(context).labelMedium,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                              ),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                              maxLines: null,
                              validator: _model.alternativaCControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 20.0, 20.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: TextFormField(
                              controller: _model.alternativaDController,
                              focusNode: _model.alternativaDFocusNode,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.alternativaDController',
                                Duration(milliseconds: 2000),
                                () async {
                                  setState(() {
                                    _model.alternativaD =
                                        _model.alternativaDController.text;
                                  });
                                },
                              ),
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Alternativa D',
                                labelStyle:
                                    FlutterFlowTheme.of(context).labelMedium,
                                hintStyle:
                                    FlutterFlowTheme.of(context).labelMedium,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                              ),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                              maxLines: null,
                              validator: _model.alternativaDControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 20.0, 20.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: TextFormField(
                              controller: _model.alternativaEController,
                              focusNode: _model.alternativaEFocusNode,
                              onFieldSubmitted: (_) async {
                                setState(() {
                                  _model.alternativaE =
                                      _model.alternativaEController.text;
                                });
                              },
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Alternativa E',
                                labelStyle:
                                    FlutterFlowTheme.of(context).labelMedium,
                                hintStyle:
                                    FlutterFlowTheme.of(context).labelMedium,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                              ),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                              maxLines: null,
                              validator: _model.alternativaEControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 20.0, 20.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: TextFormField(
                              controller: _model.alternativaFController,
                              focusNode: _model.alternativaFFocusNode,
                              onFieldSubmitted: (_) async {
                                setState(() {
                                  _model.alternativaF =
                                      _model.alternativaFController.text;
                                });
                              },
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Alternativa F',
                                labelStyle:
                                    FlutterFlowTheme.of(context).labelMedium,
                                hintStyle:
                                    FlutterFlowTheme.of(context).labelMedium,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                              ),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                              maxLines: null,
                              validator: _model.alternativaFControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 20.0, 20.0, 0.0),
                          child: FlutterFlowDropDown<String>(
                            controller:
                                _model.dropRespostaCorretaValueController ??=
                                    FormFieldController<String>(null),
                            options: ['A', 'B', 'C', 'D', 'E', 'F'],
                            onChanged: (val) => setState(
                                () => _model.dropRespostaCorretaValue = val),
                            width: double.infinity,
                            height: 40.0,
                            textStyle: FlutterFlowTheme.of(context).bodyMedium,
                            hintText: 'Resposta correta',
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            elevation: 0.0,
                            borderColor: FlutterFlowTheme.of(context).alternate,
                            borderWidth: 1.0,
                            borderRadius: 12.0,
                            margin: EdgeInsetsDirectional.fromSTEB(
                                16.0, 4.0, 16.0, 4.0),
                            hidesUnderline: true,
                            isSearchable: false,
                            isMultiSelect: false,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    if (_model.uploadedLocalFile1 != null &&
                                        (_model.uploadedLocalFile1.bytes
                                                ?.isNotEmpty ??
                                            false)) {
                                      if (_model.formKey.currentState == null ||
                                          !_model.formKey.currentState!
                                              .validate()) {
                                        return;
                                      }
                                      if (_model.dropRespostaCorretaValue ==
                                          null) {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: Text(
                                                  'Você deve selecionar qual a resposta correta da questão'),
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
                                        return;
                                      }
                                      {
                                        setState(() =>
                                            _model.isDataUploading2 = true);
                                        var selectedUploadedFiles =
                                            <FFUploadedFile>[];
                                        var selectedMedia = <SelectedFile>[];
                                        var downloadUrls = <String>[];
                                        try {
                                          selectedUploadedFiles = _model
                                                  .uploadedLocalFile1
                                                  .bytes!
                                                  .isNotEmpty
                                              ? [_model.uploadedLocalFile1]
                                              : <FFUploadedFile>[];
                                          selectedMedia =
                                              selectedFilesFromUploadedFiles(
                                            selectedUploadedFiles,
                                          );
                                          downloadUrls = (await Future.wait(
                                            selectedMedia.map(
                                              (m) async => await uploadData(
                                                  m.storagePath, m.bytes),
                                            ),
                                          ))
                                              .where((u) => u != null)
                                              .map((u) => u!)
                                              .toList();
                                        } finally {
                                          _model.isDataUploading2 = false;
                                        }
                                        if (selectedUploadedFiles.length ==
                                                selectedMedia.length &&
                                            downloadUrls.length ==
                                                selectedMedia.length) {
                                          setState(() {
                                            _model.uploadedLocalFile2 =
                                                selectedUploadedFiles.first;
                                            _model.uploadedFileUrl2 =
                                                downloadUrls.first;
                                          });
                                        } else {
                                          setState(() {});
                                          return;
                                        }
                                      }

                                      var perguntasRecordReference1 =
                                          PerguntasRecord.collection.doc();
                                      await perguntasRecordReference1
                                          .set(createPerguntasRecordData(
                                        textoPergunta:
                                            _model.perguntaController.text,
                                        alternativaA:
                                            _model.alternativaAController.text,
                                        alternativaB:
                                            _model.alternativaBController.text,
                                        alternativaC:
                                            _model.alternativaCController.text,
                                        alternativaD:
                                            _model.alternativaDController.text,
                                        alternativaE:
                                            _model.alternativaEController.text,
                                        alternativaF:
                                            _model.alternativaFController.text,
                                        quiz: containerQuizRecord.reference,
                                        imagem: _model.uploadedFileUrl2,
                                        correta: () {
                                          if (_model.dropRespostaCorretaValue ==
                                              'A') {
                                            return _model
                                                .alternativaAController.text;
                                          } else if (_model
                                                  .dropRespostaCorretaValue ==
                                              'B') {
                                            return _model
                                                .alternativaBController.text;
                                          } else if (_model
                                                  .dropRespostaCorretaValue ==
                                              'C') {
                                            return _model
                                                .alternativaCController.text;
                                          } else if (_model
                                                  .dropRespostaCorretaValue ==
                                              'D') {
                                            return _model
                                                .alternativaDController.text;
                                          } else if (_model
                                                  .dropRespostaCorretaValue ==
                                              'E') {
                                            return _model
                                                .alternativaEController.text;
                                          } else {
                                            return _model
                                                .alternativaFController.text;
                                          }
                                        }(),
                                      ));
                                      _model.addquestoes =
                                          PerguntasRecord.getDocumentFromData(
                                              createPerguntasRecordData(
                                                textoPergunta: _model
                                                    .perguntaController.text,
                                                alternativaA: _model
                                                    .alternativaAController
                                                    .text,
                                                alternativaB: _model
                                                    .alternativaBController
                                                    .text,
                                                alternativaC: _model
                                                    .alternativaCController
                                                    .text,
                                                alternativaD: _model
                                                    .alternativaDController
                                                    .text,
                                                alternativaE: _model
                                                    .alternativaEController
                                                    .text,
                                                alternativaF: _model
                                                    .alternativaFController
                                                    .text,
                                                quiz: containerQuizRecord
                                                    .reference,
                                                imagem: _model.uploadedFileUrl2,
                                                correta: () {
                                                  if (_model
                                                          .dropRespostaCorretaValue ==
                                                      'A') {
                                                    return _model
                                                        .alternativaAController
                                                        .text;
                                                  } else if (_model
                                                          .dropRespostaCorretaValue ==
                                                      'B') {
                                                    return _model
                                                        .alternativaBController
                                                        .text;
                                                  } else if (_model
                                                          .dropRespostaCorretaValue ==
                                                      'C') {
                                                    return _model
                                                        .alternativaCController
                                                        .text;
                                                  } else if (_model
                                                          .dropRespostaCorretaValue ==
                                                      'D') {
                                                    return _model
                                                        .alternativaDController
                                                        .text;
                                                  } else if (_model
                                                          .dropRespostaCorretaValue ==
                                                      'E') {
                                                    return _model
                                                        .alternativaEController
                                                        .text;
                                                  } else {
                                                    return _model
                                                        .alternativaFController
                                                        .text;
                                                  }
                                                }(),
                                              ),
                                              perguntasRecordReference1);
                                      setState(() {
                                        _model.addToAlternativas(
                                            _model.alternativaAController.text);
                                      });
                                      setState(() {
                                        _model.addToAlternativas(
                                            _model.alternativaBController.text);
                                      });
                                      setState(() {
                                        _model.addToAlternativas(
                                            _model.alternativaCController.text);
                                      });
                                      setState(() {
                                        _model.addToAlternativas(
                                            _model.alternativaDController.text);
                                      });
                                      setState(() {
                                        _model.addToAlternativas(
                                            _model.alternativaEController.text);
                                      });
                                      setState(() {
                                        _model.addToAlternativas(
                                            _model.alternativaFController.text);
                                      });

                                      await _model.addquestoes!.reference
                                          .update({
                                        ...mapToFirestore(
                                          {
                                            'alternativas': _model.alternativas,
                                          },
                                        ),
                                      });
                                      setState(() {
                                        _model.isDataUploading1 = false;
                                        _model.uploadedLocalFile1 =
                                            FFUploadedFile(
                                                bytes: Uint8List.fromList([]));
                                      });

                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Questão salva com sucesso!',
                                            style: GoogleFonts.getFont(
                                              'Roboto',
                                              color: Colors.white,
                                              fontSize: 15.0,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 3000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                        ),
                                      );
                                      Navigator.pop(context);
                                    } else {
                                      if (_model.formKey.currentState == null ||
                                          !_model.formKey.currentState!
                                              .validate()) {
                                        return;
                                      }
                                      if (_model.dropRespostaCorretaValue ==
                                          null) {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: Text(
                                                  'Você deve selecionar qual a resposta correta da questão'),
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
                                        return;
                                      }

                                      var perguntasRecordReference2 =
                                          PerguntasRecord.collection.doc();
                                      await perguntasRecordReference2
                                          .set(createPerguntasRecordData(
                                        textoPergunta:
                                            _model.perguntaController.text,
                                        alternativaA:
                                            _model.alternativaAController.text,
                                        alternativaB:
                                            _model.alternativaBController.text,
                                        alternativaC:
                                            _model.alternativaCController.text,
                                        alternativaD:
                                            _model.alternativaDController.text,
                                        alternativaE:
                                            _model.alternativaEController.text,
                                        alternativaF:
                                            _model.alternativaFController.text,
                                        quiz: containerQuizRecord.reference,
                                        correta: () {
                                          if (_model.dropRespostaCorretaValue ==
                                              'A') {
                                            return _model
                                                .alternativaAController.text;
                                          } else if (_model
                                                  .dropRespostaCorretaValue ==
                                              'B') {
                                            return _model
                                                .alternativaBController.text;
                                          } else if (_model
                                                  .dropRespostaCorretaValue ==
                                              'C') {
                                            return _model
                                                .alternativaCController.text;
                                          } else if (_model
                                                  .dropRespostaCorretaValue ==
                                              'D') {
                                            return _model
                                                .alternativaDController.text;
                                          } else if (_model
                                                  .dropRespostaCorretaValue ==
                                              'E') {
                                            return _model
                                                .alternativaEController.text;
                                          } else {
                                            return _model
                                                .alternativaFController.text;
                                          }
                                        }(),
                                      ));
                                      _model.addquestoessemfoto =
                                          PerguntasRecord.getDocumentFromData(
                                              createPerguntasRecordData(
                                                textoPergunta: _model
                                                    .perguntaController.text,
                                                alternativaA: _model
                                                    .alternativaAController
                                                    .text,
                                                alternativaB: _model
                                                    .alternativaBController
                                                    .text,
                                                alternativaC: _model
                                                    .alternativaCController
                                                    .text,
                                                alternativaD: _model
                                                    .alternativaDController
                                                    .text,
                                                alternativaE: _model
                                                    .alternativaEController
                                                    .text,
                                                alternativaF: _model
                                                    .alternativaFController
                                                    .text,
                                                quiz: containerQuizRecord
                                                    .reference,
                                                correta: () {
                                                  if (_model
                                                          .dropRespostaCorretaValue ==
                                                      'A') {
                                                    return _model
                                                        .alternativaAController
                                                        .text;
                                                  } else if (_model
                                                          .dropRespostaCorretaValue ==
                                                      'B') {
                                                    return _model
                                                        .alternativaBController
                                                        .text;
                                                  } else if (_model
                                                          .dropRespostaCorretaValue ==
                                                      'C') {
                                                    return _model
                                                        .alternativaCController
                                                        .text;
                                                  } else if (_model
                                                          .dropRespostaCorretaValue ==
                                                      'D') {
                                                    return _model
                                                        .alternativaDController
                                                        .text;
                                                  } else if (_model
                                                          .dropRespostaCorretaValue ==
                                                      'E') {
                                                    return _model
                                                        .alternativaEController
                                                        .text;
                                                  } else {
                                                    return _model
                                                        .alternativaFController
                                                        .text;
                                                  }
                                                }(),
                                              ),
                                              perguntasRecordReference2);
                                      setState(() {
                                        _model.addToAlternativas(
                                            _model.alternativaAController.text);
                                      });
                                      setState(() {
                                        _model.addToAlternativas(
                                            _model.alternativaBController.text);
                                      });
                                      setState(() {
                                        _model.addToAlternativas(
                                            _model.alternativaCController.text);
                                      });
                                      setState(() {
                                        _model.addToAlternativas(
                                            _model.alternativaDController.text);
                                      });
                                      setState(() {
                                        _model.addToAlternativas(
                                            _model.alternativaEController.text);
                                      });
                                      setState(() {
                                        _model.addToAlternativas(
                                            _model.alternativaFController.text);
                                      });

                                      await _model.addquestoessemfoto!.reference
                                          .update({
                                        ...mapToFirestore(
                                          {
                                            'alternativas': _model.alternativas,
                                          },
                                        ),
                                      });
                                      setState(() {
                                        _model.isDataUploading1 = false;
                                        _model.uploadedLocalFile1 =
                                            FFUploadedFile(
                                                bytes: Uint8List.fromList([]));
                                      });

                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Questão salva com sucesso!',
                                            style: GoogleFonts.getFont(
                                              'Roboto',
                                              color: Colors.white,
                                              fontSize: 15.0,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 3000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                        ),
                                      );
                                      Navigator.pop(context);
                                    }

                                    setState(() {});
                                  },
                                  text: 'Adicionar',
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
                                          fontSize: 20.0,
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
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 20.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    Navigator.pop(context);
                                  },
                                  text: 'Cancelar',
                                  options: FFButtonOptions(
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: Color(0xFFE7E7E7),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Nunito',
                                          color: Colors.black,
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
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
