import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RankingRecord extends FirestoreRecord {
  RankingRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "usuario" field.
  DocumentReference? _usuario;
  DocumentReference? get usuario => _usuario;
  bool hasUsuario() => _usuario != null;

  // "pontuacao" field.
  int? _pontuacao;
  int get pontuacao => _pontuacao ?? 0;
  bool hasPontuacao() => _pontuacao != null;

  // "data" field.
  DateTime? _data;
  DateTime? get data => _data;
  bool hasData() => _data != null;

  // "quiz" field.
  DocumentReference? _quiz;
  DocumentReference? get quiz => _quiz;
  bool hasQuiz() => _quiz != null;

  void _initializeFields() {
    _usuario = snapshotData['usuario'] as DocumentReference?;
    _pontuacao = castToType<int>(snapshotData['pontuacao']);
    _data = snapshotData['data'] as DateTime?;
    _quiz = snapshotData['quiz'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ranking');

  static Stream<RankingRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RankingRecord.fromSnapshot(s));

  static Future<RankingRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RankingRecord.fromSnapshot(s));

  static RankingRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RankingRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RankingRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RankingRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RankingRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RankingRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRankingRecordData({
  DocumentReference? usuario,
  int? pontuacao,
  DateTime? data,
  DocumentReference? quiz,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'usuario': usuario,
      'pontuacao': pontuacao,
      'data': data,
      'quiz': quiz,
    }.withoutNulls,
  );

  return firestoreData;
}

class RankingRecordDocumentEquality implements Equality<RankingRecord> {
  const RankingRecordDocumentEquality();

  @override
  bool equals(RankingRecord? e1, RankingRecord? e2) {
    return e1?.usuario == e2?.usuario &&
        e1?.pontuacao == e2?.pontuacao &&
        e1?.data == e2?.data &&
        e1?.quiz == e2?.quiz;
  }

  @override
  int hash(RankingRecord? e) =>
      const ListEquality().hash([e?.usuario, e?.pontuacao, e?.data, e?.quiz]);

  @override
  bool isValidKey(Object? o) => o is RankingRecord;
}
