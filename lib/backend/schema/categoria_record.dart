import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CategoriaRecord extends FirestoreRecord {
  CategoriaRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  bool hasNome() => _nome != null;

  // "imagem" field.
  String? _imagem;
  String get imagem => _imagem ?? '';
  bool hasImagem() => _imagem != null;

  // "usuario" field.
  DocumentReference? _usuario;
  DocumentReference? get usuario => _usuario;
  bool hasUsuario() => _usuario != null;

  void _initializeFields() {
    _nome = snapshotData['nome'] as String?;
    _imagem = snapshotData['imagem'] as String?;
    _usuario = snapshotData['usuario'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('categoria');

  static Stream<CategoriaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CategoriaRecord.fromSnapshot(s));

  static Future<CategoriaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CategoriaRecord.fromSnapshot(s));

  static CategoriaRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CategoriaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CategoriaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CategoriaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CategoriaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CategoriaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCategoriaRecordData({
  String? nome,
  String? imagem,
  DocumentReference? usuario,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nome': nome,
      'imagem': imagem,
      'usuario': usuario,
    }.withoutNulls,
  );

  return firestoreData;
}

class CategoriaRecordDocumentEquality implements Equality<CategoriaRecord> {
  const CategoriaRecordDocumentEquality();

  @override
  bool equals(CategoriaRecord? e1, CategoriaRecord? e2) {
    return e1?.nome == e2?.nome &&
        e1?.imagem == e2?.imagem &&
        e1?.usuario == e2?.usuario;
  }

  @override
  int hash(CategoriaRecord? e) =>
      const ListEquality().hash([e?.nome, e?.imagem, e?.usuario]);

  @override
  bool isValidKey(Object? o) => o is CategoriaRecord;
}
