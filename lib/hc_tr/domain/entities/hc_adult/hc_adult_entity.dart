import 'package:h_c_1/hc_tr/domain/entities/hc_adult/eficiencia.dart';
import 'package:h_c_1/hc_tr/domain/entities/hc_adult/independencia_autonomia.dart';
import 'package:h_c_1/hc_tr/domain/entities/hc_adult/proceso_alimentacion.dart';
import 'package:h_c_1/hc_tr/domain/entities/hc_adult/salud_bocal.dart';
import 'package:h_c_1/hc_tr/domain/entities/hc_adult/seguridad.dart';

class CreateHcAdultEntity {
  final String patientId;
  final String nombreCompleto;
  final String fechaEvalucion;
  final String lateralidad;
  final IndependenciaAutonomia independenciaAutonomia;
  final Eficiencia eficiencia;
  final Seguridad seguridad;
  final ProcesoDeAlimentacion procesoDeAlimentacion;
  final SaludBocal saludBocal;

  CreateHcAdultEntity({
    required this.patientId,
    required this.nombreCompleto,
    required this.fechaEvalucion,
    required this.lateralidad,
    required this.independenciaAutonomia,
    required this.eficiencia,
    required this.seguridad,
    required this.procesoDeAlimentacion,
    required this.saludBocal,
  });

  CreateHcAdultEntity copyWith({
    String? patientId,
    String? nombreCompleto,
    String? fechaEvalucion,
    String? lateralidad,
    IndependenciaAutonomia? independenciaAutonomia,
    Eficiencia? eficiencia,
    Seguridad? seguridad,
    ProcesoDeAlimentacion? procesoDeAlimentacion,
    SaludBocal? saludBocal,
  }) {
    return CreateHcAdultEntity(
      patientId: patientId ?? this.patientId,
      nombreCompleto: nombreCompleto ?? this.nombreCompleto,
      fechaEvalucion: fechaEvalucion ?? this.fechaEvalucion,
      lateralidad: lateralidad ?? this.lateralidad,
      independenciaAutonomia:
          independenciaAutonomia ?? this.independenciaAutonomia,
      eficiencia: eficiencia ?? this.eficiencia,
      seguridad: seguridad ?? this.seguridad,
      procesoDeAlimentacion:
          procesoDeAlimentacion ?? this.procesoDeAlimentacion,
      saludBocal: saludBocal ?? this.saludBocal,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'patientId': patientId,
      'nombreCompleto': nombreCompleto,
      'fechaEvalucion': fechaEvalucion,
      'lateralidad': lateralidad,
      'independenciaAutonomia': independenciaAutonomia.toJson(),
      'eficiencia': eficiencia.toJson(),
      'seguridad': seguridad.toJson(),
      'procesoDeAlimentacion': procesoDeAlimentacion.toJson(),
      'saludBocal': saludBocal.toJson(),
    };
  }

  factory CreateHcAdultEntity.fromJson(Map<String, dynamic> json) {
    return CreateHcAdultEntity(
      patientId: json['patientId'],
      nombreCompleto: json['nombreCompleto'],
      fechaEvalucion: json['fechaEvalucion'],
      lateralidad: json['lateralidad'],
      independenciaAutonomia:
          IndependenciaAutonomia.fromJson(json['independenciaAutonomia']),
      eficiencia: Eficiencia.fromJson(json['eficiencia']),
      seguridad: Seguridad.fromJson(json['seguridad']),
      procesoDeAlimentacion:
          ProcesoDeAlimentacion.fromJson(json['procesoDeAlimentacion']),
      saludBocal: SaludBocal.fromJson(json['saludBocal']),
    );
  }
}
