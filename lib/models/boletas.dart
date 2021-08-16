// To parse this JSON data, do
//
//     final boleta = boletaFromMap(jsonString);

import 'dart:convert';

Boleta boletaFromMap(String str) => Boleta.fromMap(json.decode(str));

String boletaToMap(Boleta data) => json.encode(data.toMap());

class Boleta {
    Boleta({
        required this.success,
        required this.boletas,
    });

    final bool success;
    final List<BoletaElement> boletas;

    factory Boleta.fromMap(Map<String, dynamic> json) => Boleta(
        success: json["success"],
        boletas: List<BoletaElement>.from(json["boletas"].map((x) => BoletaElement.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "success": success,
        "boletas": List<dynamic>.from(boletas.map((x) => x.toMap())),
    };
}

class BoletaElement {
    BoletaElement({
        required this.id,
        required this.empleadoId,
        required this.nombres,
        required this.primerApellido,
        required this.segundoApellido,
        required this.ci,
        required this.ciexp,
        required this.haberBasico,
         this.bono,
         this.descuento,
         this.anticipo,
        required this.liquidoPagable,
        required this.cargo,
        required this.periodo,
        
         this.pagado,
         this.fechaPago,
    });

    final int id;
    final int empleadoId;
    final String nombres;
    final String primerApellido;
    final String segundoApellido;
    final String ci;
    final String ciexp;
    final String haberBasico;
    final String? bono;
    final String? descuento;
    final String? anticipo;
    final String liquidoPagable;
    final String cargo;
    final String periodo;
    final int? pagado;
    final String? fechaPago;

    factory BoletaElement.fromMap(Map<String, dynamic> json) => BoletaElement(
        id: json["id"],
        empleadoId: json["empleado_id"],
        nombres: json["nombres"],
        primerApellido: json["primer_apellido"],
        segundoApellido: json["segundo_apellido"],
        ci: json["ci"],
        ciexp: json["ciexp"],
        haberBasico: json["haber_basico"],
        bono: json["bono"],
        descuento: json["descuento"],
        anticipo: json["anticipo"],
        liquidoPagable: json["liquido_pagable"],
        cargo: json["cargo"],
        periodo: json["periodo"],
        
        pagado: json["pagado"],
        fechaPago: json["fecha_pago"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "empleado_id": empleadoId,
        "nombres": nombres,
        "primer_apellido": primerApellido,
        "segundo_apellido": segundoApellido,
        "ci": ci,
        "ciexp": ciexp,
        "haber_basico": haberBasico,
        "bono": bono,
        "descuento": descuento,
        "anticipo": anticipo,
        "liquido_pagable": liquidoPagable,
        "cargo": cargo,
        "periodo": periodo,
        
        "pagado": pagado,
        "fecha_pago": fechaPago,
    };
}
