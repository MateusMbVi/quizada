import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PerguntasRecord extends FirestoreRecord {
  PerguntasRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "texto_pergunta" field.
  String? _textoPergunta;
  String get textoPergunta => _textoPergunta ?? '';
  bool hasTextoPergunta() => _textoPergunta != null;

  // "alternativa_A" field.
  String? _alternativaA;
  String get alternativaA => _alternativaA ?? '';
  bool hasAlternativaA() => _alternativaA != null;

  // "alternativa_B" field.
  String? _alternativaB;
  String get alternativaB => _alternativaB ?? '';
  bool hasAlternativaB() => _alternativaB != null;

  // "alternativa_C" field.
  String? _alternativaC;
  String get alternativaC => _alternativaC ?? '';
  bool hasAlternativaC() => _alternativaC != null;

  // "alternativa_D" field.
  String? _alternativaD;
  String get alternativaD => _alternativaD ?? '';
  bool hasAlternativaD() => _alternativaD != null;

  // "alternativa_E" field.
  String? _alternativaE;
  String get alternativaE => _alternativaE ?? '';
  bool hasAlternativaE() => _alternativaE != null;

  // "alternativa_F" field.
  String? _alternativaF;
  String get alternativaF => _alternativaF ?? '';
  bool hasAlternativaF() => _alternativaF != null;

  // "quiz" field.
  DocumentReference? _quiz;
  DocumentReference? get quiz => _quiz;
  bool hasQuiz() => _quiz != null;

  // "imagem" field.
  String? _imagem;
  String get imagem => _imagem ?? '';
  bool hasImagem() => _imagem != null;

  // "correta" field.
  String? _correta;
  String get correta => _correta ?? '';
  bool hasCorreta() => _correta != null;

  // "alternativas" field.
  List<String>? _alternativas;
  List<String> get alternativas => _alternativas ?? const [];
  bool hasAlternativas() => _alternativas != null;

  // "identificacao" field.
  List<String>? _identificacao;
  List<String> get identificacao => _identificacao ?? const [];
  bool hasIdentificacao() => _identificacao != null;

  void _initializeFields() {
    _textoPergunta = snapshotData['texto_pergunta'] as String?;
    _alternativaA = snapshotData['alternativa_A'] as String?;
    _alternativaB = snapshotData['alternativa_B'] as String?;
    _alternativaC = snapshotData['alternativa_C'] as String?;
    _alternativaD = snapshotData['alternativa_D'] as String?;
    _alternativaE = snapshotData['alternativa_E'] as String?;
    _alternativaF = snapshotData['alternativa_F'] as String?;
    _quiz = snapshotData['quiz'] as DocumentReference?;
    _imagem = snapshotData['imagem'] as String?;
    _correta = snapshotData['correta'] as String?;
    _alternativas = getDataList(snapshotData['alternativas']);
    _identificacao = getDataList(snapshotData['identificacao']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('perguntas');

  static Stream<PerguntasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PerguntasRecord.fromSnapshot(s));

  static Future<PerguntasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PerguntasRecord.fromSnapshot(s));

  static PerguntasRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PerguntasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PerguntasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PerguntasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PerguntasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PerguntasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPerguntasRecordData({
  String? textoPergunta,
  String? alternativaA,
  String? alternativaB,
  String? alternativaC,
  String? alternativaD,
  String? alternativaE,
  String? alternativaF,
  DocumentReference? quiz,
  String? imagem,
  String? correta,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'texto_pergunta': textoPergunta,
      'alternativa_A': alternativaA,
      'alternativa_B': alternativaB,
      'alternativa_C': alternativaC,
      'alternativa_D': alternativaD,
      'alternativa_E': alternativaE,
      'alternativa_F': alternativaF,
      'quiz': quiz,
      'imagem': imagem,
      'correta': correta,
    }.withoutNulls,
  );

  return firestoreData;
}

class PerguntasRecordDocumentEquality implements Equality<PerguntasRecord> {
  const PerguntasRecordDocumentEquality();

  @override
  bool equals(PerguntasRecord? e1, PerguntasRecord? e2) {
    const listEquality = ListEquality();
    return e1?.textoPergunta == e2?.textoPergunta &&
        e1?.alternativaA == e2?.alternativaA &&
        e1?.alternativaB == e2?.alternativaB &&
        e1?.alternativaC == e2?.alternativaC &&
        e1?.alternativaD == e2?.alternativaD &&
        e1?.alternativaE == e2?.alternativaE &&
        e1?.alternativaF == e2?.alternativaF &&
        e1?.quiz == e2?.quiz &&
        e1?.imagem == e2?.imagem &&
        e1?.correta == e2?.correta &&
        listEquality.equals(e1?.alternativas, e2?.alternativas) &&
        listEquality.equals(e1?.identificacao, e2?.identificacao);
  }

  @override
  int hash(PerguntasRecord? e) => const ListEquality().hash([
        e?.textoPergunta,
        e?.alternativaA,
        e?.alternativaB,
        e?.alternativaC,
        e?.alternativaD,
        e?.alternativaE,
        e?.alternativaF,
        e?.quiz,
        e?.imagem,
        e?.correta,
        e?.alternativas,
        e?.identificacao
      ]);

  @override
  bool isValidKey(Object? o) => o is PerguntasRecord;
}
