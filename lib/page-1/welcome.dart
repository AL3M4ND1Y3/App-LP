import 'package:flutter/material.dart';
import 'package:myapp/page-1/login.dart';

class Scene4 extends StatelessWidget {
  const Scene4({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return GestureDetector(
      onTap: () {
        // Cerrar la ventana actual
        Navigator.of(context).pop();

        // Abrir la pantalla de inicio de sesión (login.dart)
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Scene2()),
        );
      },
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Image.asset(
              'assets/page-1/images/fondo-welcome-bg.png',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0x33fff859),
                    Color.fromARGB(255, 221, 213, 140),
                  ],
                  stops: [0, 0.7],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.fromLTRB(20 * fem, 0, 23 * fem, 140 * fem),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 20 * fem),
                          child: RichText(
                            text: TextSpan(
                              style: TextStyle(
                                fontFamily: 'system-ui',
                                fontSize: 36 * ffem,
                                fontWeight: FontWeight.w900,
                                height: 1.2175 * ffem / fem,
                                fontStyle: FontStyle.italic,
                                color: const Color.fromARGB(255, 250, 226, 14),
                              ),
                              children: [
                                TextSpan(
                                  text: 'Bienvenido',
                                  style: TextStyle(
                                    fontFamily: 'system-ui',
                                    fontSize: 38 * ffem,
                                    fontWeight: FontWeight.w900,
                                    height: 1.2175 * ffem / fem,
                                    fontStyle: FontStyle.italic,
                                    color: const Color.fromARGB(255, 22, 22, 22),
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                                const TextSpan(
                                  text: ' ',
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 39 * fem,
                          height: 39 * fem,
                          child: Image.asset(
                            'assets/page-1/images/image-4.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'a Linking Parking',
                      style: TextStyle(
                        fontFamily: 'system-ui',
                        fontSize: 38 * ffem,
                        fontWeight: FontWeight.w900,
                        height: 1.2175 * ffem / fem,
                        fontStyle: FontStyle.italic,
                        color: const Color.fromARGB(255, 22, 22, 22),
                        decoration: TextDecoration.none,
                      ),
                    ),
                    Text(
                      'Cerca donde vayas',
                      style: TextStyle(
                        fontFamily: 'system-ui',
                        fontSize: 28 * ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.2175 * ffem / fem,
                        fontStyle: FontStyle.italic,
                        color: const Color.fromARGB(255, 22, 22, 22),
                        decoration: TextDecoration.none,
                        
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
