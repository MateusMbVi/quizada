import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BannersRecord extends FirestoreRecord {
  BannersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "imagem" field.
  String? _imagem;
  String get imagem => _imagem ?? '';
  bool hasImagem() => _imagem != null;

  // "url" field.
  String? _url;
  String get url => _url ?? '';
  bool hasUrl() => _url != null;

  void _initializeFields() {
    _imagem = snapshotData['imagem'] as String?;
    _url = snapshotData['url'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('banners');

  static Stream<BannersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BannersRecord.fromSnapshot(s));

  static Future<BannersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BannersRecord.fromSnapshot(s));

  static BannersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BannersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BannersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BannersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BannersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BannersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBannersRecordData({
  String? imagem,
  String? url,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'imagem': imagem,
      'url': url,
    }.withoutNulls,
  );

  return firestoreData;
}

class BannersRecordDocumentEquality implements Equality<BannersRecord> {
  const BannersRecordDocumentEquality();

  @override
  bool equals(BannersRecord? e1, BannersRecord? e2) {
    return e1?.imagem == e2?.imagem && e1?.url == e2?.url;
  }

  @override
  int hash(BannersRecord? e) => const ListEquality().hash([e?.imagem, e?.url]);

  @override
  bool isValidKey(Object? o) => o is BannersRecord;
}
