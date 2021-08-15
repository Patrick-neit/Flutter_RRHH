import 'package:http/http.dart' as http;
import 'package:rrhh/models/boletas.dart';
import 'package:rrhh/variables.dart';

class BoletasService {
  Future<List<BoletaElement>>? getBoletas() async {
    final url = 'https://getdataproject.com/rrhh/public/api/boletas?empleado_id='+idEmpleadoAutentificado.toString();
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200 || response.statusCode == 201) {
      final boletasresponse= boletaFromMap(response.body);
      return boletasresponse.boletas;
    }
    return [];
  }
}