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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'criar_quizes_model.dart';
export 'criar_quizes_model.dart';

class CriarQuizesWidget extends StatefulWidget {
  const CriarQuizesWidget({super.key});

  @override
  State<CriarQuizesWidget> createState() => _CriarQuizesWidgetState();
}

class _CriarQuizesWidgetState extends State<CriarQuizesWidget> {
  late CriarQuizesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CriarQuizesModel());

    _model.textNomeQuizController ??= TextEditingController();
    _model.textNomeQuizFocusNode ??= FocusNode();

    _model.textDescricaoQuizController ??= TextEditingController();
    _model.textDescricaoQuizFocusNode ??= FocusNode();
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
        padding: EdgeInsets.all(20.0),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 30.0, 0.0),
                            child: Text(
                              'Criar Quiz',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Nunito Sans',
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                        ),
                        FlutterFlowIconButton(
                          borderColor: Colors.white,
                          borderRadius: 20.0,
                          borderWidth: 1.0,
                          buttonSize: 40.0,
                          fillColor: Colors.white,
                          icon: Icon(
                            Icons.close,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 25.0,
                          ),
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                  Form(
                    key: _model.formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(20.0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Material(
                                        color: Colors.transparent,
                                        elevation: 1.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        child: Container(
                                          height: 150.0,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            image: DecorationImage(
                                              fit: BoxFit.none,
                                              image: Image.network(
                                                '',
                                              ).image,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            border: Border.all(
                                              color: valueOrDefault<Color>(
                                                _model.uploadedLocalFile1 != null &&
                                                        (_model
                                                                .uploadedLocalFile1
                                                                .bytes
                                                                ?.isNotEmpty ??
                                                            false)
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .primary
                                                    : Color(0xFFCFCFCF),
                                                Color(0xFFCFCFCF),
                                              ),
                                              width: 1.0,
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              if (_model.uploadedLocalFile1 !=
                                                      null &&
                                                  (_model.uploadedLocalFile1
                                                          .bytes?.isNotEmpty ??
                                                      false))
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                      child: Image.memory(
                                                        _model.uploadedLocalFile1
                                                                .bytes ??
                                                            Uint8List.fromList(
                                                                []),
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                1.5,
                                                        height: 150.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              if (_model.uploadedLocalFile1 ==
                                                      null ||
                                                  (_model.uploadedLocalFile1
                                                          .bytes?.isEmpty ??
                                                      true))
                                                Padding(
                                                  padding: EdgeInsets.all(10.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          FaIcon(
                                                            FontAwesomeIcons
                                                                .image,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            size: 40.0,
                                                          ),
                                                        ],
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
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      FFButtonWidget(
                                        onPressed: () async {
                                          final selectedMedia =
                                              await selectMedia(
                                            mediaSource:
                                                MediaSource.photoGallery,
                                            multiImage: false,
                                          );
                                          if (selectedMedia != null &&
                                              selectedMedia.every((m) =>
                                                  validateFileFormat(
                                                      m.storagePath,
                                                      context))) {
                                            setState(() =>
                                                _model.isDataUploading1 = true);
                                            var selectedUploadedFiles =
                                                <FFUploadedFile>[];

                                            try {
                                              selectedUploadedFiles =
                                                  selectedMedia
                                                      .map(
                                                          (m) => FFUploadedFile(
                                                                name: m
                                                                    .storagePath
                                                                    .split('/')
                                                                    .last,
                                                                bytes: m.bytes,
                                                                height: m
                                                                    .dimensions
                                                                    ?.height,
                                                                width: m
                                                                    .dimensions
                                                                    ?.width,
                                                                blurHash:
                                                                    m.blurHash,
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
                                        text:
                                            _model.uploadedLocalFile1 != null &&
                                                    (_model
                                                            .uploadedLocalFile1
                                                            .bytes
                                                            ?.isNotEmpty ??
                                                        false)
                                                ? 'Alterar foto'
                                                : 'Selecionar foto',
                                        options: FFButtonOptions(
                                          width: 120.0,
                                          height: 30.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily: 'Nunito',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 15.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Categoria do quizz',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Nunito',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                StreamBuilder<List<CategoriaRecord>>(
                                  stream: queryCategoriaRecord(
                                    queryBuilder: (categoriaRecord) =>
                                        categoriaRecord.where(
                                      'usuario',
                                      isEqualTo: currentUserReference,
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
                                    List<CategoriaRecord>
                                        dropCategoriasCategoriaRecordList =
                                        snapshot.data!;
                                    return FlutterFlowDropDown<String>(
                                      controller: _model
                                              .dropCategoriasValueController ??=
                                          FormFieldController<String>(null),
                                      options: dropCategoriasCategoriaRecordList
                                          .map((e) => e.nome)
                                          .toList(),
                                      onChanged: (val) => setState(() =>
                                          _model.dropCategoriasValue = val),
                                      width: double.infinity,
                                      height: 40.0,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                      hintText: 'Selecionar Categoria',
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      ),
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      elevation: 2.0,
                                      borderColor: FlutterFlowTheme.of(context)
                                          .alternate,
                                      borderWidth: 2.0,
                                      borderRadius: 8.0,
                                      margin: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 4.0, 16.0, 4.0),
                                      hidesUnderline: true,
                                      isSearchable: false,
                                      isMultiSelect: false,
                                    );
                                  },
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 20.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              enableDrag: false,
                                              context: context,
                                              builder: (context) {
                                                return Padding(
                                                  padding:
                                                      MediaQuery.viewInsetsOf(
                                                          context),
                                                  child:
                                                      CirarumanovacategoriaWidget(),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          },
                                          text: 'Criar Nova Categoria',
                                          options: FFButtonOptions(
                                            width: 230.0,
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Lexend Deca',
                                                      color: Colors.white,
                                                      fontSize: 16.0,
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
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: TextFormField(
                                    controller: _model.textNomeQuizController,
                                    focusNode: _model.textNomeQuizFocusNode,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium,
                                      hintText: 'Nome',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      filled: true,
                                      fillColor: Colors.white,
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                    maxLines: null,
                                    validator: _model
                                        .textNomeQuizControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 15.0, 0.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 120.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: TextFormField(
                                      controller:
                                          _model.textDescricaoQuizController,
                                      focusNode:
                                          _model.textDescricaoQuizFocusNode,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium,
                                        hintText: 'Descrição',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        filled: true,
                                        fillColor: Colors.white,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                      maxLines: 7,
                                      validator: _model
                                          .textDescricaoQuizControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 15.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Liberar para amigos',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ),
                                      Switch.adaptive(
                                        value: _model.switchValue ??= false,
                                        onChanged: (newValue) async {
                                          setState(() =>
                                              _model.switchValue = newValue!);
                                        },
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        activeTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .accent1,
                                        inactiveTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                        inactiveThumbColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            await actions.importFromCsvOrJson(
                                              context,
                                              ',',
                                              currentUserReference!,
                                            );
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Sucesso!',
                                                  style: GoogleFonts.getFont(
                                                    'Nunito',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    fontSize: 14.0,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 2000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              ),
                                            );
                                          },
                                          text: 'Importar Quiz',
                                          options: FFButtonOptions(
                                            width: 230.0,
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Lexend Deca',
                                                      color: Colors.white,
                                                      fontSize: 16.0,
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
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 30.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 2.0, 20.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child:
                                          StreamBuilder<List<CategoriaRecord>>(
                                        stream: queryCategoriaRecord(
                                          queryBuilder: (categoriaRecord) =>
                                              categoriaRecord.where(
                                            'usuario',
                                            isEqualTo: currentUserReference,
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
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          List<CategoriaRecord>
                                              buttonCategoriaRecordList =
                                              snapshot.data!;
                                          return FFButtonWidget(
                                            onPressed: () async {
                                              if (_model.formKey.currentState ==
                                                      null ||
                                                  !_model.formKey.currentState!
                                                      .validate()) {
                                                return;
                                              }
                                              if (_model.uploadedLocalFile1 !=
                                                      null &&
                                                  (_model.uploadedLocalFile1
                                                          .bytes?.isNotEmpty ??
                                                      false)) {
                                                {
                                                  setState(() => _model
                                                      .isDataUploading2 = true);
                                                  var selectedUploadedFiles =
                                                      <FFUploadedFile>[];
                                                  var selectedMedia =
                                                      <SelectedFile>[];
                                                  var downloadUrls = <String>[];
                                                  try {
                                                    selectedUploadedFiles = _model
                                                            .uploadedLocalFile1
                                                            .bytes!
                                                            .isNotEmpty
                                                        ? [
                                                            _model
                                                                .uploadedLocalFile1
                                                          ]
                                                        : <FFUploadedFile>[];
                                                    selectedMedia =
                                                        selectedFilesFromUploadedFiles(
                                                      selectedUploadedFiles,
                                                    );
                                                    downloadUrls = (await Future
                                                            .wait(
                                                      selectedMedia.map(
                                                        (m) async =>
                                                            await uploadData(
                                                                m.storagePath,
                                                                m.bytes),
                                                      ),
                                                    ))
                                                        .where((u) => u != null)
                                                        .map((u) => u!)
                                                        .toList();
                                                  } finally {
                                                    _model.isDataUploading2 =
                                                        false;
                                                  }
                                                  if (selectedUploadedFiles
                                                              .length ==
                                                          selectedMedia
                                                              .length &&
                                                      downloadUrls.length ==
                                                          selectedMedia
                                                              .length) {
                                                    setState(() {
                                                      _model.uploadedLocalFile2 =
                                                          selectedUploadedFiles
                                                              .first;
                                                      _model.uploadedFileUrl2 =
                                                          downloadUrls.first;
                                                    });
                                                  } else {
                                                    setState(() {});
                                                    return;
                                                  }
                                                }

                                                _model.retornarCategoria =
                                                    await actions
                                                        .retornaCategoriaREFpeloTexto(
                                                  buttonCategoriaRecordList
                                                      .toList(),
                                                  _model.dropCategoriasValue!,
                                                );

                                                var quizRecordReference1 =
                                                    QuizRecord.collection.doc();
                                                await quizRecordReference1
                                                    .set(createQuizRecordData(
                                                  descricao: _model
                                                      .textDescricaoQuizController
                                                      .text,
                                                  imagem:
                                                      _model.uploadedFileUrl2,
                                                  usuario: currentUserReference,
                                                  tema: _model
                                                      .textNomeQuizController
                                                      .text,
                                                  data: getCurrentTimestamp,
                                                  categorias:
                                                      _model.retornarCategoria,
                                                  publico: _model.switchValue,
                                                ));
                                                _model.criarQuizComImagem =
                                                    QuizRecord.getDocumentFromData(
                                                        createQuizRecordData(
                                                          descricao: _model
                                                              .textDescricaoQuizController
                                                              .text,
                                                          imagem: _model
                                                              .uploadedFileUrl2,
                                                          usuario:
                                                              currentUserReference,
                                                          tema: _model
                                                              .textNomeQuizController
                                                              .text,
                                                          data:
                                                              getCurrentTimestamp,
                                                          categorias: _model
                                                              .retornarCategoria,
                                                          publico: _model
                                                              .switchValue,
                                                        ),
                                                        quizRecordReference1);
                                                if (_model.switchValue !=
                                                    null) {
                                                  await _model
                                                      .criarQuizComImagem!
                                                      .reference
                                                      .update({
                                                    ...mapToFirestore(
                                                      {
                                                        'usuarios':
                                                            (currentUserDocument
                                                                    ?.amigos
                                                                    ?.toList() ??
                                                                []),
                                                      },
                                                    ),
                                                  });
                                                  setState(() {
                                                    _model
                                                        .textNomeQuizController
                                                        ?.clear();
                                                    _model
                                                        .textDescricaoQuizController
                                                        ?.clear();
                                                  });
                                                  setState(() {
                                                    _model
                                                        .dropCategoriasValueController
                                                        ?.reset();
                                                  });
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Quiz criado com sucesso!',
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
                                                  Navigator.pop(context);
                                                } else {
                                                  setState(() {
                                                    _model
                                                        .textNomeQuizController
                                                        ?.clear();
                                                    _model
                                                        .textDescricaoQuizController
                                                        ?.clear();
                                                  });
                                                  setState(() {
                                                    _model
                                                        .dropCategoriasValueController
                                                        ?.reset();
                                                  });
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Quiz criado com sucesso!',
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
                                                  Navigator.pop(context);
                                                }
                                              } else {
                                                _model.retornarCategoriaSemFoto =
                                                    await actions
                                                        .retornaCategoriaREFpeloTexto(
                                                  buttonCategoriaRecordList
                                                      .toList(),
                                                  _model.dropCategoriasValue!,
                                                );

                                                var quizRecordReference2 =
                                                    QuizRecord.collection.doc();
                                                await quizRecordReference2
                                                    .set(createQuizRecordData(
                                                  descricao: _model
                                                      .textDescricaoQuizController
                                                      .text,
                                                  usuario: currentUserReference,
                                                  tema: _model
                                                      .textNomeQuizController
                                                      .text,
                                                  data: getCurrentTimestamp,
                                                  categorias: _model
                                                      .retornarCategoriaSemFoto,
                                                  publico: _model.switchValue,
                                                ));
                                                _model.criarQuizSemImagem =
                                                    QuizRecord.getDocumentFromData(
                                                        createQuizRecordData(
                                                          descricao: _model
                                                              .textDescricaoQuizController
                                                              .text,
                                                          usuario:
                                                              currentUserReference,
                                                          tema: _model
                                                              .textNomeQuizController
                                                              .text,
                                                          data:
                                                              getCurrentTimestamp,
                                                          categorias: _model
                                                              .retornarCategoriaSemFoto,
                                                          publico: _model
                                                              .switchValue,
                                                        ),
                                                        quizRecordReference2);
                                                if (_model.switchValue !=
                                                    null) {
                                                  await _model
                                                      .criarQuizSemImagem!
                                                      .reference
                                                      .update({
                                                    ...mapToFirestore(
                                                      {
                                                        'usuarios':
                                                            (currentUserDocument
                                                                    ?.amigos
                                                                    ?.toList() ??
                                                                []),
                                                      },
                                                    ),
                                                  });
                                                  setState(() {
                                                    _model
                                                        .textNomeQuizController
                                                        ?.clear();
                                                    _model
                                                        .textDescricaoQuizController
                                                        ?.clear();
                                                  });
                                                  setState(() {
                                                    _model
                                                        .dropCategoriasValueController
                                                        ?.reset();
                                                  });
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Quiz criado com sucesso!',
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
                                                  Navigator.pop(context);
                                                } else {
                                                  setState(() {
                                                    _model
                                                        .textNomeQuizController
                                                        ?.clear();
                                                    _model
                                                        .textDescricaoQuizController
                                                        ?.clear();
                                                  });
                                                  setState(() {
                                                    _model
                                                        .dropCategoriasValueController
                                                        ?.reset();
                                                  });
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Quiz criado com sucesso!',
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
                                                  Navigator.pop(context);
                                                }
                                              }

                                              setState(() {});
                                            },
                                            text: 'Criar Quiz',
                                            options: FFButtonOptions(
                                              width: 230.0,
                                              height: 40.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: Color(0xFFFF6900),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        color: Colors.white,
                                                        fontSize: 16.0,
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
