import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _perguntaAtual2 = prefs.getInt('ff_perguntaAtual2') ?? _perguntaAtual2;
    });
    _safeInit(() {
      _currenteIndex = prefs.getInt('ff_currenteIndex') ?? _currenteIndex;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  int _perguntaAtual = 0;
  int get perguntaAtual => _perguntaAtual;
  set perguntaAtual(int _value) {
    _perguntaAtual = _value;
  }

  String _alternativaSelecionada = '';
  String get alternativaSelecionada => _alternativaSelecionada;
  set alternativaSelecionada(String _value) {
    _alternativaSelecionada = _value;
  }

  int _pontosUsuario = 0;
  int get pontosUsuario => _pontosUsuario;
  set pontosUsuario(int _value) {
    _pontosUsuario = _value;
  }

  String _solicitacoesAmizades = 'amigos';
  String get solicitacoesAmizades => _solicitacoesAmizades;
  set solicitacoesAmizades(String _value) {
    _solicitacoesAmizades = _value;
  }

  String _convitesAceitos = '';
  String get convitesAceitos => _convitesAceitos;
  set convitesAceitos(String _value) {
    _convitesAceitos = _value;
  }

  DocumentReference? _convidarAmigoQuiz;
  DocumentReference? get convidarAmigoQuiz => _convidarAmigoQuiz;
  set convidarAmigoQuiz(DocumentReference? _value) {
    _convidarAmigoQuiz = _value;
  }

  DocumentReference? _usuario;
  DocumentReference? get usuario => _usuario;
  set usuario(DocumentReference? _value) {
    _usuario = _value;
  }

  List<DocumentReference> _convidarAmigos = [];
  List<DocumentReference> get convidarAmigos => _convidarAmigos;
  set convidarAmigos(List<DocumentReference> _value) {
    _convidarAmigos = _value;
  }

  void addToConvidarAmigos(DocumentReference _value) {
    _convidarAmigos.add(_value);
  }

  void removeFromConvidarAmigos(DocumentReference _value) {
    _convidarAmigos.remove(_value);
  }

  void removeAtIndexFromConvidarAmigos(int _index) {
    _convidarAmigos.removeAt(_index);
  }

  void updateConvidarAmigosAtIndex(
    int _index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _convidarAmigos[_index] = updateFn(_convidarAmigos[_index]);
  }

  void insertAtIndexInConvidarAmigos(int _index, DocumentReference _value) {
    _convidarAmigos.insert(_index, _value);
  }

  String _respostaEscrita = '';
  String get respostaEscrita => _respostaEscrita;
  set respostaEscrita(String _value) {
    _respostaEscrita = _value;
  }

  String _metodoPagamento = '';
  String get metodoPagamento => _metodoPagamento;
  set metodoPagamento(String _value) {
    _metodoPagamento = _value;
  }

  String _cpfOuCnpj = '';
  String get cpfOuCnpj => _cpfOuCnpj;
  set cpfOuCnpj(String _value) {
    _cpfOuCnpj = _value;
  }

  double _valorDoacao = 0.0;
  double get valorDoacao => _valorDoacao;
  set valorDoacao(double _value) {
    _valorDoacao = _value;
  }

  String _linkpage = '';
  String get linkpage => _linkpage;
  set linkpage(String _value) {
    _linkpage = _value;
  }

  List<int> _perguntasFeitas = [];
  List<int> get perguntasFeitas => _perguntasFeitas;
  set perguntasFeitas(List<int> _value) {
    _perguntasFeitas = _value;
  }

  void addToPerguntasFeitas(int _value) {
    _perguntasFeitas.add(_value);
  }

  void removeFromPerguntasFeitas(int _value) {
    _perguntasFeitas.remove(_value);
  }

  void removeAtIndexFromPerguntasFeitas(int _index) {
    _perguntasFeitas.removeAt(_index);
  }

  void updatePerguntasFeitasAtIndex(
    int _index,
    int Function(int) updateFn,
  ) {
    _perguntasFeitas[_index] = updateFn(_perguntasFeitas[_index]);
  }

  void insertAtIndexInPerguntasFeitas(int _index, int _value) {
    _perguntasFeitas.insert(_index, _value);
  }

  int _perguntaAtual2 = 0;
  int get perguntaAtual2 => _perguntaAtual2;
  set perguntaAtual2(int _value) {
    _perguntaAtual2 = _value;
    prefs.setInt('ff_perguntaAtual2', _value);
  }

  int _currenteIndex = 0;
  int get currenteIndex => _currenteIndex;
  set currenteIndex(int _value) {
    _currenteIndex = _value;
    prefs.setInt('ff_currenteIndex', _value);
  }

  List<AlternativasStruct> _alternativas = [];
  List<AlternativasStruct> get alternativas => _alternativas;
  set alternativas(List<AlternativasStruct> _value) {
    _alternativas = _value;
  }

  void addToAlternativas(AlternativasStruct _value) {
    _alternativas.add(_value);
  }

  void removeFromAlternativas(AlternativasStruct _value) {
    _alternativas.remove(_value);
  }

  void removeAtIndexFromAlternativas(int _index) {
    _alternativas.removeAt(_index);
  }

  void updateAlternativasAtIndex(
    int _index,
    AlternativasStruct Function(AlternativasStruct) updateFn,
  ) {
    _alternativas[_index] = updateFn(_alternativas[_index]);
  }

  void insertAtIndexInAlternativas(int _index, AlternativasStruct _value) {
    _alternativas.insert(_index, _value);
  }

  List<String> _alternativasEscolhidas = [];
  List<String> get alternativasEscolhidas => _alternativasEscolhidas;
  set alternativasEscolhidas(List<String> _value) {
    _alternativasEscolhidas = _value;
  }

  void addToAlternativasEscolhidas(String _value) {
    _alternativasEscolhidas.add(_value);
  }

  void removeFromAlternativasEscolhidas(String _value) {
    _alternativasEscolhidas.remove(_value);
  }

  void removeAtIndexFromAlternativasEscolhidas(int _index) {
    _alternativasEscolhidas.removeAt(_index);
  }

  void updateAlternativasEscolhidasAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _alternativasEscolhidas[_index] = updateFn(_alternativasEscolhidas[_index]);
  }

  void insertAtIndexInAlternativasEscolhidas(int _index, String _value) {
    _alternativasEscolhidas.insert(_index, _value);
  }

  List<DocumentReference> _listaDePerguntas = [];
  List<DocumentReference> get listaDePerguntas => _listaDePerguntas;
  set listaDePerguntas(List<DocumentReference> _value) {
    _listaDePerguntas = _value;
  }

  void addToListaDePerguntas(DocumentReference _value) {
    _listaDePerguntas.add(_value);
  }

  void removeFromListaDePerguntas(DocumentReference _value) {
    _listaDePerguntas.remove(_value);
  }

  void removeAtIndexFromListaDePerguntas(int _index) {
    _listaDePerguntas.removeAt(_index);
  }

  void updateListaDePerguntasAtIndex(
    int _index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _listaDePerguntas[_index] = updateFn(_listaDePerguntas[_index]);
  }

  void insertAtIndexInListaDePerguntas(int _index, DocumentReference _value) {
    _listaDePerguntas.insert(_index, _value);
  }

  int _quantidadePerguntas = 0;
  int get quantidadePerguntas => _quantidadePerguntas;
  set quantidadePerguntas(int _value) {
    _quantidadePerguntas = _value;
  }

  List<String> _alternativasAleatorias = [];
  List<String> get alternativasAleatorias => _alternativasAleatorias;
  set alternativasAleatorias(List<String> _value) {
    _alternativasAleatorias = _value;
  }

  void addToAlternativasAleatorias(String _value) {
    _alternativasAleatorias.add(_value);
  }

  void removeFromAlternativasAleatorias(String _value) {
    _alternativasAleatorias.remove(_value);
  }

  void removeAtIndexFromAlternativasAleatorias(int _index) {
    _alternativasAleatorias.removeAt(_index);
  }

  void updateAlternativasAleatoriasAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _alternativasAleatorias[_index] = updateFn(_alternativasAleatorias[_index]);
  }

  void insertAtIndexInAlternativasAleatorias(int _index, String _value) {
    _alternativasAleatorias.insert(_index, _value);
  }

  List<int> _pontosUsuariosLista = [];
  List<int> get pontosUsuariosLista => _pontosUsuariosLista;
  set pontosUsuariosLista(List<int> _value) {
    _pontosUsuariosLista = _value;
  }

  void addToPontosUsuariosLista(int _value) {
    _pontosUsuariosLista.add(_value);
  }

  void removeFromPontosUsuariosLista(int _value) {
    _pontosUsuariosLista.remove(_value);
  }

  void removeAtIndexFromPontosUsuariosLista(int _index) {
    _pontosUsuariosLista.removeAt(_index);
  }

  void updatePontosUsuariosListaAtIndex(
    int _index,
    int Function(int) updateFn,
  ) {
    _pontosUsuariosLista[_index] = updateFn(_pontosUsuariosLista[_index]);
  }

  void insertAtIndexInPontosUsuariosLista(int _index, int _value) {
    _pontosUsuariosLista.insert(_index, _value);
  }

  int _selectIndex = 0;
  int get selectIndex => _selectIndex;
  set selectIndex(int _value) {
    _selectIndex = _value;
  }

  String _menu = '';
  String get menu => _menu;
  set menu(String _value) {
    _menu = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
