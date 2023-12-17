import 'package:flutter/material.dart';
import 'package:myapp/page-1/registercar.dart'; // Import RegisterCarView

class SplashAuto extends StatelessWidget {
  final int userId;

  SplashAuto({required this.userId});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0, -1),
            end: Alignment(0, 1),
            colors: <Color>[
              Color(0xff080808),
              Color(0xe0080808),
              Color(0xbc080808),
              Color(0xea080808),
            ],
            stops: <double>[0, 0.573, 0.864, 1],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(0 * fem, 82 * fem, 0 * fem, 0 * fem),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Asegura tu espacio,',
                    style: TextStyle(
                      fontFamily: 'system-ui',
                      fontSize: 36 * ffem,
                      fontWeight: FontWeight.w700,
                      height: 1.2125 * ffem / fem,
                      color: Color(0xffffe500),
                    ),
                  ),
                  Text(
                    'registra tu vehículo',
                    style: TextStyle(
                      fontFamily: 'system-ui',
                      fontSize: 36 * ffem,
                      fontWeight: FontWeight.w700,
                      height: 1.2125 * ffem / fem,
                      color: Color(0xffffe500),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    left: 0 * fem,
                    top: 60 * fem,
                    child: Align(
                      child: SizedBox(
                        width: 700 * fem,
                        height: 500 * fem,
                        child: Image.asset(
                          'assets/page-1/images/splashauto/mc20-cielo-1.png',
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 13 * fem,
                    top: 0 * fem,
                    child: Align(
                      child: SizedBox(
                        width: 358 * fem,
                        height: 178 * fem,
                        child: Padding(
                          padding: EdgeInsets.only(left: 17.8 * fem),
                          child: Text(
                            'Completa el registro de tu vehículo para asegurar tu espacio de manera rápida y sencilla. Ingresa la marca, modelo y patente, y prepárate para disfrutar de un estacionamiento personalizado.',
                            style: TextStyle(
                              fontFamily: 'system-ui',
                              fontSize: 22 * ffem,
                              fontWeight: FontWeight.w600,
                              height: 1.2125 * ffem / fem,
                              color: Color(0xff818181),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15 * fem),
              padding: EdgeInsets.fromLTRB(45 * fem, 0 * fem, 45 * fem, 0 * fem),
              child: GestureDetector(
                onTap: () {
                  // Navigate to RegisterCarView with userId
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegisterCarView(userId: userId),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 64 * fem,
                  decoration: BoxDecoration(
                    color: Color(0xffebd82e),
                    borderRadius: BorderRadius.circular(34 * fem),
                  ),
                  child: Center(
                    child: Text(
                      'Iniciar',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'system-ui',
                        fontSize: 28 * ffem,
                        fontWeight: FontWeight.w600,
                        height: 1.2125 * ffem / fem,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
