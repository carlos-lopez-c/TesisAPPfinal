class ComportamientoGeneral {
  bool agresivo;
  bool pasivo;
  bool destructor;
  bool sociable;
  bool hipercinetico;
  bool empatia;
  bool interesesPeculiares;
  bool interesPorInteraccion;

  ComportamientoGeneral({
    required this.agresivo,
    required this.pasivo,
    required this.destructor,
    required this.sociable,
    required this.hipercinetico,
    required this.empatia,
    required this.interesesPeculiares,
    required this.interesPorInteraccion,
  });

  ComportamientoGeneral copyWith({
    bool? agresivo,
    bool? pasivo,
    bool? destructor,
    bool? sociable,
    bool? hipercinetico,
    bool? empatia,
    bool? interesesPeculiares,
    bool? interesPorInteraccion,
  }) {
    return ComportamientoGeneral(
      agresivo: agresivo ?? this.agresivo,
      pasivo: pasivo ?? this.pasivo,
      destructor: destructor ?? this.destructor,
      sociable: sociable ?? this.sociable,
      hipercinetico: hipercinetico ?? this.hipercinetico,
      empatia: empatia ?? this.empatia,
      interesesPeculiares: interesesPeculiares ?? this.interesesPeculiares,
      interesPorInteraccion:
          interesPorInteraccion ?? this.interesPorInteraccion,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'agresivo': agresivo,
      'pasivo': pasivo,
      'destructor': destructor,
      'sociable': sociable,
      'hipercinetico': hipercinetico,
      'empatia': empatia,
      'interesesPeculiares': interesesPeculiares,
      'interesPorInteraccion': interesPorInteraccion,
    };
  }

  factory ComportamientoGeneral.fromJson(Map<String, dynamic> json) {
    return ComportamientoGeneral(
      agresivo: json['agresivo'],
      pasivo: json['pasivo'],
      destructor: json['destructor'],
      sociable: json['sociable'],
      hipercinetico: json['hipercinetico'],
      empatia: json['empatia'],
      interesesPeculiares: json['interesesPeculiares'],
      interesPorInteraccion: json['interesPorInteraccion'],
    );
  }
}
