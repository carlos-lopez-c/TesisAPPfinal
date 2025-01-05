import 'package:flutter/material.dart';
import '/hc_ps/presentation/screens/hc_adult_screen.dart';
import '/shared/header.dart';
import 'hc_ninos_screen.dart';

class PsicologiaTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Area de Psicología')),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 200),
            Header(
              imagePath: 'assets/imagenes/san-miguel.png',
              title: 'Fundación de niños especiales',
              subtitle: '"SAN MIGUEL" FUNESAMI',
              item: 'MENU DE HISTORIAS CLINICAS DEL AREA DE PSICOLOGIA',
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HistoriaClinicaNinoPS()),
                    );
                  },
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/imagenes/nino.png',
                        width: 140,
                        height: 150,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Historia Clínica de niños',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 30),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HistoriaClinicaAdultPS()),
                    );
                  },
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/imagenes/adult.png',
                        width: 140,
                        height: 150,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Historia Clínica de adultos',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 35),
          ],
        ),
      ),
    );
  }
}
