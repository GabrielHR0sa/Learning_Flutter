import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class CepService extends ChangeNotifier {
  getCEP(String cep) async {
    Response response;
    response = await http.get(Uri.parse('https://viacep.com.br/ws/$cep/json/'));
    print(response.body);
    return response;
  }
}
