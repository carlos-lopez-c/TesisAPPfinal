class HabitosGenerales {
  bool realizaReposoVocal;
  String cuantoTiempo;
  bool hablaMuchoTiempoSinBebeLiquido;
  bool asisteAlOtorrinolaringologo;
  bool consumeAlimentosMuyCondimentados;
  bool consumeAlimentosMuyCalientesOMuyFrios;
  bool consumeAlcohol;
  bool consumeTabaco;
  bool consumeCafe;
  bool consumeDrogas;
  bool utilizaRopaAjustada;
  int horasDeSueno;

  HabitosGenerales({
    required this.realizaReposoVocal,
    required this.cuantoTiempo,
    required this.hablaMuchoTiempoSinBebeLiquido,
    required this.asisteAlOtorrinolaringologo,
    required this.consumeAlimentosMuyCondimentados,
    required this.consumeAlimentosMuyCalientesOMuyFrios,
    required this.consumeAlcohol,
    required this.consumeTabaco,
    required this.consumeCafe,
    required this.consumeDrogas,
    required this.utilizaRopaAjustada,
    required this.horasDeSueno,
  });

  HabitosGenerales copyWith({
    bool? realizaReposoVocal,
    String? cuantoTiempo,
    bool? hablaMuchoTiempoSinBebeLiquido,
    bool? asisteAlOtorrinolaringologo,
    bool? consumeAlimentosMuyCondimentados,
    bool? consumeAlimentosMuyCalientesOMuyFrios,
    bool? consumeAlcohol,
    bool? consumeTabaco,
    bool? consumeCafe,
    bool? consumeDrogas,
    bool? utilizaRopaAjustada,
    int? horasDeSueno,
  }) {
    return HabitosGenerales(
      realizaReposoVocal: realizaReposoVocal ?? this.realizaReposoVocal,
      cuantoTiempo: cuantoTiempo ?? this.cuantoTiempo,
      hablaMuchoTiempoSinBebeLiquido:
          hablaMuchoTiempoSinBebeLiquido ?? this.hablaMuchoTiempoSinBebeLiquido,
      asisteAlOtorrinolaringologo:
          asisteAlOtorrinolaringologo ?? this.asisteAlOtorrinolaringologo,
      consumeAlimentosMuyCondimentados: consumeAlimentosMuyCondimentados ??
          this.consumeAlimentosMuyCondimentados,
      consumeAlimentosMuyCalientesOMuyFrios:
          consumeAlimentosMuyCalientesOMuyFrios ??
              this.consumeAlimentosMuyCalientesOMuyFrios,
      consumeAlcohol: consumeAlcohol ?? this.consumeAlcohol,
      consumeTabaco: consumeTabaco ?? this.consumeTabaco,
      consumeCafe: consumeCafe ?? this.consumeCafe,
      consumeDrogas: consumeDrogas ?? this.consumeDrogas,
      utilizaRopaAjustada: utilizaRopaAjustada ?? this.utilizaRopaAjustada,
      horasDeSueno: horasDeSueno ?? this.horasDeSueno,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "realizaReposoVocal": realizaReposoVocal,
      "cuantoTiempo": cuantoTiempo,
      "hablaMuchoTiempoSinBebeLiquido": hablaMuchoTiempoSinBebeLiquido,
      "asisteAlOtorrinolaringologo": asisteAlOtorrinolaringologo,
      "consumeAlimentosMuyCondimentados": consumeAlimentosMuyCondimentados,
      "consumeAlimentosMuyCalientesOMuyFrios":
          consumeAlimentosMuyCalientesOMuyFrios,
      "consumeAlcohol": consumeAlcohol,
      "consumeTabaco": consumeTabaco,
      "consumeCafe": consumeCafe,
      "consumeDrogas": consumeDrogas,
      "utilizaRopaAjustada": utilizaRopaAjustada,
      "horasDeSueno": horasDeSueno,
    };
  }

  factory HabitosGenerales.fromJson(Map<String, dynamic> json) {
    return HabitosGenerales(
      realizaReposoVocal: json["realizaReposoVocal"],
      cuantoTiempo: json["cuantoTiempo"],
      hablaMuchoTiempoSinBebeLiquido: json["hablaMuchoTiempoSinBebeLiquido"],
      asisteAlOtorrinolaringologo: json["asisteAlOtorrinolaringologo"],
      consumeAlimentosMuyCondimentados:
          json["consumeAlimentosMuyCondimentados"],
      consumeAlimentosMuyCalientesOMuyFrios:
          json["consumeAlimentosMuyCalientesOMuyFrios"],
      consumeAlcohol: json["consumeAlcohol"],
      consumeTabaco: json["consumeTabaco"],
      consumeCafe: json["consumeCafe"],
      consumeDrogas: json["consumeDrogas"],
      utilizaRopaAjustada: json["utilizaRopaAjustada"],
      horasDeSueno: json["horasDeSueno"],
    );
  }
}
