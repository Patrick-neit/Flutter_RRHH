import 'package:http/http.dart' as http;
import 'package:rrhh/models/solicitudvacaciones.dart';

class ListadoVacacionService {
  Future<List<Vacacione>>? postsolicitud() async {
    final url = 'https://getdataproject.com/rrhh/public/api/vacaciones/solicitudes?empleado_id=124';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200 || response.statusCode == 201) {
      final solicitudresponse = solicitudVacacionFromMap(response.body);
      return  solicitudresponse.vacaciones;
    }
    return [];
  }
}