class AntecedentesPersonales {
  bool deseado;
  bool automedicacion;
  bool depresion;
  bool estres;
  bool ansiedad;
  bool traumatismo;
  bool radiaciones;
  bool medicina;
  bool riesgoDeAborto;
  bool maltratoFisico;
  bool consumoDeDrogas;
  bool consumoDeAlcohol;
  bool consumoDeTabaco;
  bool hipertension;
  bool dietaBalanceada;

  AntecedentesPersonales({
    required this.deseado,
    required this.automedicacion,
    required this.depresion,
    required this.estres,
    required this.ansiedad,
    required this.traumatismo,
    required this.radiaciones,
    required this.medicina,
    required this.riesgoDeAborto,
    required this.maltratoFisico,
    required this.consumoDeDrogas,
    required this.consumoDeAlcohol,
    required this.consumoDeTabaco,
    required this.hipertension,
    required this.dietaBalanceada,
  });

  AntecedentesPersonales copyWith({
    bool? deseado,
    bool? automedicacion,
    bool? depresion,
    bool? estres,
    bool? ansiedad,
    bool? traumatismo,
    bool? radiaciones,
    bool? medicina,
    bool? riesgoDeAborto,
    bool? maltratoFisico,
    bool? consumoDeDrogas,
    bool? consumoDeAlcohol,
    bool? consumoDeTabaco,
    bool? hipertension,
    bool? dietaBalanceada,
  }) {
    return AntecedentesPersonales(
      deseado: deseado ?? this.deseado,
      automedicacion: automedicacion ?? this.automedicacion,
      depresion: depresion ?? this.depresion,
      estres: estres ?? this.estres,
      ansiedad: ansiedad ?? this.ansiedad,
      traumatismo: traumatismo ?? this.traumatismo,
      radiaciones: radiaciones ?? this.radiaciones,
      medicina: medicina ?? this.medicina,
      riesgoDeAborto: riesgoDeAborto ?? this.riesgoDeAborto,
      maltratoFisico: maltratoFisico ?? this.maltratoFisico,
      consumoDeDrogas: consumoDeDrogas ?? this.consumoDeDrogas,
      consumoDeAlcohol: consumoDeAlcohol ?? this.consumoDeAlcohol,
      consumoDeTabaco: consumoDeTabaco ?? this.consumoDeTabaco,
      hipertension: hipertension ?? this.hipertension,
      dietaBalanceada: dietaBalanceada ?? this.dietaBalanceada,
    );
  }

  Map<String, dynamic> toJson() => {
        'deseado': deseado,
        'automedicacion': automedicacion,
        'depresion': depresion,
        'estres': estres,
        'ansiedad': ansiedad,
        'traumatismo': traumatismo,
        'radiaciones': radiaciones,
        'medicina': medicina,
        'riesgoDeAborto': riesgoDeAborto,
        'maltratoFisico': maltratoFisico,
        'consumoDeDrogas': consumoDeDrogas,
        'consumoDeAlcohol': consumoDeAlcohol,
        'consumoDeTabaco': consumoDeTabaco,
        'hipertension': hipertension,
        'dietaBalanceada': dietaBalanceada,
      };

  factory AntecedentesPersonales.fromJson(Map<String, dynamic> json) =>
      AntecedentesPersonales(
        deseado: json['deseado'] ?? true,
        automedicacion: json['automedicacion'] ?? true,
        depresion: json['depresion'] ?? true,
        estres: json['estres'] ?? true,
        ansiedad: json['ansiedad'] ?? true,
        traumatismo: json['traumatismo'] ?? true,
        radiaciones: json['radiaciones'] ?? true,
        medicina: json['medicina'] ?? true,
        riesgoDeAborto: json['riesgoDeAborto'] ?? true,
        maltratoFisico: json['maltratoFisico'] ?? true,
        consumoDeDrogas: json['consumoDeDrogas'] ?? true,
        consumoDeAlcohol: json['consumoDeAlcohol'] ?? true,
        consumoDeTabaco: json['consumoDeTabaco'] ?? true,
        hipertension: json['hipertension'] ?? true,
        dietaBalanceada: json['dietaBalanceada'] ?? true,
      );
}
