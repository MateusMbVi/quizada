import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserRecord extends FirestoreRecord {
  UserRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "apelido" field.
  String? _apelido;
  String get apelido => _apelido ?? '';
  bool hasApelido() => _apelido != null;

  // "amigos" field.
  List<DocumentReference>? _amigos;
  List<DocumentReference> get amigos => _amigos ?? const [];
  bool hasAmigos() => _amigos != null;

  // "quiz" field.
  DocumentReference? _quiz;
  DocumentReference? get quiz => _quiz;
  bool hasQuiz() => _quiz != null;

  // "ranking" field.
  DocumentReference? _ranking;
  DocumentReference? get ranking => _ranking;
  bool hasRanking() => _ranking != null;

  // "pendentes" field.
  List<DocumentReference>? _pendentes;
  List<DocumentReference> get pendentes => _pendentes ?? const [];
  bool hasPendentes() => _pendentes != null;

  // "convites_pendentes" field.
  List<DocumentReference>? _convitesPendentes;
  List<DocumentReference> get convitesPendentes =>
      _convitesPendentes ?? const [];
  bool hasConvitesPendentes() => _convitesPendentes != null;

  // "senha_atual" field.
  String? _senhaAtual;
  String get senhaAtual => _senhaAtual ?? '';
  bool hasSenhaAtual() => _senhaAtual != null;

  // "solicitacoes_enviado" field.
  List<DocumentReference>? _solicitacoesEnviado;
  List<DocumentReference> get solicitacoesEnviado =>
      _solicitacoesEnviado ?? const [];
  bool hasSolicitacoesEnviado() => _solicitacoesEnviado != null;

  // "capa" field.
  String? _capa;
  String get capa => _capa ?? '';
  bool hasCapa() => _capa != null;

  // "quantidade_amigos" field.
  int? _quantidadeAmigos;
  int get quantidadeAmigos => _quantidadeAmigos ?? 0;
  bool hasQuantidadeAmigos() => _quantidadeAmigos != null;

  // "plays" field.
  int? _plays;
  int get plays => _plays ?? 0;
  bool hasPlays() => _plays != null;

  // "pontuacao_ranking" field.
  int? _pontuacaoRanking;
  int get pontuacaoRanking => _pontuacaoRanking ?? 0;
  bool hasPontuacaoRanking() => _pontuacaoRanking != null;

  // "meus_administradores" field.
  List<DocumentReference>? _meusAdministradores;
  List<DocumentReference> get meusAdministradores =>
      _meusAdministradores ?? const [];
  bool hasMeusAdministradores() => _meusAdministradores != null;

  // "administradores_convidados" field.
  List<DocumentReference>? _administradoresConvidados;
  List<DocumentReference> get administradoresConvidados =>
      _administradoresConvidados ?? const [];
  bool hasAdministradoresConvidados() => _administradoresConvidados != null;

  // "adm" field.
  bool? _adm;
  bool get adm => _adm ?? false;
  bool hasAdm() => _adm != null;

  // "receber_notificacoes" field.
  bool? _receberNotificacoes;
  bool get receberNotificacoes => _receberNotificacoes ?? false;
  bool hasReceberNotificacoes() => _receberNotificacoes != null;

  // "quizes_favoritos" field.
  List<DocumentReference>? _quizesFavoritos;
  List<DocumentReference> get quizesFavoritos => _quizesFavoritos ?? const [];
  bool hasQuizesFavoritos() => _quizesFavoritos != null;

  // "exportar_quizes" field.
  List<DocumentReference>? _exportarQuizes;
  List<DocumentReference> get exportarQuizes => _exportarQuizes ?? const [];
  bool hasExportarQuizes() => _exportarQuizes != null;

  // "quizes_individuais" field.
  List<DocumentReference>? _quizesIndividuais;
  List<DocumentReference> get quizesIndividuais =>
      _quizesIndividuais ?? const [];
  bool hasQuizesIndividuais() => _quizesIndividuais != null;

  // "quizes_concluidos_convites" field.
  List<DocumentReference>? _quizesConcluidosConvites;
  List<DocumentReference> get quizesConcluidosConvites =>
      _quizesConcluidosConvites ?? const [];
  bool hasQuizesConcluidosConvites() => _quizesConcluidosConvites != null;

  // "quizes_concluidos" field.
  List<DocumentReference>? _quizesConcluidos;
  List<DocumentReference> get quizesConcluidos => _quizesConcluidos ?? const [];
  bool hasQuizesConcluidos() => _quizesConcluidos != null;

  // "amigos_ver_quizes" field.
  List<DocumentReference>? _amigosVerQuizes;
  List<DocumentReference> get amigosVerQuizes => _amigosVerQuizes ?? const [];
  bool hasAmigosVerQuizes() => _amigosVerQuizes != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _apelido = snapshotData['apelido'] as String?;
    _amigos = getDataList(snapshotData['amigos']);
    _quiz = snapshotData['quiz'] as DocumentReference?;
    _ranking = snapshotData['ranking'] as DocumentReference?;
    _pendentes = getDataList(snapshotData['pendentes']);
    _convitesPendentes = getDataList(snapshotData['convites_pendentes']);
    _senhaAtual = snapshotData['senha_atual'] as String?;
    _solicitacoesEnviado = getDataList(snapshotData['solicitacoes_enviado']);
    _capa = snapshotData['capa'] as String?;
    _quantidadeAmigos = castToType<int>(snapshotData['quantidade_amigos']);
    _plays = castToType<int>(snapshotData['plays']);
    _pontuacaoRanking = castToType<int>(snapshotData['pontuacao_ranking']);
    _meusAdministradores = getDataList(snapshotData['meus_administradores']);
    _administradoresConvidados =
        getDataList(snapshotData['administradores_convidados']);
    _adm = snapshotData['adm'] as bool?;
    _receberNotificacoes = snapshotData['receber_notificacoes'] as bool?;
    _quizesFavoritos = getDataList(snapshotData['quizes_favoritos']);
    _exportarQuizes = getDataList(snapshotData['exportar_quizes']);
    _quizesIndividuais = getDataList(snapshotData['quizes_individuais']);
    _quizesConcluidosConvites =
        getDataList(snapshotData['quizes_concluidos_convites']);
    _quizesConcluidos = getDataList(snapshotData['quizes_concluidos']);
    _amigosVerQuizes = getDataList(snapshotData['amigos_ver_quizes']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('user');

  static Stream<UserRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserRecord.fromSnapshot(s));

  static Future<UserRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserRecord.fromSnapshot(s));

  static UserRecord fromSnapshot(DocumentSnapshot snapshot) => UserRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? apelido,
  DocumentReference? quiz,
  DocumentReference? ranking,
  String? senhaAtual,
  String? capa,
  int? quantidadeAmigos,
  int? plays,
  int? pontuacaoRanking,
  bool? adm,
  bool? receberNotificacoes,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'apelido': apelido,
      'quiz': quiz,
      'ranking': ranking,
      'senha_atual': senhaAtual,
      'capa': capa,
      'quantidade_amigos': quantidadeAmigos,
      'plays': plays,
      'pontuacao_ranking': pontuacaoRanking,
      'adm': adm,
      'receber_notificacoes': receberNotificacoes,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserRecordDocumentEquality implements Equality<UserRecord> {
  const UserRecordDocumentEquality();

  @override
  bool equals(UserRecord? e1, UserRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.apelido == e2?.apelido &&
        listEquality.equals(e1?.amigos, e2?.amigos) &&
        e1?.quiz == e2?.quiz &&
        e1?.ranking == e2?.ranking &&
        listEquality.equals(e1?.pendentes, e2?.pendentes) &&
        listEquality.equals(e1?.convitesPendentes, e2?.convitesPendentes) &&
        e1?.senhaAtual == e2?.senhaAtual &&
        listEquality.equals(e1?.solicitacoesEnviado, e2?.solicitacoesEnviado) &&
        e1?.capa == e2?.capa &&
        e1?.quantidadeAmigos == e2?.quantidadeAmigos &&
        e1?.plays == e2?.plays &&
        e1?.pontuacaoRanking == e2?.pontuacaoRanking &&
        listEquality.equals(e1?.meusAdministradores, e2?.meusAdministradores) &&
        listEquality.equals(
            e1?.administradoresConvidados, e2?.administradoresConvidados) &&
        e1?.adm == e2?.adm &&
        e1?.receberNotificacoes == e2?.receberNotificacoes &&
        listEquality.equals(e1?.quizesFavoritos, e2?.quizesFavoritos) &&
        listEquality.equals(e1?.exportarQuizes, e2?.exportarQuizes) &&
        listEquality.equals(e1?.quizesIndividuais, e2?.quizesIndividuais) &&
        listEquality.equals(
            e1?.quizesConcluidosConvites, e2?.quizesConcluidosConvites) &&
        listEquality.equals(e1?.quizesConcluidos, e2?.quizesConcluidos) &&
        listEquality.equals(e1?.amigosVerQuizes, e2?.amigosVerQuizes);
  }

  @override
  int hash(UserRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.apelido,
        e?.amigos,
        e?.quiz,
        e?.ranking,
        e?.pendentes,
        e?.convitesPendentes,
        e?.senhaAtual,
        e?.solicitacoesEnviado,
        e?.capa,
        e?.quantidadeAmigos,
        e?.plays,
        e?.pontuacaoRanking,
        e?.meusAdministradores,
        e?.administradoresConvidados,
        e?.adm,
        e?.receberNotificacoes,
        e?.quizesFavoritos,
        e?.exportarQuizes,
        e?.quizesIndividuais,
        e?.quizesConcluidosConvites,
        e?.quizesConcluidos,
        e?.amigosVerQuizes
      ]);

  @override
  bool isValidKey(Object? o) => o is UserRecord;
}
