import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificacoesRecord extends FirestoreRecord {
  NotificacoesRecord._(
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

  // "imagem" field.
  String? _imagem;
  String get imagem => _imagem ?? '';
  bool hasImagem() => _imagem != null;

  // "data" field.
  DateTime? _data;
  DateTime? get data => _data;
  bool hasData() => _data != null;

  // "usuario" field.
  DocumentReference? _usuario;
  DocumentReference? get usuario => _usuario;
  bool hasUsuario() => _usuario != null;

  // "usuario_enviou_notificacao" field.
  DocumentReference? _usuarioEnviouNotificacao;
  DocumentReference? get usuarioEnviouNotificacao => _usuarioEnviouNotificacao;
  bool hasUsuarioEnviouNotificacao() => _usuarioEnviouNotificacao != null;

  // "visualizado" field.
  bool? _visualizado;
  bool get visualizado => _visualizado ?? false;
  bool hasVisualizado() => _visualizado != null;

  // "botao_aceitar" field.
  bool? _botaoAceitar;
  bool get botaoAceitar => _botaoAceitar ?? false;
  bool hasBotaoAceitar() => _botaoAceitar != null;

  // "botao_recusar" field.
  bool? _botaoRecusar;
  bool get botaoRecusar => _botaoRecusar ?? false;
  bool hasBotaoRecusar() => _botaoRecusar != null;

  // "botao_aceitar_adm" field.
  bool? _botaoAceitarAdm;
  bool get botaoAceitarAdm => _botaoAceitarAdm ?? false;
  bool hasBotaoAceitarAdm() => _botaoAceitarAdm != null;

  // "botao_recusar_adm" field.
  bool? _botaoRecusarAdm;
  bool get botaoRecusarAdm => _botaoRecusarAdm ?? false;
  bool hasBotaoRecusarAdm() => _botaoRecusarAdm != null;

  // "quiz_liberar_acessar" field.
  DocumentReference? _quizLiberarAcessar;
  DocumentReference? get quizLiberarAcessar => _quizLiberarAcessar;
  bool hasQuizLiberarAcessar() => _quizLiberarAcessar != null;

  void _initializeFields() {
    _titulo = snapshotData['titulo'] as String?;
    _descricao = snapshotData['descricao'] as String?;
    _imagem = snapshotData['imagem'] as String?;
    _data = snapshotData['data'] as DateTime?;
    _usuario = snapshotData['usuario'] as DocumentReference?;
    _usuarioEnviouNotificacao =
        snapshotData['usuario_enviou_notificacao'] as DocumentReference?;
    _visualizado = snapshotData['visualizado'] as bool?;
    _botaoAceitar = snapshotData['botao_aceitar'] as bool?;
    _botaoRecusar = snapshotData['botao_recusar'] as bool?;
    _botaoAceitarAdm = snapshotData['botao_aceitar_adm'] as bool?;
    _botaoRecusarAdm = snapshotData['botao_recusar_adm'] as bool?;
    _quizLiberarAcessar =
        snapshotData['quiz_liberar_acessar'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('notificacoes');

  static Stream<NotificacoesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotificacoesRecord.fromSnapshot(s));

  static Future<NotificacoesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotificacoesRecord.fromSnapshot(s));

  static NotificacoesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NotificacoesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotificacoesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotificacoesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotificacoesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotificacoesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotificacoesRecordData({
  String? titulo,
  String? descricao,
  String? imagem,
  DateTime? data,
  DocumentReference? usuario,
  DocumentReference? usuarioEnviouNotificacao,
  bool? visualizado,
  bool? botaoAceitar,
  bool? botaoRecusar,
  bool? botaoAceitarAdm,
  bool? botaoRecusarAdm,
  DocumentReference? quizLiberarAcessar,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'titulo': titulo,
      'descricao': descricao,
      'imagem': imagem,
      'data': data,
      'usuario': usuario,
      'usuario_enviou_notificacao': usuarioEnviouNotificacao,
      'visualizado': visualizado,
      'botao_aceitar': botaoAceitar,
      'botao_recusar': botaoRecusar,
      'botao_aceitar_adm': botaoAceitarAdm,
      'botao_recusar_adm': botaoRecusarAdm,
      'quiz_liberar_acessar': quizLiberarAcessar,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotificacoesRecordDocumentEquality
    implements Equality<NotificacoesRecord> {
  const NotificacoesRecordDocumentEquality();

  @override
  bool equals(NotificacoesRecord? e1, NotificacoesRecord? e2) {
    return e1?.titulo == e2?.titulo &&
        e1?.descricao == e2?.descricao &&
        e1?.imagem == e2?.imagem &&
        e1?.data == e2?.data &&
        e1?.usuario == e2?.usuario &&
        e1?.usuarioEnviouNotificacao == e2?.usuarioEnviouNotificacao &&
        e1?.visualizado == e2?.visualizado &&
        e1?.botaoAceitar == e2?.botaoAceitar &&
        e1?.botaoRecusar == e2?.botaoRecusar &&
        e1?.botaoAceitarAdm == e2?.botaoAceitarAdm &&
        e1?.botaoRecusarAdm == e2?.botaoRecusarAdm &&
        e1?.quizLiberarAcessar == e2?.quizLiberarAcessar;
  }

  @override
  int hash(NotificacoesRecord? e) => const ListEquality().hash([
        e?.titulo,
        e?.descricao,
        e?.imagem,
        e?.data,
        e?.usuario,
        e?.usuarioEnviouNotificacao,
        e?.visualizado,
        e?.botaoAceitar,
        e?.botaoRecusar,
        e?.botaoAceitarAdm,
        e?.botaoRecusarAdm,
        e?.quizLiberarAcessar
      ]);

  @override
  bool isValidKey(Object? o) => o is NotificacoesRecord;
}
