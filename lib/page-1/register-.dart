import 'package:flutter/material.dart';

class Scene3 extends StatefulWidget {
  const Scene3({super.key});

  @override
  _Scene3State createState() => _Scene3State();
}

class _Scene3State extends State<Scene3> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  bool _isChecked = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleCheckChanged(bool? value) {
    setState(() {
      _isChecked = value ?? false;
      if (_isChecked) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color(0xffffffff),
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.fromLTRB(29 * fem, 30 * fem, 41 * fem, 74 * fem),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildBackButton(fem),
                  SizedBox(height: 20 * fem),
                  buildTitle(ffem),
                  SizedBox(height: 20 * fem),
                  Container(
                    height: 1 * ffem,  // Altura del separador
                    color: const Color(0xff000000),
                    width: double.infinity,
                  ),
                  SizedBox(height: 20 * fem),
                  buildTextField('Nombre de Usuario', 'user-1.png', fem, ffem),
                  buildTextField('Password', 'vector.png', fem, ffem, obscureText: true),
                  buildTextField('Email', 'vector-GdS.png', fem, ffem),
                  buildTextField('Número de DNI', 'dni-1.png', fem, ffem),
                  SizedBox(height: 20 * fem),
                  buildRememberMeCheckbox(ffem),
                  SizedBox(height: 20 * fem),
                  buildRegisterButton(fem, ffem),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


  Widget buildBackButton(double fem) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TextButton(
          onPressed: () {
            Navigator.pop(context); // Vuelve a la página anterior
          },
          style: TextButton.styleFrom(padding: EdgeInsets.zero),
          child: SizedBox(
            width: 30 * fem,
            height: 30 * fem,
            child: Image.asset(
              'assets/page-1/images/flecha1-1.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }

 Widget buildTitle(double ffem) {
  return Align(
    alignment: Alignment.center,
    child: Text(
      'Registrarse',
      style: TextStyle(
        fontFamily: 'system-ui',
        fontSize: 40 * ffem,
        fontWeight: FontWeight.bold,
        color: const Color(0xff000000),
      ),
    ),
  );
}

  Widget buildSeparator(double ffem) {
    return Container(
      height: 1 * ffem,
      color: const Color(0xff000000),
      width: 302 * ffem,
    );
  }

  Widget buildTextField(String hintText, String imageName, double fem, double ffem, {bool obscureText = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10 * fem),
      padding: EdgeInsets.fromLTRB(19 * fem, 8 * fem, 52 * fem, 7.32 * fem),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xff000000)),
        color: const Color(0xffffffff),
        borderRadius: BorderRadius.circular(10 * fem),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 18 * fem, 0 * fem),
            width: 30 * fem,
            height: 30 * fem,
            child: Image.asset(
              'assets/page-1/images/$imageName',
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.fromLTRB(0 * fem, 3 * fem, 0 * fem, 0 * fem),
              child: TextField(
                obscureText: obscureText,
                decoration: InputDecoration(
                  hintText: hintText,
                  border: InputBorder.none,
                ),
                style: TextStyle(
                  fontFamily: 'system-ui',
                  fontSize: 18 * ffem,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff000000),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRememberMeCheckbox(double ffem) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            _handleCheckChanged(!_isChecked);
          },
          child: Container(
            width: 30 * ffem,
            height: 30 * ffem,
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xff000000)),
              borderRadius: BorderRadius.circular(5 * ffem),
            ),
            child: Center(
              child: AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _animation.value,
                    child: child,
                  );
                },
                child: _isChecked
                    ? Icon(
                        Icons.check,
                        size: 20 * ffem,
                        color: const Color(0xff000000),
                      )
                    : null,
              ),
            ),
          ),
        ),
        SizedBox(width: 10 * ffem),
        Text(
          'Recordar',
          style: TextStyle(
            fontFamily: 'system-ui',
            fontSize: 17 * ffem,
            fontWeight: FontWeight.bold,
            color: const Color(0xff000000),
          ),
        ),
      ],
    );
  }

  Widget buildRegisterButton(double fem, double ffem) {
    return Container(
      width: double.infinity,
      height: 40 * fem,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xff000000)),
        color: const Color(0xfffbe205),
        borderRadius: BorderRadius.circular(30 * fem),
      ),
      child: Center(
        child: Text(
          'Registrarse',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'system-ui',
            fontSize: 18 * ffem,
            fontWeight: FontWeight.bold,
            color: const Color(0xff000000),
          ),
        ),
      ),
    );
  }
}
