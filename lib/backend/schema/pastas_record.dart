import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PastasRecord extends FirestoreRecord {
  PastasRecord._(
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

  // "quizes" field.
  List<DocumentReference>? _quizes;
  List<DocumentReference> get quizes => _quizes ?? const [];
  bool hasQuizes() => _quizes != null;

  // "publico" field.
  bool? _publico;
  bool get publico => _publico ?? false;
  bool hasPublico() => _publico != null;

  // "dataa" field.
  DateTime? _dataa;
  DateTime? get dataa => _dataa;
  bool hasDataa() => _dataa != null;

  // "identificador" field.
  String? _identificador;
  String get identificador => _identificador ?? '';
  bool hasIdentificador() => _identificador != null;

  void _initializeFields() {
    _nome = snapshotData['nome'] as String?;
    _descricao = snapshotData['descricao'] as String?;
    _quizes = getDataList(snapshotData['quizes']);
    _publico = snapshotData['publico'] as bool?;
    _dataa = snapshotData['dataa'] as DateTime?;
    _identificador = snapshotData['identificador'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('pastas');

  static Stream<PastasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PastasRecord.fromSnapshot(s));

  static Future<PastasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PastasRecord.fromSnapshot(s));

  static PastasRecord fromSnapshot(DocumentSnapshot snapshot) => PastasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PastasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PastasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PastasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PastasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPastasRecordData({
  String? nome,
  String? descricao,
  bool? publico,
  DateTime? dataa,
  String? identificador,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nome': nome,
      'descricao': descricao,
      'publico': publico,
      'dataa': dataa,
      'identificador': identificador,
    }.withoutNulls,
  );

  return firestoreData;
}

class PastasRecordDocumentEquality implements Equality<PastasRecord> {
  const PastasRecordDocumentEquality();

  @override
  bool equals(PastasRecord? e1, PastasRecord? e2) {
    const listEquality = ListEquality();
    return e1?.nome == e2?.nome &&
        e1?.descricao == e2?.descricao &&
        listEquality.equals(e1?.quizes, e2?.quizes) &&
        e1?.publico == e2?.publico &&
        e1?.dataa == e2?.dataa &&
        e1?.identificador == e2?.identificador;
  }

  @override
  int hash(PastasRecord? e) => const ListEquality().hash([
        e?.nome,
        e?.descricao,
        e?.quizes,
        e?.publico,
        e?.dataa,
        e?.identificador
      ]);

  @override
  bool isValidKey(Object? o) => o is PastasRecord;
}
