class FactoresExternos {
  bool viveEnAmbienteDeFumadores;
  bool trabajaEnAmbienteRuidoso;
  bool permaneceEnAmbientesConAireAcondicionado;
  bool permaneceEnAmbientesConPocaVentilacion;
  bool seExponeACambiosBruscosDeTemperatura;

  FactoresExternos({
    required this.viveEnAmbienteDeFumadores,
    required this.trabajaEnAmbienteRuidoso,
    required this.permaneceEnAmbientesConAireAcondicionado,
    required this.permaneceEnAmbientesConPocaVentilacion,
    required this.seExponeACambiosBruscosDeTemperatura,
  });

  FactoresExternos copyWith({
    bool? viveEnAmbienteDeFumadores,
    bool? trabajaEnAmbienteRuidoso,
    bool? permaneceEnAmbientesConAireAcondicionado,
    bool? permaneceEnAmbientesConPocaVentilacion,
    bool? seExponeACambiosBruscosDeTemperatura,
  }) {
    return FactoresExternos(
      viveEnAmbienteDeFumadores:
          viveEnAmbienteDeFumadores ?? this.viveEnAmbienteDeFumadores,
      trabajaEnAmbienteRuidoso:
          trabajaEnAmbienteRuidoso ?? this.trabajaEnAmbienteRuidoso,
      permaneceEnAmbientesConAireAcondicionado:
          permaneceEnAmbientesConAireAcondicionado ??
              this.permaneceEnAmbientesConAireAcondicionado,
      permaneceEnAmbientesConPocaVentilacion:
          permaneceEnAmbientesConPocaVentilacion ??
              this.permaneceEnAmbientesConPocaVentilacion,
      seExponeACambiosBruscosDeTemperatura:
          seExponeACambiosBruscosDeTemperatura ??
              this.seExponeACambiosBruscosDeTemperatura,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "viveEnAmbienteDeFumadores": viveEnAmbienteDeFumadores,
      "trabajaEnAmbienteRuidoso": trabajaEnAmbienteRuidoso,
      "permaneceEnAmbientesConAireAcondicionado":
          permaneceEnAmbientesConAireAcondicionado,
      "permaneceEnAmbientesConPocaVentilacion":
          permaneceEnAmbientesConPocaVentilacion,
      "seExponeACambiosBruscosDeTemperatura":
          seExponeACambiosBruscosDeTemperatura,
    };
  }

  factory FactoresExternos.fromJson(Map<String, dynamic> json) {
    return FactoresExternos(
      viveEnAmbienteDeFumadores: json["viveEnAmbienteDeFumadores"],
      trabajaEnAmbienteRuidoso: json["trabajaEnAmbienteRuidoso"],
      permaneceEnAmbientesConAireAcondicionado:
          json["permaneceEnAmbientesConAireAcondicionado"],
      permaneceEnAmbientesConPocaVentilacion:
          json["permaneceEnAmbientesConPocaVentilacion"],
      seExponeACambiosBruscosDeTemperatura:
          json["seExponeACambiosBruscosDeTemperatura"],
    );
  }
}
