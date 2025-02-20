class CreateAppointments {
  String patientId;
  DateTime date;
  String appointmentTime;
  String medicalInsurance;
  String doctorId;
  String specialtyTherapyId;
  String diagnosis;

  CreateAppointments({
    required this.patientId,
    required this.date,
    required this.appointmentTime,
    required this.medicalInsurance,
    required this.doctorId,
    required this.specialtyTherapyId,
    required this.diagnosis,
  });

  CreateAppointments copyWith({
    String? patientId,
    DateTime? date,
    String? appointmentTime,
    String? medicalInsurance,
    String? doctorId,
    String? specialtyTherapyId,
    String? diagnosis,
  }) {
    return CreateAppointments(
      patientId: patientId ?? this.patientId,
      date: date ?? this.date,
      appointmentTime: appointmentTime ?? this.appointmentTime,
      medicalInsurance: medicalInsurance ?? this.medicalInsurance,
      doctorId: doctorId ?? this.doctorId,
      specialtyTherapyId: specialtyTherapyId ?? this.specialtyTherapyId,
      diagnosis: diagnosis ?? this.diagnosis,
    );
  }

  //To Json
  Map<String, dynamic> toJson() {
    return {
      'patientId': patientId,
      'date':
          "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
      'appointmentTime': appointmentTime,
      'medicalInsurance': medicalInsurance,
      'doctorId': doctorId,
      'specialtyTherapyId': specialtyTherapyId,
      'diagnosis': diagnosis,
    };
  }

  //From Json
  factory CreateAppointments.fromJson(Map<String, dynamic> json) {
    return CreateAppointments(
      patientId: json['patientId'],
      date: json['date'],
      appointmentTime: json['appointmentTime'],
      medicalInsurance: json['medicalInsurance'],
      doctorId: json['doctorId'],
      specialtyTherapyId: json['specialtyTherapyId'],
      diagnosis: json['diagnosis'],
    );
  }
}
