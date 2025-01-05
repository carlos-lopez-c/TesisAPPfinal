import 'package:flutter/material.dart';
import '/hc_tr/presentation/screens/hc_anam_adult.dart';
import '/hc_tr/presentation/screens/hc_anam_voz.dart';
import '/hc_tr/presentation/screens/hc_general_screen.dart';
import '/shared/header.dart';
// import 'hc_ninos_screen.dart';

class Terapiatab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Area de Terapias')),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 120),
            Header(
              imagePath: 'assets/imagenes/san-miguel.png',
              title: 'Fundación de niños especiales',
              subtitle: '"SAN MIGUEL" FUNESAMI',
              item: 'MENU DE HISTORIAS CLINICAS DEL AREA DE TERAPIAS',
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HcTrGeneral()),
                    );
                  },
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/imagenes/historia-clinica.png',
                        width: 140,
                        height: 150,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Historia Clínica General',
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
                      MaterialPageRoute(builder: (context) => HcTrAnamAdult()),
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
                        'Anamnesis Alimentaria Adultos',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 35),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HcTrAnamVoz()),
                    );
                  },
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/imagenes/voz.png',
                        width: 140,
                        height: 150,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Anamnesis de voz',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
