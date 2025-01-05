import 'package:flutter/material.dart';
import 'package:h_c_1/citas_medicTR/presentation/screens/DetalleCitaTR.dart';
import 'package:h_c_1/citas_medicTR/presentation/screens/HorarioCitasTR.dart';
import 'package:h_c_1/citas_medicTR/presentation/widgets/ItemWidget_TR.dart';
import 'package:h_c_1/citas_medicTR/presentation/widgets/NavigationButtonCT_TR.dart';
import 'package:h_c_1/citas_medicTR/presentation/widgets/headerCT_TR.dart';
import 'package:h_c_1/citas_medicTR/presentation/widgets/inidicacion_TR.dart';

class ListaCitasTR extends StatelessWidget {
  final List<Map<String, dynamic>> citas = List.generate(50, (index) {
    return {
      'area': 'Área Psicología',
      'patient': 'Carlos López',
      'fecha': '2025-01-0${(index % 9) + 1}',
      'hora': '${9 + index % 12}:00 AM',
      'estado': index % 2 == 0 ? 'pendiente' : 'aceptado',
    };
  }).where((cita) => cita['estado'] != 'aceptado').toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Área de Terapias'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          HeaderctTrWidget(
            textoDinamico: '  LISTADO DE CITAS MÉDICAS',
            textoCitasMedicas: 'SECCCIÓN DE CITAS MÉDICAS',
          ),
          const SizedBox(height: 20),
          //Boton de horario de citas
          NavigationTrButton(
            navigationRoute: (context) => HorarioCitasTr(),
            buttonText: 'HORARIO', // Texto personalizado
          ),
          Divider(),
          IndicacionTrWidget(),
          Divider(),
          Expanded(
            child: ListaCitasScroll(citas: citas),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class ListaCitasScroll extends StatelessWidget {
  final List<Map<String, dynamic>> citas;
  final ScrollController _scrollController = ScrollController();
  int _loadedItems = 10;
  final int _increment = 10;

  ListaCitasScroll({required this.citas}) {
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _loadedItems += _increment;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      itemCount: _loadedItems.clamp(0, citas.length),
      itemBuilder: (context, index) {
        return ItemTrWidget(
          item: {
            'area': 'Terapia',
            'patient': 'Carlos López',
            'fecha': '2025-01-01',
            'hora': '9:00 AM',
            'estado': 'pendiente',
          },
          onTap: () {
            print('Se ejecutó una acción genérica');
          },
          buttonText: 'Ver detalle de la cita', // Cambiar texto del botón
          navigateTo: () {
            // Aquí defines la navegación
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetalleCitaTr(
                        cita: {
                          'area': 'Terapia',
                          'patient': 'Carlos López',
                          'fecha': '2025-01-01',
                          'hora': '9:00 AM',
                          'estado': 'pendiente',
                        },
                        estadoSeleccionado: 'aceptado',
                        onEstadoChanged: (String) {},
                      )), // Página destino
            );
          },
        );
      },
    );
  }
}
