import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RespostasRecord extends FirestoreRecord {
  RespostasRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "alternativa" field.
  String? _alternativa;
  String get alternativa => _alternativa ?? '';
  bool hasAlternativa() => _alternativa != null;

  // "usuario" field.
  DocumentReference? _usuario;
  DocumentReference? get usuario => _usuario;
  bool hasUsuario() => _usuario != null;

  // "pergunta" field.
  DocumentReference? _pergunta;
  DocumentReference? get pergunta => _pergunta;
  bool hasPergunta() => _pergunta != null;

  // "quiz" field.
  DocumentReference? _quiz;
  DocumentReference? get quiz => _quiz;
  bool hasQuiz() => _quiz != null;

  // "alternativa_correta" field.
  String? _alternativaCorreta;
  String get alternativaCorreta => _alternativaCorreta ?? '';
  bool hasAlternativaCorreta() => _alternativaCorreta != null;

  // "resposta_escrita" field.
  String? _respostaEscrita;
  String get respostaEscrita => _respostaEscrita ?? '';
  bool hasRespostaEscrita() => _respostaEscrita != null;

  // "alternativa_letra" field.
  String? _alternativaLetra;
  String get alternativaLetra => _alternativaLetra ?? '';
  bool hasAlternativaLetra() => _alternativaLetra != null;

  void _initializeFields() {
    _alternativa = snapshotData['alternativa'] as String?;
    _usuario = snapshotData['usuario'] as DocumentReference?;
    _pergunta = snapshotData['pergunta'] as DocumentReference?;
    _quiz = snapshotData['quiz'] as DocumentReference?;
    _alternativaCorreta = snapshotData['alternativa_correta'] as String?;
    _respostaEscrita = snapshotData['resposta_escrita'] as String?;
    _alternativaLetra = snapshotData['alternativa_letra'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('respostas');

  static Stream<RespostasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RespostasRecord.fromSnapshot(s));

  static Future<RespostasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RespostasRecord.fromSnapshot(s));

  static RespostasRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RespostasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RespostasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RespostasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RespostasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RespostasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRespostasRecordData({
  String? alternativa,
  DocumentReference? usuario,
  DocumentReference? pergunta,
  DocumentReference? quiz,
  String? alternativaCorreta,
  String? respostaEscrita,
  String? alternativaLetra,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'alternativa': alternativa,
      'usuario': usuario,
      'pergunta': pergunta,
      'quiz': quiz,
      'alternativa_correta': alternativaCorreta,
      'resposta_escrita': respostaEscrita,
      'alternativa_letra': alternativaLetra,
    }.withoutNulls,
  );

  return firestoreData;
}

class RespostasRecordDocumentEquality implements Equality<RespostasRecord> {
  const RespostasRecordDocumentEquality();

  @override
  bool equals(RespostasRecord? e1, RespostasRecord? e2) {
    return e1?.alternativa == e2?.alternativa &&
        e1?.usuario == e2?.usuario &&
        e1?.pergunta == e2?.pergunta &&
        e1?.quiz == e2?.quiz &&
        e1?.alternativaCorreta == e2?.alternativaCorreta &&
        e1?.respostaEscrita == e2?.respostaEscrita &&
        e1?.alternativaLetra == e2?.alternativaLetra;
  }

  @override
  int hash(RespostasRecord? e) => const ListEquality().hash([
        e?.alternativa,
        e?.usuario,
        e?.pergunta,
        e?.quiz,
        e?.alternativaCorreta,
        e?.respostaEscrita,
        e?.alternativaLetra
      ]);

  @override
  bool isValidKey(Object? o) => o is RespostasRecord;
}
