import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../index.dart';
import '../../main.dart';

final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: Colors.transparent,
          child: Image.asset(
            'assets/images/1_Light_splash_screen.png',
            fit: BoxFit.cover,
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'Login': ParameterData.none(),
  'Homepage': ParameterData.none(),
  'Registrar': ParameterData.none(),
  'Amigos': ParameterData.none(),
  'editarperfil': ParameterData.none(),
  'quizesJogarSozinho': (data) async => ParameterData(
        allParams: {
          'nomeQuiz': getParameter<String>(data, 'nomeQuiz'),
        },
      ),
  'detalhesQuiz': (data) async => ParameterData(
        allParams: {
          'detalhesQuiz': getParameter<DocumentReference>(data, 'detalhesQuiz'),
        },
      ),
  'Desafio': ParameterData.none(),
  'perguntasQuiz': (data) async => ParameterData(
        allParams: {
          'perguntasQuiz':
              getParameter<DocumentReference>(data, 'perguntasQuiz'),
        },
      ),
  'scoreQuiz': (data) async => ParameterData(
        allParams: {
          'score': getParameter<DocumentReference>(data, 'score'),
          'identificacaoQuiz': getParameter<String>(data, 'identificacaoQuiz'),
        },
      ),
  'quizes': ParameterData.none(),
  'perfilUsuario': (data) async => ParameterData(
        allParams: {
          'perfilUsuario':
              getParameter<DocumentReference>(data, 'perfilUsuario'),
        },
      ),
  'categoriasQuiz': ParameterData.none(),
  'meuPerfil': ParameterData.none(),
  'configuracoesUsuario': ParameterData.none(),
  'todosusuarios': (data) async => ParameterData(
        allParams: {
          'resultado': getParameter<String>(data, 'resultado'),
        },
      ),
  'detalhescategorias': (data) async => ParameterData(
        allParams: {
          'categoria': getParameter<DocumentReference>(data, 'categoria'),
          'nome': getParameter<String>(data, 'nome'),
        },
      ),
  'meuspontos': ParameterData.none(),
  'notificacoes': ParameterData.none(),
  'rankingAmigosConvites': (data) async => ParameterData(
        allParams: {
          'convite': await getDocumentParameter<ConvitesRecord>(
              data, 'convite', ConvitesRecord.fromSnapshot),
        },
      ),
  'detalhesnotificacoes': (data) async => ParameterData(
        allParams: {
          'detalhesnotificacoes':
              getParameter<DocumentReference>(data, 'detalhesnotificacoes'),
        },
      ),
  'admUsuarios': ParameterData.none(),
  'configurarnotificacoes': ParameterData.none(),
  'colabore': ParameterData.none(),
  'detalhesdoacao': (data) async => ParameterData(
        allParams: {
          'detalhesdoacao':
              getParameter<DocumentReference>(data, 'detalhesdoacao'),
        },
      ),
  'doacaorealizada': ParameterData.none(),
  'minhasdoacoes': ParameterData.none(),
  'adicionarperguntas': (data) async => ParameterData(
        allParams: {
          'perguntasQuiz':
              getParameter<DocumentReference>(data, 'perguntasQuiz'),
        },
      ),
  'meusquizes': ParameterData.none(),
  'apresentacao': ParameterData.none(),
  'eesqueciasenha': ParameterData.none(),
  'editarmeuquiz': (data) async => ParameterData(
        allParams: {
          'detalhesQuiz': await getDocumentParameter<QuizRecord>(
              data, 'detalhesQuiz', QuizRecord.fromSnapshot),
        },
      ),
  'dashboardadm': ParameterData.none(),
  'pastasPublicas': ParameterData.none(),
  'pagarExportacao': ParameterData.none(),
  'planos': ParameterData.none(),
  'rankingConvites': ParameterData.none(),
  'rankingPublico': (data) async => ParameterData(
        allParams: {
          'quiz': getParameter<DocumentReference>(data, 'quiz'),
        },
      ),
  'perguntasQuizConvite': (data) async => ParameterData(
        allParams: {
          'perguntasQuiz':
              getParameter<DocumentReference>(data, 'perguntasQuiz'),
          'identificacao': getParameter<String>(data, 'identificacao'),
          'convite': getParameter<DocumentReference>(data, 'convite'),
        },
      ),
  'meusRankingsPublicos': ParameterData.none(),
  'detalhesQuizConvite': (data) async => ParameterData(
        allParams: {
          'detalhesQuiz': await getDocumentParameter<QuizRecord>(
              data, 'detalhesQuiz', QuizRecord.fromSnapshot),
          'convites': await getDocumentParameter<ConvitesRecord>(
              data, 'convites', ConvitesRecord.fromSnapshot),
          'identificacao': getParameter<String>(data, 'identificacao'),
        },
      ),
  'scoreQuizIndividual': (data) async => ParameterData(
        allParams: {
          'score': getParameter<DocumentReference>(data, 'score'),
        },
      ),
  'meuspontosQuizConvite': (data) async => ParameterData(
        allParams: {
          'quiz': getParameter<DocumentReference>(data, 'quiz'),
        },
      ),
  'perguntasQuizJogarSozinho': (data) async => ParameterData(
        allParams: {
          'perguntasQuiz':
              getParameter<DocumentReference>(data, 'perguntasQuiz'),
          'identificacao': getParameter<String>(data, 'identificacao'),
        },
      ),
  'detalhesQuizSozinho': (data) async => ParameterData(
        allParams: {
          'detalhesQuiz': getParameter<DocumentReference>(data, 'detalhesQuiz'),
          'identificacao': getParameter<String>(data, 'identificacao'),
          'quantidadePerguntas': getParameter<int>(data, 'quantidadePerguntas'),
        },
      ),
  'detalhesQuizPublico': (data) async => ParameterData(
        allParams: {
          'detalhesQuiz': getParameter<DocumentReference>(data, 'detalhesQuiz'),
        },
      ),
  'quizesDaPasta': (data) async => ParameterData(
        allParams: {
          'quizesPasta': await getDocumentParameter<PastasRecord>(
              data, 'quizesPasta', PastasRecord.fromSnapshot),
        },
      ),
  'perguntasQuizPublico': (data) async => ParameterData(
        allParams: {
          'perguntasQuiz':
              getParameter<DocumentReference>(data, 'perguntasQuiz'),
        },
      ),
  'scorePublico': (data) async => ParameterData(
        allParams: {
          'score': getParameter<DocumentReference>(data, 'score'),
        },
      ),
  'todasasPastas': ParameterData.none(),
  'paginaCriarQuizAdm': ParameterData.none(),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
