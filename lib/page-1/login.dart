import 'package:flutter/material.dart';
import 'package:myapp/page-1/register-.dart';
import 'package:myapp/page-1/homereal.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Scene2 extends StatefulWidget {
  const Scene2({Key? key}) : super(key: key);

  @override
  _Scene2State createState() => _Scene2State();
}

class _Scene2State extends State<Scene2> with SingleTickerProviderStateMixin {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool rememberMe = false;
  late AnimationController _controller;
  late Animation<double> _animation;
  int? userId;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);

    checkAndNavigateToHomePage();
  }

  Future<void> checkAndNavigateToHomePage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool hasSession = prefs.getBool('rememberMe') ?? false;

    if (hasSession) {
      emailController.text = prefs.getString('email') ?? '';
      passwordController.text = prefs.getString('password') ?? '';
      userId = prefs.getInt('userId') ?? 0;
      navigateToHomePage();
    }
  }

  Future<void> loadRememberMeStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      rememberMe = prefs.getBool('rememberMe') ?? false;
      if (rememberMe) {
        emailController.text = prefs.getString('email') ?? '';
        passwordController.text = prefs.getString('password') ?? '';
        userId = prefs.getInt('userId') ?? 0;
        _controller.forward();
      }
    });
  }

  Future<void> saveRememberMeStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('rememberMe', rememberMe);
    if (rememberMe) {
      prefs.setString('email', emailController.text);
      prefs.setString('password', passwordController.text);
      prefs.setInt('userId', userId ?? 0);
    } else {
      prefs.remove('email');
      prefs.remove('password');
      prefs.remove('userId');
    }
  }

  Widget buildInputField(String hintText, String iconPath, TextEditingController controller, {bool obscureText = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Image.asset(
            iconPath,
            width: 36,
            height: 20.86,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextFormField(
              controller: controller,
              obscureText: obscureText,
              style: const TextStyle(fontSize: 18),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildForgotPasswordText() {
    return GestureDetector(
      onTap: () {
        // Handle forgot password
      },
      child: const Text(
        '¿Olvidaste tu contraseña?',
        style: TextStyle(
          fontSize: 16, color: Colors.black87,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget buildRememberMeCheckbox() {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              rememberMe = !rememberMe;
              if (rememberMe) {
                _controller.forward();
              } else {
                _controller.reverse();
              }
              saveRememberMeStatus();
            });
          },
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(5),
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
                child: rememberMe
                    ? const Icon(
                        Icons.check,
                        size: 20,
                        color: Colors.black,
                      )
                    : null,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        const Text(
          'Recordar',
          style: TextStyle(
            fontSize: 17, color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget buildLoginButton() {
    return Container(
      width: double.infinity,
      height: 53,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        color: const Color(0xfffbe205),
        borderRadius: BorderRadius.circular(40),
      ),
      child: TextButton(
        onPressed: login,
        child: const Text(
          'Iniciar Sesión',
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
      ),
    );
  }

  Widget buildRegisterButton() {
    return TextButton(
      onPressed: navigateToRegister,
      child: RichText(
        text: const TextSpan(
          style: TextStyle(fontSize: 16, color: Colors.black),
          children: [
            TextSpan(text: '¿No tienes una cuenta?'),
            TextSpan(
              text: ' Regístrate.',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSocialLoginText() {
    return const Text(
      'Inicie sesión con',
      style: TextStyle(fontSize: 20, color: Colors.black),
    );
  }

  Widget buildSocialLoginButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildSocialLoginButton('assets/page-1/images/vector-7mv.png'),
        const SizedBox(width: 10),
        buildSocialLoginButton('assets/page-1/images/logo-facebook.png'),
        const SizedBox(width: 10),
        buildSocialLoginButton('assets/page-1/images/logo-apple.png'),
      ],
    );
  }

  Widget buildSocialLoginButton(String imagePath) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Image.asset(
        imagePath,
        width: 40,
        height: 40,
      ),
    );
  }

  void login() async {
    String email = emailController.text;
    String password = passwordController.text;

    final response = await http.post(
      Uri.parse('https://basededatoslinkinp.000webhostapp.com/login.php'),
      body: {
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      if (data['success']) {
        userId = data['user_id'];
        navigateToHomePage();
      } else {
        showAlertDialog(context, 'Error', 'El correo y/o la contraseña son incorrectos.');
      }
    } else {
      showAlertDialog(context, 'Error', 'Error en la solicitud HTTP: ${response.statusCode}');
    }
  }

  void navigateToHomePage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomePage(userId: userId ?? 0)),
    );
  }

  void navigateToRegister() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Scene3()),
    );
  }

  Future<void> showAlertDialog(BuildContext context, String title, String message) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Iniciar Sesión',
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              height: 2,
              color: Colors.black,
              margin: const EdgeInsets.symmetric(vertical: 10),
            ),
            const SizedBox(height: 20),
            buildInputField('Email', 'assets/page-1/images/vector-WuA.png', emailController),
            const SizedBox(height: 16),
            buildInputField('Password', 'assets/page-1/images/vector-LgU.png', passwordController, obscureText: true),
            const SizedBox(height: 16),
            buildForgotPasswordText(),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildRememberMeCheckbox(),
                const SizedBox(width: 10),
                const Text(
                  '',
                  style: TextStyle(fontSize: 17, color: Colors.black),
                ),
              ],
            ),
            const SizedBox(height: 16),
            buildLoginButton(),
            const SizedBox(height: 16),
            buildRegisterButton(),
            const SizedBox(height: 16),
            buildSocialLoginText(),
            const SizedBox(height: 16),
            buildSocialLoginButtons(),
          ],
        ),
      ),
    );
  }
}
