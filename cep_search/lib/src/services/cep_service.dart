import 'package:cep_search/src/models/cep_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class CepService extends ChangeNotifier {
  var _model = CepModel();

  void setCep(String value) {
    _model = CepModel(
        cep: value,
        cidade: _model.cidade,
        bairro: _model.bairro,
        rua: _model.rua,
        estado: _model.estado,
        ddd: _model.ddd);
  }

  void setCidade(String value) {
    _model = CepModel(
        cidade: value,
        cep: _model.cep,
        bairro: _model.bairro,
        rua: _model.rua,
        estado: _model.estado,
        ddd: _model.ddd);
  }

  void setBairro(String value) {
    _model = CepModel(
        bairro: value,
        cidade: _model.cidade,
        cep: _model.cep,
        rua: _model.rua,
        estado: _model.estado,
        ddd: _model.ddd);
  }

  void setRua(String value) {
    _model = CepModel(
        rua: value,
        cidade: _model.cidade,
        bairro: _model.bairro,
        cep: _model.cep,
        estado: _model.estado,
        ddd: _model.ddd);
  }

  void setEstado(String value) {
    _model = CepModel(
        estado: value,
        cidade: _model.cidade,
        bairro: _model.bairro,
        rua: _model.rua,
        cep: _model.cep,
        ddd: _model.ddd);
  }

  void setDDD(String value) {
    _model = CepModel(
        ddd: value,
        cidade: _model.cidade,
        bairro: _model.bairro,
        rua: _model.rua,
        estado: _model.estado,
        cep: _model.cep);
  }

  getCEP(String cep) async {
    Response response;
    response = await http.get(Uri.parse('https://viacep.com.br/ws/$cep/json/'));
    print(response.body);
    return response;
  }

  catchForm() {
    var cepf = _model.cep;

    var cidadef = _model.cidade;
    var bairrof = _model.bairro;
    var ruaf = _model.rua;
    var estadof = _model.estado;
    var dddf = _model.ddd;

    print(cepf.toString());
    print(cidadef.toString());
    print(bairrof.toString());
    print(ruaf.toString());
    print(estadof.toString());
    print(dddf.toString());
  }
}
