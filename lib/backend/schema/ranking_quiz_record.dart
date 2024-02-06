import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RankingQuizRecord extends FirestoreRecord {
  RankingQuizRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "quiz" field.
  DocumentReference? _quiz;
  DocumentReference? get quiz => _quiz;
  bool hasQuiz() => _quiz != null;

  // "participantes" field.
  List<DocumentReference>? _participantes;
  List<DocumentReference> get participantes => _participantes ?? const [];
  bool hasParticipantes() => _participantes != null;

  // "usuario" field.
  DocumentReference? _usuario;
  DocumentReference? get usuario => _usuario;
  bool hasUsuario() => _usuario != null;

  // "pontuacao" field.
  int? _pontuacao;
  int get pontuacao => _pontuacao ?? 0;
  bool hasPontuacao() => _pontuacao != null;

  // "convite" field.
  DocumentReference? _convite;
  DocumentReference? get convite => _convite;
  bool hasConvite() => _convite != null;

  // "data" field.
  DateTime? _data;
  DateTime? get data => _data;
  bool hasData() => _data != null;

  void _initializeFields() {
    _quiz = snapshotData['quiz'] as DocumentReference?;
    _participantes = getDataList(snapshotData['participantes']);
    _usuario = snapshotData['usuario'] as DocumentReference?;
    _pontuacao = castToType<int>(snapshotData['pontuacao']);
    _convite = snapshotData['convite'] as DocumentReference?;
    _data = snapshotData['data'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ranking_quiz');

  static Stream<RankingQuizRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RankingQuizRecord.fromSnapshot(s));

  static Future<RankingQuizRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RankingQuizRecord.fromSnapshot(s));

  static RankingQuizRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RankingQuizRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RankingQuizRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RankingQuizRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RankingQuizRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RankingQuizRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRankingQuizRecordData({
  DocumentReference? quiz,
  DocumentReference? usuario,
  int? pontuacao,
  DocumentReference? convite,
  DateTime? data,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'quiz': quiz,
      'usuario': usuario,
      'pontuacao': pontuacao,
      'convite': convite,
      'data': data,
    }.withoutNulls,
  );

  return firestoreData;
}

class RankingQuizRecordDocumentEquality implements Equality<RankingQuizRecord> {
  const RankingQuizRecordDocumentEquality();

  @override
  bool equals(RankingQuizRecord? e1, RankingQuizRecord? e2) {
    const listEquality = ListEquality();
    return e1?.quiz == e2?.quiz &&
        listEquality.equals(e1?.participantes, e2?.participantes) &&
        e1?.usuario == e2?.usuario &&
        e1?.pontuacao == e2?.pontuacao &&
        e1?.convite == e2?.convite &&
        e1?.data == e2?.data;
  }

  @override
  int hash(RankingQuizRecord? e) => const ListEquality().hash([
        e?.quiz,
        e?.participantes,
        e?.usuario,
        e?.pontuacao,
        e?.convite,
        e?.data
      ]);

  @override
  bool isValidKey(Object? o) => o is RankingQuizRecord;
}
