class DesarrolloMotorGrueso {
  bool controlCefalico;
  bool gateo;
  bool marcha;
  bool sedestacion;
  bool sincinesias;
  bool subeBajaGradas;
  bool rotacionPies;

  DesarrolloMotorGrueso({
    required this.controlCefalico,
    required this.gateo,
    required this.marcha,
    required this.sedestacion,
    required this.sincinesias,
    required this.subeBajaGradas,
    required this.rotacionPies,
  });

  DesarrolloMotorGrueso copyWith({
    bool? controlCefalico,
    bool? gateo,
    bool? marcha,
    bool? sedestacion,
    bool? sincinesias,
    bool? subeBajaGradas,
    bool? rotacionPies,
  }) {
    return DesarrolloMotorGrueso(
      controlCefalico: controlCefalico ?? this.controlCefalico,
      gateo: gateo ?? this.gateo,
      marcha: marcha ?? this.marcha,
      sedestacion: sedestacion ?? this.sedestacion,
      sincinesias: sincinesias ?? this.sincinesias,
      subeBajaGradas: subeBajaGradas ?? this.subeBajaGradas,
      rotacionPies: rotacionPies ?? this.rotacionPies,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'controlCefalico': controlCefalico,
      'gateo': gateo,
      'marcha': marcha,
      'sedestacion': sedestacion,
      'sincinesias': sincinesias,
      'subeBajaGradas': subeBajaGradas,
      'rotacionPies': rotacionPies,
    };
  }

  factory DesarrolloMotorGrueso.fromJson(Map<String, dynamic> json) {
    return DesarrolloMotorGrueso(
      controlCefalico: json['controlCefalico'],
      gateo: json['gateo'],
      marcha: json['marcha'],
      sedestacion: json['sedestacion'],
      sincinesias: json['sincinesias'],
      subeBajaGradas: json['subeBajaGradas'],
      rotacionPies: json['rotacionPies'],
    );
  }
}
