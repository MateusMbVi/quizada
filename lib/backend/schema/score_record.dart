import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ScoreRecord extends FirestoreRecord {
  ScoreRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "usuario" field.
  DocumentReference? _usuario;
  DocumentReference? get usuario => _usuario;
  bool hasUsuario() => _usuario != null;

  // "meta_pontos" field.
  int? _metaPontos;
  int get metaPontos => _metaPontos ?? 0;
  bool hasMetaPontos() => _metaPontos != null;

  // "pontuacao" field.
  int? _pontuacao;
  int get pontuacao => _pontuacao ?? 0;
  bool hasPontuacao() => _pontuacao != null;

  // "quiz" field.
  DocumentReference? _quiz;
  DocumentReference? get quiz => _quiz;
  bool hasQuiz() => _quiz != null;

  void _initializeFields() {
    _usuario = snapshotData['usuario'] as DocumentReference?;
    _metaPontos = castToType<int>(snapshotData['meta_pontos']);
    _pontuacao = castToType<int>(snapshotData['pontuacao']);
    _quiz = snapshotData['quiz'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('score');

  static Stream<ScoreRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ScoreRecord.fromSnapshot(s));

  static Future<ScoreRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ScoreRecord.fromSnapshot(s));

  static ScoreRecord fromSnapshot(DocumentSnapshot snapshot) => ScoreRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ScoreRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ScoreRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ScoreRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ScoreRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createScoreRecordData({
  DocumentReference? usuario,
  int? metaPontos,
  int? pontuacao,
  DocumentReference? quiz,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'usuario': usuario,
      'meta_pontos': metaPontos,
      'pontuacao': pontuacao,
      'quiz': quiz,
    }.withoutNulls,
  );

  return firestoreData;
}

class ScoreRecordDocumentEquality implements Equality<ScoreRecord> {
  const ScoreRecordDocumentEquality();

  @override
  bool equals(ScoreRecord? e1, ScoreRecord? e2) {
    return e1?.usuario == e2?.usuario &&
        e1?.metaPontos == e2?.metaPontos &&
        e1?.pontuacao == e2?.pontuacao &&
        e1?.quiz == e2?.quiz;
  }

  @override
  int hash(ScoreRecord? e) => const ListEquality()
      .hash([e?.usuario, e?.metaPontos, e?.pontuacao, e?.quiz]);

  @override
  bool isValidKey(Object? o) => o is ScoreRecord;
}
