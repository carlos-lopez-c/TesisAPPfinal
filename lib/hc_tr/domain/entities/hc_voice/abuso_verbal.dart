class AbusoVocal {
  bool toseEnExceso;
  bool gritaEnExceso;
  bool hablaMucho;
  bool hablaRapido;
  bool imitaVoces;
  bool hablaConExcesoDeRuido;
  bool reduceElUsoDeLaVozEnResfrios;
  bool carraspeaEnExceso;
  bool hablaForzandoLaVoz;
  bool hablaAlMismoTiempoQueOtrasPersonas;
  bool hablaConDientesHombroYCuelloApretados;

  AbusoVocal({
    required this.toseEnExceso,
    required this.gritaEnExceso,
    required this.hablaMucho,
    required this.hablaRapido,
    required this.imitaVoces,
    required this.hablaConExcesoDeRuido,
    required this.reduceElUsoDeLaVozEnResfrios,
    required this.carraspeaEnExceso,
    required this.hablaForzandoLaVoz,
    required this.hablaAlMismoTiempoQueOtrasPersonas,
    required this.hablaConDientesHombroYCuelloApretados,
  });

  AbusoVocal copyWith({
    bool? toseEnExceso,
    bool? gritaEnExceso,
    bool? hablaMucho,
    bool? hablaRapido,
    bool? imitaVoces,
    bool? hablaConExcesoDeRuido,
    bool? reduceElUsoDeLaVozEnResfrios,
    bool? carraspeaEnExceso,
    bool? hablaForzandoLaVoz,
    bool? hablaAlMismoTiempoQueOtrasPersonas,
    bool? hablaConDientesHombroYCuelloApretados,
  }) {
    return AbusoVocal(
      toseEnExceso: toseEnExceso ?? this.toseEnExceso,
      gritaEnExceso: gritaEnExceso ?? this.gritaEnExceso,
      hablaMucho: hablaMucho ?? this.hablaMucho,
      hablaRapido: hablaRapido ?? this.hablaRapido,
      imitaVoces: imitaVoces ?? this.imitaVoces,
      hablaConExcesoDeRuido:
          hablaConExcesoDeRuido ?? this.hablaConExcesoDeRuido,
      reduceElUsoDeLaVozEnResfrios:
          reduceElUsoDeLaVozEnResfrios ?? this.reduceElUsoDeLaVozEnResfrios,
      carraspeaEnExceso: carraspeaEnExceso ?? this.carraspeaEnExceso,
      hablaForzandoLaVoz: hablaForzandoLaVoz ?? this.hablaForzandoLaVoz,
      hablaAlMismoTiempoQueOtrasPersonas: hablaAlMismoTiempoQueOtrasPersonas ??
          this.hablaAlMismoTiempoQueOtrasPersonas,
      hablaConDientesHombroYCuelloApretados:
          hablaConDientesHombroYCuelloApretados ??
              this.hablaConDientesHombroYCuelloApretados,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "toseEnExceso": toseEnExceso,
      "gritaEnExceso": gritaEnExceso,
      "hablaMucho": hablaMucho,
      "hablaRapido": hablaRapido,
      "imitaVoces": imitaVoces,
      "hablaConExcesoDeRuido": hablaConExcesoDeRuido,
      "reduceElUsoDeLaVozEnResfrios": reduceElUsoDeLaVozEnResfrios,
      "carraspeaEnExceso": carraspeaEnExceso,
      "hablaForzandoLaVoz": hablaForzandoLaVoz,
      "hablaAlMismoTiempoQueOtrasPersonas": hablaAlMismoTiempoQueOtrasPersonas,
      "hablaConDientesHombroYCuelloApretados":
          hablaConDientesHombroYCuelloApretados,
    };
  }

  factory AbusoVocal.fromJson(Map<String, dynamic> json) {
    return AbusoVocal(
      toseEnExceso: json["toseEnExceso"],
      gritaEnExceso: json["gritaEnExceso"],
      hablaMucho: json["hablaMucho"],
      hablaRapido: json["hablaRapido"],
      imitaVoces: json["imitaVoces"],
      hablaConExcesoDeRuido: json["hablaConExcesoDeRuido"],
      reduceElUsoDeLaVozEnResfrios: json["reduceElUsoDeLaVozEnResfrios"],
      carraspeaEnExceso: json["carraspeaEnExceso"],
      hablaForzandoLaVoz: json["hablaForzandoLaVoz"],
      hablaAlMismoTiempoQueOtrasPersonas:
          json["hablaAlMismoTiempoQueOtrasPersonas"],
      hablaConDientesHombroYCuelloApretados:
          json["hablaConDientesHombroYCuelloApretados"],
    );
  }
}
