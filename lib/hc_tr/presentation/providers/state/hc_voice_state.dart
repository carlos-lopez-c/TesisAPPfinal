import 'package:h_c_1/hc_tr/domain/entities/hc_voice/create_hc_voice_entity.dart';

class HcVoiceState {
  final bool loading;
  final String errorMessage;
  final CreateHcVoice createHcVoice;
  final String cedula;

  HcVoiceState({
    this.loading = false,
    this.errorMessage = '',
    required this.createHcVoice,
    this.cedula = '',
  });

  HcVoiceState copyWith({
    bool? loading,
    String? errorMessage,
    CreateHcVoice? createHcVoice,
    String? cedula,
  }) {
    return HcVoiceState(
      loading: loading ?? this.loading,
      errorMessage: errorMessage ?? this.errorMessage,
      createHcVoice: createHcVoice ?? this.createHcVoice,
      cedula: cedula ?? this.cedula,
    );
  }
}
