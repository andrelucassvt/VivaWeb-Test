import 'package:http/http.dart' as http;

const baseUrl = 'http://www.apifluttermock.vwi.com.br';

class API{

  static Future getCarteiras()async{
    var url = baseUrl + "/carteira";
    return await http.get(url);
  }
  static Future getCarteirasId(String id)async{
    var url = baseUrl + "/carteira/" + id;
    return await http.get(url);
  }

}