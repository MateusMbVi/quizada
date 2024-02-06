import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuizRecord extends FirestoreRecord {
  QuizRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "descricao" field.
  String? _descricao;
  String get descricao => _descricao ?? '';
  bool hasDescricao() => _descricao != null;

  // "imagem" field.
  String? _imagem;
  String get imagem => _imagem ?? '';
  bool hasImagem() => _imagem != null;

  // "usuario" field.
  DocumentReference? _usuario;
  DocumentReference? get usuario => _usuario;
  bool hasUsuario() => _usuario != null;

  // "tema" field.
  String? _tema;
  String get tema => _tema ?? '';
  bool hasTema() => _tema != null;

  // "privado" field.
  bool? _privado;
  bool get privado => _privado ?? false;
  bool hasPrivado() => _privado != null;

  // "publico" field.
  bool? _publico;
  bool get publico => _publico ?? false;
  bool hasPublico() => _publico != null;

  // "nome_autor" field.
  String? _nomeAutor;
  String get nomeAutor => _nomeAutor ?? '';
  bool hasNomeAutor() => _nomeAutor != null;

  // "data" field.
  DateTime? _data;
  DateTime? get data => _data;
  bool hasData() => _data != null;

  // "participantes" field.
  List<DocumentReference>? _participantes;
  List<DocumentReference> get participantes => _participantes ?? const [];
  bool hasParticipantes() => _participantes != null;

  // "jogadas" field.
  int? _jogadas;
  int get jogadas => _jogadas ?? 0;
  bool hasJogadas() => _jogadas != null;

  // "favoritados" field.
  int? _favoritados;
  int get favoritados => _favoritados ?? 0;
  bool hasFavoritados() => _favoritados != null;

  // "identificacoes" field.
  List<String>? _identificacoes;
  List<String> get identificacoes => _identificacoes ?? const [];
  bool hasIdentificacoes() => _identificacoes != null;

  // "usuarios" field.
  List<DocumentReference>? _usuarios;
  List<DocumentReference> get usuarios => _usuarios ?? const [];
  bool hasUsuarios() => _usuarios != null;

  // "identificadores_jogar_sozinho" field.
  List<String>? _identificadoresJogarSozinho;
  List<String> get identificadoresJogarSozinho =>
      _identificadoresJogarSozinho ?? const [];
  bool hasIdentificadoresJogarSozinho() => _identificadoresJogarSozinho != null;

  // "categorias" field.
  DocumentReference? _categorias;
  DocumentReference? get categorias => _categorias;
  bool hasCategorias() => _categorias != null;

  // "identificador_pasta" field.
  String? _identificadorPasta;
  String get identificadorPasta => _identificadorPasta ?? '';
  bool hasIdentificadorPasta() => _identificadorPasta != null;

  // "pasta" field.
  DocumentReference? _pasta;
  DocumentReference? get pasta => _pasta;
  bool hasPasta() => _pasta != null;

  void _initializeFields() {
    _descricao = snapshotData['descricao'] as String?;
    _imagem = snapshotData['imagem'] as String?;
    _usuario = snapshotData['usuario'] as DocumentReference?;
    _tema = snapshotData['tema'] as String?;
    _privado = snapshotData['privado'] as bool?;
    _publico = snapshotData['publico'] as bool?;
    _nomeAutor = snapshotData['nome_autor'] as String?;
    _data = snapshotData['data'] as DateTime?;
    _participantes = getDataList(snapshotData['participantes']);
    _jogadas = castToType<int>(snapshotData['jogadas']);
    _favoritados = castToType<int>(snapshotData['favoritados']);
    _identificacoes = getDataList(snapshotData['identificacoes']);
    _usuarios = getDataList(snapshotData['usuarios']);
    _identificadoresJogarSozinho =
        getDataList(snapshotData['identificadores_jogar_sozinho']);
    _categorias = snapshotData['categorias'] as DocumentReference?;
    _identificadorPasta = snapshotData['identificador_pasta'] as String?;
    _pasta = snapshotData['pasta'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('quiz');

  static Stream<QuizRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QuizRecord.fromSnapshot(s));

  static Future<QuizRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QuizRecord.fromSnapshot(s));

  static QuizRecord fromSnapshot(DocumentSnapshot snapshot) => QuizRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QuizRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QuizRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QuizRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QuizRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQuizRecordData({
  String? descricao,
  String? imagem,
  DocumentReference? usuario,
  String? tema,
  bool? privado,
  bool? publico,
  String? nomeAutor,
  DateTime? data,
  int? jogadas,
  int? favoritados,
  DocumentReference? categorias,
  String? identificadorPasta,
  DocumentReference? pasta,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'descricao': descricao,
      'imagem': imagem,
      'usuario': usuario,
      'tema': tema,
      'privado': privado,
      'publico': publico,
      'nome_autor': nomeAutor,
      'data': data,
      'jogadas': jogadas,
      'favoritados': favoritados,
      'categorias': categorias,
      'identificador_pasta': identificadorPasta,
      'pasta': pasta,
    }.withoutNulls,
  );

  return firestoreData;
}

class QuizRecordDocumentEquality implements Equality<QuizRecord> {
  const QuizRecordDocumentEquality();

  @override
  bool equals(QuizRecord? e1, QuizRecord? e2) {
    const listEquality = ListEquality();
    return e1?.descricao == e2?.descricao &&
        e1?.imagem == e2?.imagem &&
        e1?.usuario == e2?.usuario &&
        e1?.tema == e2?.tema &&
        e1?.privado == e2?.privado &&
        e1?.publico == e2?.publico &&
        e1?.nomeAutor == e2?.nomeAutor &&
        e1?.data == e2?.data &&
        listEquality.equals(e1?.participantes, e2?.participantes) &&
        e1?.jogadas == e2?.jogadas &&
        e1?.favoritados == e2?.favoritados &&
        listEquality.equals(e1?.identificacoes, e2?.identificacoes) &&
        listEquality.equals(e1?.usuarios, e2?.usuarios) &&
        listEquality.equals(
            e1?.identificadoresJogarSozinho, e2?.identificadoresJogarSozinho) &&
        e1?.categorias == e2?.categorias &&
        e1?.identificadorPasta == e2?.identificadorPasta &&
        e1?.pasta == e2?.pasta;
  }

  @override
  int hash(QuizRecord? e) => const ListEquality().hash([
        e?.descricao,
        e?.imagem,
        e?.usuario,
        e?.tema,
        e?.privado,
        e?.publico,
        e?.nomeAutor,
        e?.data,
        e?.participantes,
        e?.jogadas,
        e?.favoritados,
        e?.identificacoes,
        e?.usuarios,
        e?.identificadoresJogarSozinho,
        e?.categorias,
        e?.identificadorPasta,
        e?.pasta
      ]);

  @override
  bool isValidKey(Object? o) => o is QuizRecord;
}
