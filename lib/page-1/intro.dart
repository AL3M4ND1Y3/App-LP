import 'dart:async';
import 'package:flutter/material.dart';
import 'welcome.dart';

class Scene extends StatefulWidget {
  const Scene({Key? key}) : super(key: key);

  @override
  _SceneState createState() => _SceneState();
}

class _SceneState extends State<Scene> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();

    // Agregar un temporizador para navegar después de 6 segundos
    Timer(const Duration(seconds: 8), () {
      Navigator.of(context).pushReplacement(_createRoute(const Scene4())); // Ajusta el nombre de tu clase Welcome
    });
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;

    return Container(
      decoration: const BoxDecoration(
        color: Color(0xffffffff),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 40 * fem),
            width: 350.29 * fem,
            height: 290.53 * fem,
            child: Image.asset(
              'assets/page-1/images/logo.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 20 * fem),
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
              ),
              child: Container(
                width: 70 * fem,
                height: 70 * fem,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(25 * fem),
                ),
                child: RotationTransition(
                  turns: _controller,
                  child: Icon(
                    Icons.refresh,
                    color: Colors.white,
                    size: 50 * fem,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // Método para crear una transición suave
  Route _createRoute(Widget destination) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => destination,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOutCubic;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }
}
