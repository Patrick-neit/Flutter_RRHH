import 'package:flutter/material.dart';
import 'package:rrhh/Drawer/widget_drawer.dart';
import 'package:rrhh/models/solicitudvacaciones.dart';
import 'package:rrhh/services/listadovacaciones_services.dart';

class VistaSolicitudes extends StatefulWidget {
  VistaSolicitudes({Key? key}) : super(key: key);

  @override
  _VistaSolicitudesState createState() => _VistaSolicitudesState();
}

class _VistaSolicitudesState extends State<VistaSolicitudes> {
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text('Listado de Solicitudes Realizadas'),
      ),
      drawer: MenuLateral(),
       body: FutureBuilder<List<Vacacione>>(
        future: ListadoVacacionService().postsolicitud(),
        builder: (BuildContext context, AsyncSnapshot<List<Vacacione>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                Vacacione item = snapshot.data![index];
                 return Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.chevron_right),
                      title:  Text('Identificador de la  Solicitud:  '+ item.id.toString()),
                      //subtitle: Text(item.sucursal),
                    ),
                    ListTile(
                      leading: Icon(Icons.date_range_sharp),
                      title:  Text('Fecha de la solicitud:  '+ item.fechaIni.toString()),
                      //subtitle: Text(item.sucursal),
                    ),
                    ListTile(
                      leading: Icon(Icons.date_range_rounded),
                      title:  Text('Fecha Final de la vacacion:  '+ item.fechaFin.toString()),
                    ),
                    ListTile(
                      leading: Icon(Icons.remove_red_eye_outlined),
                      title:  Text('Motivo:  '+  item.observacion),
                    ),
                    ListTile(
                      leading: Icon(Icons.view_day_sharp),
                      title:  Text('Dias de vacacion:  '+ item.dias.toString()),
                    ),
                    ListTile(
                      leading: Icon(Icons.toggle_on),
                      title:  Text('Estado de la Solicitud:  '+ item.estado),
                      
                    ),
                     ListTile(
                      
                      title:  Text('---------------------------------------------------------------'),
                      
                    ),
                    
                  ],
                );
                  
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    ),
    );
  }

  }

     
                