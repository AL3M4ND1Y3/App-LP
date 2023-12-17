import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:myapp/page-1/perfil.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.userId}) : super(key: key);

  final int userId;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isEditing = false;
  TextEditingController textEditingController = TextEditingController();
  late KeyboardVisibilityController _keyboardVisibilityController;

  @override
  void initState() {
    super.initState();

    // Inicializa el controlador de visibilidad del teclado
    _keyboardVisibilityController = KeyboardVisibilityController();

    // Suscríbete a los cambios de visibilidad del teclado
    _keyboardVisibilityController.onChange.listen((bool visible) {
      setState(() {
        // Actualiza el estado de edición según la visibilidad del teclado
        isEditing = visible;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double logoSize = MediaQuery.of(context).size.width * 0.30;
    double textSize = MediaQuery.of(context).size.width * 0.045;
    double fixedBoxSize = 90.0; // Tamaño fijo para los boxes de sugerencias

    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontFamily: 'system-ui',
          ),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 120.0,
          backgroundColor: Colors.transparent,
          title: Row(
            children: [
              Image.asset(
                'assets/page-1/images/logo.png',
                height: logoSize,
              ),
              const SizedBox(width: 8),
              Flexible(
                child: Container(
                  height: 50.0,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 214, 213, 213),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isEditing = true;
                      });
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.search,
                          color: Colors.black,
                          size: textSize,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: isEditing
                              ? Container(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: TextField(
                                    controller: textEditingController,
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                    decoration: const InputDecoration(
                                      hintText: '',
                                      border: InputBorder.none,
                                    ),
                                    textAlignVertical: TextAlignVertical.center,
                                    maxLines: 1,
                                    onEditingComplete: () {
                                      if (textEditingController.text.isEmpty) {
                                        setState(() {
                                          isEditing = false;
                                        });
                                      }
                                    },
                                  ),
                                )
                              : Marquee(
                                  text: '¿Dónde vas a estacionar hoy?',
                                  style: TextStyle(
                                    fontSize: textSize,
                                  ),
                                  blankSpace: 50.0,
                                  velocity: 69.0,
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.23,
                    child: ListView.builder(
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return _buildHistoryBox(index);
                      },
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Sugerencias',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildResponsiveSuggestionBox(
                              'Más Cercano',
                              'assets/page-1/images/image-5.png',
                              fixedBoxSize,
                            ),
                            const SizedBox(width: 16),
                            _buildResponsiveSuggestionBox(
                              'Reservar',
                              'assets/page-1/images/image-6.png',
                              fixedBoxSize,
                            ),
                            const SizedBox(width: 16),
                            _buildResponsiveSuggestionBox(
                              'Mejores Valorados',
                              'assets/page-1/images/image-7.png',
                              fixedBoxSize,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Aprendé más sobre \n   Linking Parking',
                          style: TextStyle(
                            fontSize: 23.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        CarouselSlider(
                          options: CarouselOptions(
                            height: 200.0,
                            enlargeCenterPage: true,
                            autoPlay: true,
                            aspectRatio: 2.0,
                            onPageChanged: (index, reason) {
                              // TODO: Manejar cambio de página, si es necesario
                            },
                          ),
                          items: [
                            _buildCarouselItem(
                              'assets/page-1/images/rectangle-13.png',
                              'Formas de reservar',
                              'Reservá hasta dos meses sin interés...',
                            ),
                            _buildCarouselItem(
                              'assets/page-1/images/QRLINKINGPARKINGPA.jpg',
                              '¿Cómo funciona el QR?',
                              'Cómo funciona el QR en los boxes...',
                            ),
                            _buildCarouselItem(
                              'assets/page-1/images/buenuser.jpg',
                              '¡Ventajas de buen usuario!',
                              'Descubre las ventajas de ser un usuario ejemplar...',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          margin: EdgeInsets.zero, // Establece el margen a cero
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: [
              _buildNavBarItem('Inicio', 'assets/page-1/images/iconly-bold-home-wWC.png', MediaQuery.of(context).size.width, selected: true, index: 0),
              _buildNavBarItem('Mapa', 'assets/page-1/images/gps-3.png', MediaQuery.of(context).size.width, index: 1),
              _buildNavBarItem('Actividad', 'assets/page-1/images/vector-38G.png', MediaQuery.of(context).size.width, index: 2),
              _buildNavBarItem('Cuenta', 'assets/page-1/images/vector-n4C.png', MediaQuery.of(context).size.width, index: 3),
            ],
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildNavBarItem(String title, String imagePath, double screenWidth, {bool selected = false, int index = 0}) {
    double iconSize = screenWidth < 600 ? 26.0 : 27.0;
    double containerPadding = 0.0; // Ajusta este valor según tus necesidades
    Color iconColor = selected ? Colors.black : Colors.grey;
    FontWeight fontWeight = selected ? FontWeight.bold : FontWeight.normal;

    return BottomNavigationBarItem(
      icon: GestureDetector(
        onTap: () {
          if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen(userId: widget.userId)),
            );
          }
        },
        child: Container(
          padding: EdgeInsets.all(containerPadding),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 0.0), // Ajusta este valor según tus necesidades
                child: Image.asset(
                  imagePath,
                  height: iconSize,
                  color: iconColor,
                ),
              ),
              Text(
                title,
                style: TextStyle(fontSize: 12.0, fontWeight: fontWeight),
              ),
            ],
          ),
        ),
      ),
      label: '',
    );
  }

  Widget _buildHistoryBox(int index) {
    double imageSize = 30.0;

    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 214, 213, 213),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Image.asset(
            'assets/page-1/images/gps-1.png',
            height: imageSize,
            width: imageSize,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              'Dirección ${index + 1}',
              style: const TextStyle(fontSize: 14.0,),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResponsiveSuggestionBox(
    String title,
    String imagePath,
    double fixedBoxSize,
  ) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double boxSize =
            fixedBoxSize < constraints.maxWidth ? fixedBoxSize : constraints.maxWidth;

        return Container(
          width: boxSize,
          height: boxSize,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 214, 213, 213),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imagePath,
                height: 40.0,
                width: 40.0,
              ),
              const SizedBox(height: 8),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCarouselItem(String imagePath, String title, String description) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.7),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(12.0),
                bottomRight: Radius.circular(12.0),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.yellow,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 207, 195, 84),
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
