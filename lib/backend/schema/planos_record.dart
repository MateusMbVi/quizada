import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PlanosRecord extends FirestoreRecord {
  PlanosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  bool hasNome() => _nome != null;

  // "descricao" field.
  String? _descricao;
  String get descricao => _descricao ?? '';
  bool hasDescricao() => _descricao != null;

  // "periodo" field.
  int? _periodo;
  int get periodo => _periodo ?? 0;
  bool hasPeriodo() => _periodo != null;

  // "preco" field.
  double? _preco;
  double get preco => _preco ?? 0.0;
  bool hasPreco() => _preco != null;

  void _initializeFields() {
    _nome = snapshotData['nome'] as String?;
    _descricao = snapshotData['descricao'] as String?;
    _periodo = castToType<int>(snapshotData['periodo']);
    _preco = castToType<double>(snapshotData['preco']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('planos');

  static Stream<PlanosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PlanosRecord.fromSnapshot(s));

  static Future<PlanosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PlanosRecord.fromSnapshot(s));

  static PlanosRecord fromSnapshot(DocumentSnapshot snapshot) => PlanosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PlanosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PlanosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PlanosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PlanosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPlanosRecordData({
  String? nome,
  String? descricao,
  int? periodo,
  double? preco,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nome': nome,
      'descricao': descricao,
      'periodo': periodo,
      'preco': preco,
    }.withoutNulls,
  );

  return firestoreData;
}

class PlanosRecordDocumentEquality implements Equality<PlanosRecord> {
  const PlanosRecordDocumentEquality();

  @override
  bool equals(PlanosRecord? e1, PlanosRecord? e2) {
    return e1?.nome == e2?.nome &&
        e1?.descricao == e2?.descricao &&
        e1?.periodo == e2?.periodo &&
        e1?.preco == e2?.preco;
  }

  @override
  int hash(PlanosRecord? e) =>
      const ListEquality().hash([e?.nome, e?.descricao, e?.periodo, e?.preco]);

  @override
  bool isValidKey(Object? o) => o is PlanosRecord;
}
