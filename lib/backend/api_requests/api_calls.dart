import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class PayPixCall {
  static Future<ApiCallResponse> call({
    double? amount,
    String? productTitle = '',
    String? email = '',
    String? firstName = '',
    String? lastName = '',
    String? identificationType = '',
    String? numberCpf = '',
  }) async {
    final ffApiRequestBody = '''
{
  "transaction_amount": ${amount},
  "description": "${productTitle}",
  "payment_method_id": "pix",
  "payer": {
    "email": "${email}",
    "first_name": "${firstName}",
    "last_name": "${lastName}",
    "identification": {
      "type": "CPF",
      "number": "${numberCpf}"
    }
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Pay Pix',
      apiUrl: 'https://api.mercadopago.com/v1/payments',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer APP_USR-5570841106048696-081720-cdd35822f2d7ed41f532c855e0f80fc0-152474592',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static int? idPedido(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.id''',
      ));
  static String? chavePix(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.point_of_interaction.transaction_data.qr_code''',
      ));
}

class CriarTokenCall {
  static Future<ApiCallResponse> call({
    String? cardNumber = '',
    String? cardholderName = '',
    String? cardExpirationMonth = '',
    String? cardExpirationYear = '',
    String? securityCode = '',
    String? identificationType = '',
    String? identificationNumber = '',
    String? accessToken = '',
    String? publicKey = '',
  }) async {
    final ffApiRequestBody = '''
{
  "card_number": "${cardNumber}",
  "cardholder": {
    "name": "${cardholderName}",
    "identification": {
      "type": "${identificationType}",
      "number": "${identificationNumber}"
    }
  },
  "security_code": "${securityCode}",
  "expiration_month": "${cardExpirationMonth}",
  "expiration_year": "${cardExpirationYear}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Criar Token',
      apiUrl:
          'https://api.mercadopago.com/v1/card_tokens?public_key=${publicKey}',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class CriarPagamentoMPCall {
  static Future<ApiCallResponse> call({
    double? transactionAmount,
    String? token = '',
    String? firstName = '',
    String? lastName = '',
    String? email = '',
    String? identificationType = '',
    String? identificationNumber = '',
    String? zipCode = '',
    String? streetName = '',
    String? streetNumber = '',
    String? neighborhood = '',
    String? city = '',
    String? federalUnit = '',
    String? description = '',
    String? accessToken = '',
    int? installments,
  }) async {
    final ffApiRequestBody = '''
{
  "transaction_amount": ${transactionAmount},
  "token": "${token}",
  "installments": ${installments},
  "payer": {
    "first_name": "${firstName}",
    "last_name": "${lastName}",
    "email": "${email}",
    "type": "customer",
    "identification": {
      "type": "${identificationType}",
      "number": "${identificationNumber}"
    },
    "address": {
      "zip_code": "${zipCode}",
      "street_name": "${streetName}",
      "street_number": "${streetNumber}",
      "neighborhood": "${neighborhood}",
      "city": "${city}",
      "federal_unit": "${federalUnit}"
    }
  },
  "description": "${description}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Criar Pagamento MP',
      apiUrl: 'https://api.mercadopago.com/v1/payments',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic erroMensagem(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
}

class ObterPagamentosMPCall {
  static Future<ApiCallResponse> call({
    String? id = '',
    String? accessToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Obter Pagamentos MP',
      apiUrl: 'https://api.mercadopago.com/v1/payments/${id}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
