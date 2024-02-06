import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DescricaoCheckoutRecord extends FirestoreRecord {
  DescricaoCheckoutRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "titulo" field.
  String? _titulo;
  String get titulo => _titulo ?? '';
  bool hasTitulo() => _titulo != null;

  // "descricao" field.
  String? _descricao;
  String get descricao => _descricao ?? '';
  bool hasDescricao() => _descricao != null;

  void _initializeFields() {
    _titulo = snapshotData['titulo'] as String?;
    _descricao = snapshotData['descricao'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('descricao_checkout');

  static Stream<DescricaoCheckoutRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DescricaoCheckoutRecord.fromSnapshot(s));

  static Future<DescricaoCheckoutRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => DescricaoCheckoutRecord.fromSnapshot(s));

  static DescricaoCheckoutRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DescricaoCheckoutRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DescricaoCheckoutRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DescricaoCheckoutRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DescricaoCheckoutRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DescricaoCheckoutRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDescricaoCheckoutRecordData({
  String? titulo,
  String? descricao,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'titulo': titulo,
      'descricao': descricao,
    }.withoutNulls,
  );

  return firestoreData;
}

class DescricaoCheckoutRecordDocumentEquality
    implements Equality<DescricaoCheckoutRecord> {
  const DescricaoCheckoutRecordDocumentEquality();

  @override
  bool equals(DescricaoCheckoutRecord? e1, DescricaoCheckoutRecord? e2) {
    return e1?.titulo == e2?.titulo && e1?.descricao == e2?.descricao;
  }

  @override
  int hash(DescricaoCheckoutRecord? e) =>
      const ListEquality().hash([e?.titulo, e?.descricao]);

  @override
  bool isValidKey(Object? o) => o is DescricaoCheckoutRecord;
}
