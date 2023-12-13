import 'package:flutter/material.dart';

class Scene extends StatelessWidget {
  const Scene({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return SizedBox(
      width: double.infinity,
      child: Container(
        // homeUYC (1:2)
        padding: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 52*fem),
        width: double.infinity,
        decoration: const BoxDecoration (
          color: Color(0xffffffff),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              // autogroupqegciax (SgrpfM8qq2AD1jGq4kqeGc)
              width: double.infinity,
              height: 745*fem,
              child: Stack(
                children: [
                  Positioned(
                    // autogroupdohvS1A (Sgro6ouNNDRB4xkgaJdohv)
                    left: 1*fem,
                    top: 18.999993422*fem,
                    child: SizedBox(
                      width: 373*fem,
                      height: 99.76*fem,
                      child: Stack(
                        children: [
                          Positioned(
                            // input8ua (1:3)
                            left: 122*fem,
                            top: 20.000006578*fem,
                            child: Align(
                              child: SizedBox(
                                width: 251*fem,
                                height: 53*fem,
                                child: Container(
                                  decoration: BoxDecoration (
                                    borderRadius: BorderRadius.circular(40*fem),
                                    color: const Color(0xffe8e8e8),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // searchi76 (1:6)
                            left: 314.1875*fem,
                            top: 32.187506578*fem,
                            child: Align(
                              child: SizedBox(
                                width: 27.56*fem,
                                height: 27.56*fem,
                                child: Image.asset(
                                  'assets/page-1/images/search.png',
                                  width: 27.56*fem,
                                  height: 27.56*fem,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // line41bz (1:8)
                            left: 30*fem,
                            top: 87.0000066067*fem,
                            child: Align(
                              child: SizedBox(
                                width: 302*fem,
                                height: 1*fem,
                                child: Image.asset(
                                  'assets/page-1/images/line-4.png',
                                  width: 302*fem,
                                  height: 1*fem,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // logoWYk (1:9)
                            left: 0*fem,
                            top: 0*fem,
                            child: Align(
                              child: SizedBox(
                                width: 121.04*fem,
                                height: 99.76*fem,
                                child: Image.asset(
                                  'assets/page-1/images/logo.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // adndevasaestacionarRvc (1:15)
                            left: 160.5*fem,
                            top: 29.000006578*fem,
                            child: Align(
                              child: SizedBox(
                                width: 119*fem,
                                height: 39*fem,
                                child: Text(
                                  '¿A dónde vas a estacionar?',
                                  textAlign: TextAlign.center,
                                  style: TextStyle (
                                    fontFamily: 'system-ui',
                                    fontSize: 16*ffem,
                                    fontWeight: FontWeight.w700,
                                    height: 1.2125*ffem/fem,
                                    color: const Color(0xff515151),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    // autogroupurgc3wz (SgroLoW43JmrkKZVfiUrgC)
                    left: 28*fem,
                    top: 130*fem,
                    child: SizedBox(
                      width: 343*fem,
                      height: 53*fem,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // gps1xp4 (1:17)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 8*fem, 0*fem),
                            width: 33*fem,
                            height: 33*fem,
                            child: Image.asset(
                              'assets/page-1/images/gps-1.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            // inputHrL (1:4)
                            width: 302*fem,
                            height: 53*fem,
                            decoration: BoxDecoration (
                              borderRadius: BorderRadius.circular(40*fem),
                              color: const Color(0xffe8e8e8),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    // autogrouptjjzqN4 (SgroY3gKMFq1r4B3JAtjjz)
                    left: 28*fem,
                    top: 227*fem,
                    child: SizedBox(
                      width: 343*fem,
                      height: 53*fem,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // gps2AQL (1:18)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 8*fem, 0*fem),
                            width: 33*fem,
                            height: 33*fem,
                            child: Image.asset(
                              'assets/page-1/images/gps-2.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            // autogroupxerxgda (SgrofxcoJrGsDGyXzrxerx)
                            width: 302*fem,
                            height: double.infinity,
                            decoration: BoxDecoration (
                              color: const Color(0xffe8e8e8),
                              borderRadius: BorderRadius.circular(40*fem),
                            ),
                            child: Center(
                              child: Text(
                                'La Rioja 766, W3400 Corrientes',
                                textAlign: TextAlign.center,
                                style: TextStyle (
                                  fontFamily: 'system-ui',
                                  fontSize: 16*ffem,
                                  fontWeight: FontWeight.w500,
                                  height: 1.2125*ffem/fem,
                                  color: const Color(0xff000000),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    // sugerenciasAYk (1:10)
                    left: 27.5*fem,
                    top: 324*fem,
                    child: Align(
                      child: SizedBox(
                        width: 123*fem,
                        height: 25*fem,
                        child: Text(
                          'Sugerencias',
                          textAlign: TextAlign.center,
                          style: TextStyle (
                            fontFamily: 'system-ui',
                            fontSize: 20*ffem,
                            fontWeight: FontWeight.w700,
                            height: 1.2125*ffem/fem,
                            color: const Color(0xff000000),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // reservhastadosmesesconelmismop (1:11)
                    left: 84*fem,
                    top: 704*fem,
                    child: Align(
                      child: SizedBox(
                        width: 215*fem,
                        height: 34*fem,
                        child: Text(
                          'Reservá hasta dos meses con el mismo precio',
                          style: TextStyle (
                            fontFamily: 'system-ui',
                            fontSize: 14*ffem,
                            fontWeight: FontWeight.w500,
                            height: 1.2125*ffem/fem,
                            color: const Color(0xff727272),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // msformasdeusarlinkingparking8t (1:12)
                    left: 104*fem,
                    top: 481*fem,
                    child: Align(
                      child: SizedBox(
                        width: 193*fem,
                        height: 49*fem,
                        child: Text(
                          'Más formas de usar Linking Parking',
                          textAlign: TextAlign.center,
                          style: TextStyle (
                            fontFamily: 'system-ui',
                            fontSize: 20*ffem,
                            fontWeight: FontWeight.w700,
                            height: 1.2125*ffem/fem,
                            color: const Color(0xff000000),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // salta471w3400blbcorrientesq2c (1:13)
                    left: 76*fem,
                    top: 148*fem,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(22.5*fem, 0*fem, 22.5*fem, 0*fem),
                      width: 295*fem,
                      height: 17*fem,
                      child: Text(
                        'Salta 471, W3400BLB Corrientes',
                        textAlign: TextAlign.center,
                        style: TextStyle (
                          fontFamily: 'system-ui',
                          fontSize: 16*ffem,
                          fontWeight: FontWeight.w500,
                          height: 1.2125*ffem/fem,
                          color: const Color(0xff000000),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // autogroupcyxlHvC (SgroqYBAwd2NSkgZASCYxL)
                    left: 27*fem,
                    top: 366*fem,
                    child: SizedBox(
                      width: 347*fem,
                      height: 103*fem,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            // autogroupwo7apQL (Sgrp6CRQtPJWsR3yeCWo7a)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 26*fem, 0*fem),
                            padding: EdgeInsets.fromLTRB(19*fem, 16*fem, 16*fem, 6*fem),
                            width: 92*fem,
                            decoration: BoxDecoration (
                              color: const Color(0xffe8e8e8),
                              borderRadius: BorderRadius.circular(15*fem),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // image5Wnx (1:22)
                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 3*fem, 6*fem),
                                  width: 32*fem,
                                  height: 35*fem,
                                  child: Image.asset(
                                    'assets/page-1/images/image-5.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Container(
                                  // mscercanoe8U (1:23)
                                  constraints: BoxConstraints (
                                    maxWidth: 57*fem,
                                  ),
                                  child: Text(
                                    'Más \ncercano',
                                    textAlign: TextAlign.center,
                                    style: TextStyle (
                                      fontFamily: 'system-ui',
                                      fontSize: 15*ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.2125*ffem/fem,
                                      color: const Color(0xff000000),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            // autogroupdtuixQ4 (SgrpFcKPxEpev4sLxgdtui)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 21*fem, 0*fem),
                            width: 100*fem,
                            height: double.infinity,
                            decoration: BoxDecoration (
                              color: const Color(0xffe8e8e8),
                              borderRadius: BorderRadius.circular(15*fem),
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  // rerservarGfe (1:24)
                                  left: 15.5*fem,
                                  top: 69*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 69*fem,
                                      height: 19*fem,
                                      child: Text(
                                        'Rerservar',
                                        textAlign: TextAlign.center,
                                        style: TextStyle (
                                          fontFamily: 'system-ui',
                                          fontSize: 15*ffem,
                                          fontWeight: FontWeight.w400,
                                          height: 1.2125*ffem/fem,
                                          color: const Color(0xff000000),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  // image6Mwz (1:46)
                                  left: 24*fem,
                                  top: 8*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 63*fem,
                                      height: 63*fem,
                                      child: Image.asset(
                                        'assets/page-1/images/image-6.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            // autogroupq3gpVYQ (SgrpLrfeq9afJ5RQ7xq3Gp)
                            margin: EdgeInsets.fromLTRB(0*fem, 1*fem, 0*fem, 3*fem),
                            padding: EdgeInsets.fromLTRB(18.5*fem, 9*fem, 18.5*fem, 0*fem),
                            width: 108*fem,
                            height: double.infinity,
                            decoration: BoxDecoration (
                              color: const Color(0xffe8e8e8),
                              borderRadius: BorderRadius.circular(15*fem),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // image7aJx (1:47)
                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 3*fem),
                                  width: 50*fem,
                                  height: 50*fem,
                                  child: Image.asset(
                                    'assets/page-1/images/image-7.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Container(
                                  // mejoresvaloradosWCc (1:25)
                                  constraints: BoxConstraints (
                                    maxWidth: 71*fem,
                                  ),
                                  child: Text(
                                    'Mejores \nValorados',
                                    textAlign: TextAlign.center,
                                    style: TextStyle (
                                      fontFamily: 'system-ui',
                                      fontSize: 15*ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.2125*ffem/fem,
                                      color: const Color(0xff000000),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    // rectangle13Dcp (1:26)
                    left: 84*fem,
                    top: 535*fem,
                    child: Align(
                      child: SizedBox(
                        width: 233*fem,
                        height: 134*fem,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(9*fem),
                          child: Image.asset(
                            'assets/page-1/images/rectangle-13.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // group57iC (1:27)
                    left: 85*fem,
                    top: 681*fem,
                    child: SizedBox(
                      width: 178*fem,
                      height: 20*fem,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // formasdereservarey2 (1:28)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 5*fem, 0*fem),
                            child: Text(
                              'Formas de reservar',
                              textAlign: TextAlign.center,
                              style: TextStyle (
                                fontFamily: 'system-ui',
                                fontSize: 16*ffem,
                                fontWeight: FontWeight.w500,
                                height: 1.2125*ffem/fem,
                                color: const Color(0xff000000),
                              ),
                            ),
                          ),
                          SizedBox(
                            // image8a5z (1:29)
                            width: 25*fem,
                            height: 20*fem,
                            child: Image.asset(
                              'assets/page-1/images/image-8.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // navegacionixt (1:31)
              padding: EdgeInsets.fromLTRB(36*fem, 10*fem, 26.5*fem, 0*fem),
              width: 396*fem,
              height: 47*fem,
              child: SizedBox(
                // autogroupaibeTvU (SgrrAPU9NZ4a3A6GnMaibE)
                width: double.infinity,
                height: double.infinity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // autogroupedic1wz (SgrrJJQdL9WRQNtmV3ediC)
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 70*fem, 0*fem),
                      height: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // iconlyboldhomekeg (1:39)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 1.95*fem, 3*fem),
                            width: 18.05*fem,
                            height: 19*fem,
                            child: Image.asset(
                              'assets/page-1/images/iconly-bold-home.png',
                              width: 18.05*fem,
                              height: 19*fem,
                            ),
                          ),
                          Text(
                            // iniciosUQ (1:34)
                            'Inicio',
                            textAlign: TextAlign.center,
                            style: TextStyle (
                              fontFamily: 'system-ui',
                              fontSize: 12*ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.2125*ffem/fem,
                              color: const Color(0xff000000),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      // autogroupxanyp8k (SgrrPiRGmyVnyDLUVQxaNY)
                      width: 32*fem,
                      height: double.infinity,
                      child: Stack(
                        children: [
                          Positioned(
                            // mapamZn (1:35)
                            left: 0*fem,
                            top: 22*fem,
                            child: Align(
                              child: SizedBox(
                                width: 32*fem,
                                height: 15*fem,
                                child: Text(
                                  'Mapa',
                                  textAlign: TextAlign.center,
                                  style: TextStyle (
                                    fontFamily: 'system-ui',
                                    fontSize: 12*ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2125*ffem/fem,
                                    color: const Color(0xffa4a4a4),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // gps3f9N (1:42)
                            left: 3*fem,
                            top: 0*fem,
                            child: Align(
                              child: SizedBox(
                                width: 26*fem,
                                height: 22*fem,
                                child: Image.asset(
                                  'assets/page-1/images/gps-3.png',
                                  width: 26*fem,
                                  height: 22*fem,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // autogroupodlpB7i (Sgrrdi1xT4rUea9HapodLp)
                      padding: EdgeInsets.fromLTRB(57*fem, 1*fem, 0*fem, 0*fem),
                      height: double.infinity,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            // autogroupewd6u3i (SgrrTYeDq5oCGCpUxSewD6)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 49.5*fem, 0*fem),
                            height: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // vectorS3e (1:38)
                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 2*fem),
                                  width: 14*fem,
                                  height: 19*fem,
                                  child: Image.asset(
                                    'assets/page-1/images/vector-38G.png',
                                    width: 14*fem,
                                    height: 19*fem,
                                  ),
                                ),
                                Text(
                                  // actividadwFJ (1:36)
                                  'Actividad',
                                  textAlign: TextAlign.center,
                                  style: TextStyle (
                                    fontFamily: 'system-ui',
                                    fontSize: 12*ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2125*ffem/fem,
                                    color: const Color(0xffa4a4a4),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            // autogroupntpegTn (SgrrY8LvSKdjtuovjNNtPE)
                            height: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // vector2nY (1:37)
                                  margin: EdgeInsets.fromLTRB(3*fem, 0*fem, 0*fem, 2*fem),
                                  width: 17*fem,
                                  height: 19*fem,
                                  child: Image.asset(
                                    'assets/page-1/images/vector.png',
                                    width: 17*fem,
                                    height: 19*fem,
                                  ),
                                ),
                                Text(
                                  // cuentaxw6 (1:33)
                                  'Cuenta',
                                  textAlign: TextAlign.center,
                                  style: TextStyle (
                                    fontFamily: 'system-ui',
                                    fontSize: 12*ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2125*ffem/fem,
                                    color: const Color(0xffa4a4a4),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
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