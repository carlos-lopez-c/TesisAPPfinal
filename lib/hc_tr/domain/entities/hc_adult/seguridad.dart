class Seguridad {
  final bool seAtoraConSuSaliva;
  final String conQueFrecuencia;
  final bool tieneTosOAhogosCuandoSeAlimentaOConsumeMedicamentos;
  final String conQueAlimentosLiquidosMedicamentos;
  final bool presentaAlgunaDificultadParaTomarLiquidosDeUnVaso;
  final bool presentaDificultadConSopasOLosGranosPequenosComoArroz;
  final bool haPresentadoNeumonias;
  final String conQueFrecuenciaPresentoNeumonia;
  final bool seQuedaConRestosDeAlimentosEnLaBocaLuegoDeAlimentarse;
  final bool sienteQueElAlimentoSeVaHaciaSuNariz;

  Seguridad({
    required this.seAtoraConSuSaliva,
    required this.conQueFrecuencia,
    required this.tieneTosOAhogosCuandoSeAlimentaOConsumeMedicamentos,
    required this.conQueAlimentosLiquidosMedicamentos,
    required this.presentaAlgunaDificultadParaTomarLiquidosDeUnVaso,
    required this.presentaDificultadConSopasOLosGranosPequenosComoArroz,
    required this.haPresentadoNeumonias,
    required this.conQueFrecuenciaPresentoNeumonia,
    required this.seQuedaConRestosDeAlimentosEnLaBocaLuegoDeAlimentarse,
    required this.sienteQueElAlimentoSeVaHaciaSuNariz,
  });

  Seguridad copyWith({
    bool? seAtoraConSuSaliva,
    String? conQueFrecuencia,
    bool? tieneTosOAhogosCuandoSeAlimentaOConsumeMedicamentos,
    String? conQueAlimentosLiquidosMedicamentos,
    bool? presentaAlgunaDificultadParaTomarLiquidosDeUnVaso,
    bool? presentaDificultadConSopasOLosGranosPequenosComoArroz,
    bool? haPresentadoNeumonias,
    String? conQueFrecuenciaPresentoNeumonia,
    bool? seQuedaConRestosDeAlimentosEnLaBocaLuegoDeAlimentarse,
    bool? sienteQueElAlimentoSeVaHaciaSuNariz,
  }) {
    return Seguridad(
      seAtoraConSuSaliva: seAtoraConSuSaliva ?? this.seAtoraConSuSaliva,
      conQueFrecuencia: conQueFrecuencia ?? this.conQueFrecuencia,
      tieneTosOAhogosCuandoSeAlimentaOConsumeMedicamentos:
          tieneTosOAhogosCuandoSeAlimentaOConsumeMedicamentos ??
              this.tieneTosOAhogosCuandoSeAlimentaOConsumeMedicamentos,
      conQueAlimentosLiquidosMedicamentos:
          conQueAlimentosLiquidosMedicamentos ??
              this.conQueAlimentosLiquidosMedicamentos,
      presentaAlgunaDificultadParaTomarLiquidosDeUnVaso:
          presentaAlgunaDificultadParaTomarLiquidosDeUnVaso ??
              this.presentaAlgunaDificultadParaTomarLiquidosDeUnVaso,
      presentaDificultadConSopasOLosGranosPequenosComoArroz:
          presentaDificultadConSopasOLosGranosPequenosComoArroz ??
              this.presentaDificultadConSopasOLosGranosPequenosComoArroz,
      haPresentadoNeumonias:
          haPresentadoNeumonias ?? this.haPresentadoNeumonias,
      conQueFrecuenciaPresentoNeumonia: conQueFrecuenciaPresentoNeumonia ??
          this.conQueFrecuenciaPresentoNeumonia,
      seQuedaConRestosDeAlimentosEnLaBocaLuegoDeAlimentarse:
          seQuedaConRestosDeAlimentosEnLaBocaLuegoDeAlimentarse ??
              this.seQuedaConRestosDeAlimentosEnLaBocaLuegoDeAlimentarse,
      sienteQueElAlimentoSeVaHaciaSuNariz:
          sienteQueElAlimentoSeVaHaciaSuNariz ??
              this.sienteQueElAlimentoSeVaHaciaSuNariz,
    );
  }

  Map<String, dynamic> toJson() => {
        'seAtoraConSuSaliva': seAtoraConSuSaliva,
        'conQueFrecuencia': conQueFrecuencia,
        'tieneTosOAhogosCuandoSeAlimentaOConsumeMedicamentos':
            tieneTosOAhogosCuandoSeAlimentaOConsumeMedicamentos,
        'conQueAlimentosLiquidosMedicamentos':
            conQueAlimentosLiquidosMedicamentos,
        'presentaAlgunaDificultadParaTomarLiquidosDeUnVaso':
            presentaAlgunaDificultadParaTomarLiquidosDeUnVaso,
        'presentaDificultadConSopasOLosGranosPequenosComoArroz':
            presentaDificultadConSopasOLosGranosPequenosComoArroz,
        'haPresentadoNeumonias': haPresentadoNeumonias,
        'conQueFrecuenciaPresentoNeumonia': conQueFrecuenciaPresentoNeumonia,
        'seQuedaConRestosDeAlimentosEnLaBocaLuegoDeAlimentarse':
            seQuedaConRestosDeAlimentosEnLaBocaLuegoDeAlimentarse,
        'sienteQueElAlimentoSeVaHaciaSuNariz':
            sienteQueElAlimentoSeVaHaciaSuNariz,
      };

  factory Seguridad.fromJson(Map<String, dynamic> json) => Seguridad(
        seAtoraConSuSaliva: json['seAtoraConSuSaliva'],
        conQueFrecuencia: json['conQueFrecuencia'],
        tieneTosOAhogosCuandoSeAlimentaOConsumeMedicamentos:
            json['tieneTosOAhogosCuandoSeAlimentaOConsumeMedicamentos'],
        conQueAlimentosLiquidosMedicamentos:
            json['conQueAlimentosLiquidosMedicamentos'],
        presentaAlgunaDificultadParaTomarLiquidosDeUnVaso:
            json['presentaAlgunaDificultadParaTomarLiquidosDeUnVaso'],
        presentaDificultadConSopasOLosGranosPequenosComoArroz:
            json['presentaDificultadConSopasOLosGranosPequenosComoArroz'],
        haPresentadoNeumonias: json['haPresentadoNeumonias'],
        conQueFrecuenciaPresentoNeumonia:
            json['conQueFrecuenciaPresentoNeumonia'],
        seQuedaConRestosDeAlimentosEnLaBocaLuegoDeAlimentarse:
            json['seQuedaConRestosDeAlimentosEnLaBocaLuegoDeAlimentarse'],
        sienteQueElAlimentoSeVaHaciaSuNariz:
            json['sienteQueElAlimentoSeVaHaciaSuNariz'],
      );
}
