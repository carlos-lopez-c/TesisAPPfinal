class CreateHcPsAdult {
  final String patientId;
  final String antecedenteFamiliares;
  final String areasIntervecion;
  final String cobertura;
  final String curso;
  final String desencadenantesMotivoConsulta;
  final String direccion;
  final String estructuraFamiliar;
  final DateTime fechaCreacion;
  final DateTime fechaEvalucion;
  final DateTime fechaNacimiento;
  final String impresionDiagnostica;
  final String institucion;
  final String motivoConsulta;
  final String nombreCompleto;
  final String observaciones;
  final String pruebasAplicadas;
  final String remision;
  final String responsable;
  final String telefono;

  CreateHcPsAdult({
    required this.patientId,
    required this.antecedenteFamiliares,
    required this.areasIntervecion,
    required this.cobertura,
    required this.curso,
    required this.desencadenantesMotivoConsulta,
    required this.direccion,
    required this.estructuraFamiliar,
    required this.fechaCreacion,
    required this.fechaEvalucion,
    required this.fechaNacimiento,
    required this.impresionDiagnostica,
    required this.institucion,
    required this.motivoConsulta,
    required this.nombreCompleto,
    required this.observaciones,
    required this.pruebasAplicadas,
    required this.remision,
    required this.responsable,
    required this.telefono,
  });

  CreateHcPsAdult copyWith({
    String? patientId,
    String? antecedenteFamiliares,
    String? areasIntervecion,
    String? cobertura,
    String? curso,
    String? desencadenantesMotivoConsulta,
    String? direccion,
    String? estructuraFamiliar,
    DateTime? fechaCreacion,
    DateTime? fechaEvalucion,
    DateTime? fechaNacimiento,
    String? impresionDiagnostica,
    String? institucion,
    String? motivoConsulta,
    String? nombreCompleto,
    String? observaciones,
    String? pruebasAplicadas,
    String? remision,
    String? responsable,
    String? telefono,
  }) {
    return CreateHcPsAdult(
      patientId: patientId ?? this.patientId,
      antecedenteFamiliares:
          antecedenteFamiliares ?? this.antecedenteFamiliares,
      areasIntervecion: areasIntervecion ?? this.areasIntervecion,
      cobertura: cobertura ?? this.cobertura,
      curso: curso ?? this.curso,
      desencadenantesMotivoConsulta:
          desencadenantesMotivoConsulta ?? this.desencadenantesMotivoConsulta,
      direccion: direccion ?? this.direccion,
      estructuraFamiliar: estructuraFamiliar ?? this.estructuraFamiliar,
      fechaCreacion: fechaCreacion ?? this.fechaCreacion,
      fechaEvalucion: fechaEvalucion ?? this.fechaEvalucion,
      fechaNacimiento: fechaNacimiento ?? this.fechaNacimiento,
      impresionDiagnostica: impresionDiagnostica ?? this.impresionDiagnostica,
      institucion: institucion ?? this.institucion,
      motivoConsulta: motivoConsulta ?? this.motivoConsulta,
      nombreCompleto: nombreCompleto ?? this.nombreCompleto,
      observaciones: observaciones ?? this.observaciones,
      pruebasAplicadas: pruebasAplicadas ?? this.pruebasAplicadas,
      remision: remision ?? this.remision,
      responsable: responsable ?? this.responsable,
      telefono: telefono ?? this.telefono,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "patientId": patientId,
      "antecedenteFamiliares": antecedenteFamiliares,
      "areasIntervecion": areasIntervecion,
      "cobertura": cobertura,
      "curso": curso,
      "desencadenantesMotivoConsulta": desencadenantesMotivoConsulta,
      "direccion": direccion,
      "estructuraFamiliar": estructuraFamiliar,
      "fechaCreacion": fechaCreacion.toIso8601String(),
      "fechaEvalucion": fechaEvalucion.toIso8601String(),
      "fechaNacimiento": fechaNacimiento.toIso8601String(),
      "impresionDiagnostica": impresionDiagnostica,
      "institucion": institucion,
      "motivoConsulta": motivoConsulta,
      "nombreCompleto": nombreCompleto,
      "observaciones": observaciones,
      "pruebasAplicadas": pruebasAplicadas,
      "remision": remision,
      "responsable": responsable,
      "telefono": telefono,
    };
  }

  factory CreateHcPsAdult.fromJson(Map<String, dynamic> json) {
    return CreateHcPsAdult(
      patientId: json["patientId"],
      antecedenteFamiliares: json["antecedenteFamiliares"],
      areasIntervecion: json["areasIntervecion"],
      cobertura: json["cobertura"],
      curso: json["curso"],
      desencadenantesMotivoConsulta: json["desencadenantesMotivoConsulta"],
      direccion: json["direccion"],
      estructuraFamiliar: json["estructuraFamiliar"],
      fechaCreacion: DateTime.parse(json["fechaCreacion"]),
      fechaEvalucion: DateTime.parse(json["fechaEvalucion"]),
      fechaNacimiento: DateTime.parse(json["fechaNacimiento"]),
      impresionDiagnostica: json["impresionDiagnostica"],
      institucion: json["institucion"],
      motivoConsulta: json["motivoConsulta"],
      nombreCompleto: json["nombreCompleto"],
      observaciones: json["observaciones"],
      pruebasAplicadas: json["pruebasAplicadas"],
      remision: json["remision"],
      responsable: json["responsable"],
      telefono: json["telefono"],
    );
  }
}
