import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ConvitesRecord extends FirestoreRecord {
  ConvitesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "usuario_solicitou" field.
  DocumentReference? _usuarioSolicitou;
  DocumentReference? get usuarioSolicitou => _usuarioSolicitou;
  bool hasUsuarioSolicitou() => _usuarioSolicitou != null;

  // "participantes" field.
  List<DocumentReference>? _participantes;
  List<DocumentReference> get participantes => _participantes ?? const [];
  bool hasParticipantes() => _participantes != null;

  // "data" field.
  DateTime? _data;
  DateTime? get data => _data;
  bool hasData() => _data != null;

  // "quiz" field.
  DocumentReference? _quiz;
  DocumentReference? get quiz => _quiz;
  bool hasQuiz() => _quiz != null;

  // "usuarios_aceitar" field.
  List<DocumentReference>? _usuariosAceitar;
  List<DocumentReference> get usuariosAceitar => _usuariosAceitar ?? const [];
  bool hasUsuariosAceitar() => _usuariosAceitar != null;

  // "perguntas_quiz" field.
  List<DocumentReference>? _perguntasQuiz;
  List<DocumentReference> get perguntasQuiz => _perguntasQuiz ?? const [];
  bool hasPerguntasQuiz() => _perguntasQuiz != null;

  // "identificacao" field.
  String? _identificacao;
  String get identificacao => _identificacao ?? '';
  bool hasIdentificacao() => _identificacao != null;

  // "quiz_realizado" field.
  bool? _quizRealizado;
  bool get quizRealizado => _quizRealizado ?? false;
  bool hasQuizRealizado() => _quizRealizado != null;

  void _initializeFields() {
    _usuarioSolicitou = snapshotData['usuario_solicitou'] as DocumentReference?;
    _participantes = getDataList(snapshotData['participantes']);
    _data = snapshotData['data'] as DateTime?;
    _quiz = snapshotData['quiz'] as DocumentReference?;
    _usuariosAceitar = getDataList(snapshotData['usuarios_aceitar']);
    _perguntasQuiz = getDataList(snapshotData['perguntas_quiz']);
    _identificacao = snapshotData['identificacao'] as String?;
    _quizRealizado = snapshotData['quiz_realizado'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('convites');

  static Stream<ConvitesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ConvitesRecord.fromSnapshot(s));

  static Future<ConvitesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ConvitesRecord.fromSnapshot(s));

  static ConvitesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ConvitesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ConvitesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ConvitesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ConvitesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ConvitesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createConvitesRecordData({
  DocumentReference? usuarioSolicitou,
  DateTime? data,
  DocumentReference? quiz,
  String? identificacao,
  bool? quizRealizado,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'usuario_solicitou': usuarioSolicitou,
      'data': data,
      'quiz': quiz,
      'identificacao': identificacao,
      'quiz_realizado': quizRealizado,
    }.withoutNulls,
  );

  return firestoreData;
}

class ConvitesRecordDocumentEquality implements Equality<ConvitesRecord> {
  const ConvitesRecordDocumentEquality();

  @override
  bool equals(ConvitesRecord? e1, ConvitesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.usuarioSolicitou == e2?.usuarioSolicitou &&
        listEquality.equals(e1?.participantes, e2?.participantes) &&
        e1?.data == e2?.data &&
        e1?.quiz == e2?.quiz &&
        listEquality.equals(e1?.usuariosAceitar, e2?.usuariosAceitar) &&
        listEquality.equals(e1?.perguntasQuiz, e2?.perguntasQuiz) &&
        e1?.identificacao == e2?.identificacao &&
        e1?.quizRealizado == e2?.quizRealizado;
  }

  @override
  int hash(ConvitesRecord? e) => const ListEquality().hash([
        e?.usuarioSolicitou,
        e?.participantes,
        e?.data,
        e?.quiz,
        e?.usuariosAceitar,
        e?.perguntasQuiz,
        e?.identificacao,
        e?.quizRealizado
      ]);

  @override
  bool isValidKey(Object? o) => o is ConvitesRecord;
}
