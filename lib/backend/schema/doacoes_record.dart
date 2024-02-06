import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DoacoesRecord extends FirestoreRecord {
  DoacoesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "valor" field.
  double? _valor;
  double get valor => _valor ?? 0.0;
  bool hasValor() => _valor != null;

  // "data" field.
  DateTime? _data;
  DateTime? get data => _data;
  bool hasData() => _data != null;

  // "id_pedido" field.
  int? _idPedido;
  int get idPedido => _idPedido ?? 0;
  bool hasIdPedido() => _idPedido != null;

  // "usuario" field.
  DocumentReference? _usuario;
  DocumentReference? get usuario => _usuario;
  bool hasUsuario() => _usuario != null;

  // "chave_pix" field.
  String? _chavePix;
  String get chavePix => _chavePix ?? '';
  bool hasChavePix() => _chavePix != null;

  // "qr_code" field.
  String? _qrCode;
  String get qrCode => _qrCode ?? '';
  bool hasQrCode() => _qrCode != null;

  void _initializeFields() {
    _valor = castToType<double>(snapshotData['valor']);
    _data = snapshotData['data'] as DateTime?;
    _idPedido = castToType<int>(snapshotData['id_pedido']);
    _usuario = snapshotData['usuario'] as DocumentReference?;
    _chavePix = snapshotData['chave_pix'] as String?;
    _qrCode = snapshotData['qr_code'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('doacoes');

  static Stream<DoacoesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DoacoesRecord.fromSnapshot(s));

  static Future<DoacoesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DoacoesRecord.fromSnapshot(s));

  static DoacoesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DoacoesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DoacoesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DoacoesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DoacoesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DoacoesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDoacoesRecordData({
  double? valor,
  DateTime? data,
  int? idPedido,
  DocumentReference? usuario,
  String? chavePix,
  String? qrCode,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'valor': valor,
      'data': data,
      'id_pedido': idPedido,
      'usuario': usuario,
      'chave_pix': chavePix,
      'qr_code': qrCode,
    }.withoutNulls,
  );

  return firestoreData;
}

class DoacoesRecordDocumentEquality implements Equality<DoacoesRecord> {
  const DoacoesRecordDocumentEquality();

  @override
  bool equals(DoacoesRecord? e1, DoacoesRecord? e2) {
    return e1?.valor == e2?.valor &&
        e1?.data == e2?.data &&
        e1?.idPedido == e2?.idPedido &&
        e1?.usuario == e2?.usuario &&
        e1?.chavePix == e2?.chavePix &&
        e1?.qrCode == e2?.qrCode;
  }

  @override
  int hash(DoacoesRecord? e) => const ListEquality().hash(
      [e?.valor, e?.data, e?.idPedido, e?.usuario, e?.chavePix, e?.qrCode]);

  @override
  bool isValidKey(Object? o) => o is DoacoesRecord;
}
