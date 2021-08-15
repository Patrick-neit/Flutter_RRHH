import 'package:flutter/material.dart';
import 'package:rrhh/models/boletas.dart';
import 'package:rrhh/services/boletas_service.dart';

import 'Drawer/widget_drawer.dart';
class BoletaVista extends StatefulWidget {
   BoletaVista({Key? key}) : super(key: key);
  

  @override
  _BoletaVistaState createState() => _BoletaVistaState();
}

class _BoletaVistaState extends State<BoletaVista> {
  @override

  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text('Mis Boletas'),
        actions: <Widget>[
        ],
      ),
      
      drawer: MenuLateral(), //Importo menu lateral desde la carpeta drawer
      
      body: FutureBuilder<List<Boleta>>(
        future: BoletasService().getBoletas(),
        builder: (BuildContext context, AsyncSnapshot<List<Boleta>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                Boleta item = snapshot.data![index];
                return Column(
                  children:[
                    ListTile(
                      title:Text('Identificador:   '+item.id.toString(),)
                      ),
                    ListTile(
                      title:Text('Nombre Completo:   '+item.primerApellido),
                      subtitle: Text(''+item.segundoApellido),
                    ),
                    ListTile(
                      title:Text('Cargo:   '+item.cargo)
                    ),
                    ListTile( 
                      title:Text('Carnet de identidad:   '+item.ci)
                    ),
                    ListTile(
                      title:Text('Salario Neto:   '+item.liquidoPagable)
                    ),
                    ListTile(
                      title:Text('Estado Boleta:   '+item.pagado.toString()),
                      subtitle:Text('Fecha de pago:   '+item.fechaPago.toString())
                    ),
                    ListTile(
                      title:Text('Gestion:   '+item.periodo)
                    ),
                  ]
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

     
