// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AlternativasStruct extends FFFirebaseStruct {
  AlternativasStruct({
    String? alternativa,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _alternativa = alternativa,
        super(firestoreUtilData);

  // "alternativa" field.
  String? _alternativa;
  String get alternativa => _alternativa ?? '';
  set alternativa(String? val) => _alternativa = val;
  bool hasAlternativa() => _alternativa != null;

  static AlternativasStruct fromMap(Map<String, dynamic> data) =>
      AlternativasStruct(
        alternativa: data['alternativa'] as String?,
      );

  static AlternativasStruct? maybeFromMap(dynamic data) => data is Map
      ? AlternativasStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'alternativa': _alternativa,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'alternativa': serializeParam(
          _alternativa,
          ParamType.String,
        ),
      }.withoutNulls;

  static AlternativasStruct fromSerializableMap(Map<String, dynamic> data) =>
      AlternativasStruct(
        alternativa: deserializeParam(
          data['alternativa'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AlternativasStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AlternativasStruct && alternativa == other.alternativa;
  }

  @override
  int get hashCode => const ListEquality().hash([alternativa]);
}

AlternativasStruct createAlternativasStruct({
  String? alternativa,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AlternativasStruct(
      alternativa: alternativa,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AlternativasStruct? updateAlternativasStruct(
  AlternativasStruct? alternativas, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    alternativas
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAlternativasStructData(
  Map<String, dynamic> firestoreData,
  AlternativasStruct? alternativas,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (alternativas == null) {
    return;
  }
  if (alternativas.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && alternativas.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final alternativasData =
      getAlternativasFirestoreData(alternativas, forFieldValue);
  final nestedData =
      alternativasData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = alternativas.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAlternativasFirestoreData(
  AlternativasStruct? alternativas, [
  bool forFieldValue = false,
]) {
  if (alternativas == null) {
    return {};
  }
  final firestoreData = mapToFirestore(alternativas.toMap());

  // Add any Firestore field values
  alternativas.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAlternativasListFirestoreData(
  List<AlternativasStruct>? alternativass,
) =>
    alternativass?.map((e) => getAlternativasFirestoreData(e, true)).toList() ??
    [];
