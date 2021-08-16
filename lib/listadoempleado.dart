import 'package:flutter/material.dart';
import 'package:rrhh/models/empleados.dart';
import 'package:rrhh/services/empleados_service%20.dart';

import 'Drawer/widget_drawer.dart';


class ListadoEmpleado extends StatefulWidget {
  

  @override
  _ListadoEmpleadoState createState() => _ListadoEmpleadoState();
}

class _ListadoEmpleadoState extends State<ListadoEmpleado> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis Datos'),
        actions: <Widget>[
        ],
      ),
      
      drawer: MenuLateral(), //Importo menu lateral desde la carpeta drawer
      body: FutureBuilder<EmpleadoDatos?>(
        future: EmpleadosDatosService().showdatosemp(),
        builder: (BuildContext context, AsyncSnapshot<EmpleadoDatos?> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                EmpleadoDatos item = snapshot.data!;
                return Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.anchor_rounded),
                      title:  Text('Cargo:  '+ item.cargo),
                      //subtitle: Text(item.sucursal),
                    ),
                    ListTile(
                      leading: Icon(Icons.money_off_rounded),
                      title:  Text('Sueldo Basico:  '+ item.sueldoBasico+'  Bs'),
                    ),
                    ListTile(
                      leading: Icon(Icons.workspaces),
                      title:  Text('Profesion:  '+  item.profesion),
                    ),
                    ListTile(
                      leading: Icon(Icons.contact_mail),
                      title:  Text('Correo:  '+  item.correoCorporativo),
                    ),
                    ListTile(
                      leading: Icon(Icons.person_add_alt_outlined),
                      title:  Text('Nombre:  '+ item.persona),
                    ),
                    ListTile(
                      leading: Icon(Icons.house_siding),
                      title:  Text('Lugar de trabajo:  '+ item.sucursal),
                    ),
                    ListTile(
                      leading: Icon(Icons.date_range_rounded),
                      title:  Text('Fecha de Contrato:  '+ item.fechaInicio.toString()),
                    ),
                    ListTile(
                      leading: Icon(Icons.date_range_rounded),
                      title:  Text('Fecha de retiro:  '+ item.fechaFinal.toString()),
                      
                    ),
                    
                    ListTile(
                      
                      title:  Text('     '+ '\n\n'+ '\n\n'+'\n\n'+'\n\n'+'\n\n'),
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
    );
  }

  }

     