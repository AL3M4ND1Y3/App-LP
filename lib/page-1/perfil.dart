import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ProfileScreen extends StatefulWidget {
  final int userId;

  const ProfileScreen({Key? key, required this.userId}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late Map<String, dynamic> userData = {}; // Inicializado con un mapa vacío

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    final response = await http.post(
      Uri.parse('https://basededatoslinkinp.000webhostapp.com/perfil.php'),
      body: {'user_id': widget.userId.toString()},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      setState(() {
        userData = data;
      });
    } else {
      // Manejar el error de la solicitud HTTP
      print('Error en la solicitud HTTP');
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: () async {
        // Esta función se llama cuando se presiona el botón de retroceso en Android
        Navigator.pop(context);
        return true; // Devuelve true para permitir el pop
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: userData.isEmpty
                  ? Container()
                  : Column(
                      children: [
                        Container(
                          color: Colors.white,
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: screenWidth < 600 ? 60.0 : 75.0,
                                backgroundImage: userData.containsKey('foto')
                                    ? CachedNetworkImageProvider('https://basededatoslinkinp.000webhostapp.com/images/fotosuser/${userData['foto']}')
                                    : const AssetImage('assets/page-1/images/image-10.png') as ImageProvider,
                              ),
                              SizedBox(height: screenWidth < 600 ? 12.0 : 24.0),
                              Text(
                                userData.containsKey('name') ? userData['name'] : 'Nombre y Apellido',
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth < 600 ? 18.0 : 24.0),
                              ),
                              const SizedBox(height: 8.0),
                              Text(
                                userData.containsKey('email') ? userData['email'] : 'Correo@gmail.com',
                                style: TextStyle(fontStyle: FontStyle.italic, fontSize: screenWidth < 600 ? 16.0 : 18.0),
                              ),
                              const SizedBox(height: 16.0),
                              _buildBox('Editar Perfil', Icons.edit, screenWidth),
                              _buildBox('Método de Pago', Icons.payment, screenWidth),
                              _buildBox('Notificaciones', Icons.notifications, screenWidth),
                              _buildBox('Ayuda', Icons.help, screenWidth),
                              const SizedBox(height: 16.0),
                              _buildBoxWithImage('assets/page-1/images/iconly-light-logout.png', 'Cerrar Sesión', screenWidth),
                            ],
                          ),
                        ),
                      ],
                    ),
            ),
            if (userData.isEmpty)
              Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                ),
              ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            _buildNavBarItem('Inicio', 'assets/page-1/images/iconly-bold-home-wWC.png', screenWidth),
            _buildNavBarItem('Mapa', 'assets/page-1/images/gps-3.png', screenWidth),
            _buildNavBarItem('Actividad', 'assets/page-1/images/vector-38G.png', screenWidth),
            _buildNavBarItem('Cuenta', 'assets/page-1/images/vector-n4C.png', screenWidth, selected: true),
          ],
          onTap: (index) {
            // Manejar la selección del BottomNavigationBar
            if (index == 0) {
              Navigator.pop(context); // Llevar atrás
            } else if (index == 1) {
              // Manejar la selección de 'Mapa'
              // Puedes agregar código aquí si necesitas manejar la navegación de 'Mapa'
            } else if (index == 2) {
              // Manejar la selección de 'Actividad'
              // Puedes agregar código aquí si necesitas manejar la navegación de 'Actividad'
            } else if (index == 3) {
              // Manejar la selección de 'Cuenta'
              // Puedes agregar código aquí si necesitas manejar la navegación de 'Cuenta'
            }
          },
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildNavBarItem(String title, String imagePath, double screenWidth, {bool selected = false}) {
    double iconSize = screenWidth < 600 ? 20.0 : 24.0;
    Color iconColor = selected ? Colors.black : Colors.grey;

    return BottomNavigationBarItem(
      icon: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Image.asset(
              imagePath,
              height: iconSize,
              color: iconColor,
            ),
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 12.0),
          ),
        ],
      ),
      label: '',
    );
  }

  Widget _buildBox(String title, IconData iconData, double screenWidth) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 214, 213, 213),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: [
          Icon(
            iconData,
            size: screenWidth < 600 ? 20.0 : 24.0,
          ),
          const SizedBox(width: 8.0),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth < 600 ? 16.0 : 20.0),
          ),
        ],
      ),
    );
  }

  Widget _buildBoxWithImage(String imagePath, String title, double screenWidth) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(0, 214, 213, 213),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: [
          Image.asset(
            imagePath,
            height: 24.0,
          ),
          const SizedBox(width: 8.0),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth < 600 ? 16.0 : 20.0, color: Colors.red),
          ),
        ],
      ),
    );
  }
}
