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
      
      body: FutureBuilder<List<BoletaElement>>(
        future: BoletasService().getBoletas(),
        builder: (BuildContext context, AsyncSnapshot<List<BoletaElement>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                BoletaElement item = snapshot.data![index];
                return Column(
                  children:[
                    ListTile(
                      leading: Icon(Icons.anchor_rounded),
                      title:Text('Identificador:   '+item.id.toString(),)
                      ),
                    ListTile(
                      leading: Icon(Icons.near_me_rounded),
                      title:Text('Nombre Completo:   '+item.primerApellido+'  ' +item.segundoApellido +'  '+item.nombres),
                      
                    ),
                    ListTile(
                      leading: Icon(Icons.format_list_numbered_rtl_rounded),
                      title:Text('Carnet Identidad:   '+item.ci+ '  ' +item.ciexp)
                    ),
                    ListTile( 
                      leading: Icon(Icons.charging_station_rounded),
                      title:Text('Cargo:   '+item.cargo)
                    ),
                    ListTile(
                      leading: Icon(Icons.money_rounded),
                      title:Text('Haber Basico:   '+item.haberBasico+ ' Bs')
                    ),
                    
                    ListTile(
                      leading: Icon(Icons.money_sharp),
                      title:Text('Bono:   '+item.bono+' Bs')
                    ),
                    ListTile(
                      leading: Icon(Icons.mood_bad),
                      title:Text('Descuento:   '+item.descuento+ ' Bs')
                    ),
                    ListTile(
                      leading: Icon(Icons.date_range_sharp),
                      title:Text('Anticipo:   '+item.anticipo+' Bs')
                    
                    ),
                    ListTile(
                      
                      title:Text('______________________________')
                    ),
                    ListTile(
                      leading: Icon(Icons.money_outlined),
                      title:Text('Salario Neto:   '+item.liquidoPagable+ ' Bs')
                    ),
                    
                    ListTile(
                      leading: Icon(Icons.photo_album_outlined),
                      title:Text('Estado Boleta:   '+item.pagado.toString()),
                      subtitle: Text('No pagado'),
                    ),
                    ListTile(
                      leading: Icon(Icons.date_range_sharp),
                      title:Text('Gestion:   '+item.periodo)
                    ),
                    
                    ListTile(
                      leading: Icon(Icons.data_saver_off),
                      title:Text('Fecha de pago:   '+item.fechaPago.toString()),
    
                    ),
                    ListTile(
                      
                      title:Text('-------------------------------------------------------------------')
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

     
