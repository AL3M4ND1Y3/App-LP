import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:myapp/page-1/registerpatente.dart';

class RegisterCarView extends StatefulWidget {
  final int userId;

  RegisterCarView({required this.userId});

  @override
  _RegisterCarViewState createState() => _RegisterCarViewState();
}

class CarouselItem {
  final String id;
  final String nombre;
  final String foto;

  CarouselItem({required this.id, required this.nombre, required this.foto});
}

class CarModel {
  final String id;
  final String nombre;
  final String foto;

  CarModel({required this.id, required this.nombre, required this.foto});
}

class _RegisterCarViewState extends State<RegisterCarView> {
  late List<CarouselItem> carouselItems;
  List<CarModel> carModels = [];
  int selectedBrandIndex = -1;
  int selectedModelIndex = -1;
  bool isLoadingBrands = true;
  bool isLoadingModels = false;
  bool _autoPlay = true;

  @override
  void initState() {
    super.initState();
    carouselItems = [];
    _loadCarBrands();
  }

  Future<void> _loadCarBrands() async {
    try {
      var url = Uri.parse('https://basededatoslinkinp.000webhostapp.com/cargarmarcas.php');
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var brandsData = json.decode(response.body);

        carouselItems = brandsData.map<CarouselItem>((brand) {
          return CarouselItem(
            id: brand['id'],
            nombre: brand['nombre'],
            foto: brand['foto'],
          );
        }).toList();

        setState(() {
          isLoadingBrands = false;
        });
      } else {
        print('Error en loadCarBrands: ${response.statusCode}');
        setState(() {
          isLoadingBrands = false;
        });
      }
    } catch (e) {
      print('Error en loadCarBrands: $e');
      setState(() {
        isLoadingBrands = false;
      });
    }
  }

  Future<void> _loadCarModels(String brandId) async {
    try {
      setState(() {
        isLoadingModels = true;
      });

      var url = Uri.parse('https://basededatoslinkinp.000webhostapp.com/cargarmodelo.php');
      var params = {'id_marca': brandId};
      var response = await http.post(url, body: params);

      if (response.statusCode == 200) {
        var modelsData = json.decode(response.body);

        carModels = modelsData.map<CarModel>((model) {
          return CarModel(
            id: model['id'],
            nombre: model['nombre'],
            foto: model['foto'],
          );
        }).toList();

        setState(() {
          isLoadingModels = false;
        });
      } else {
        print('Error en loadCarModels: ${response.statusCode}');
        setState(() {
          isLoadingModels = false;
        });
      }
    } catch (e) {
      print('Error en loadCarModels: $e');
      setState(() {
        isLoadingModels = false;
      });
    }
  }

  Widget _buildBrandCarousel() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 150.0,
        aspectRatio: 16 / 9,
        viewportFraction: 0.6,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: _autoPlay,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
      ),
      items: carouselItems.map((item) {
        return Builder(
          builder: (BuildContext context) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedBrandIndex = carouselItems.indexOf(item);
                  selectedModelIndex = -1;
                  _autoPlay = false;
                });

                _loadCarModels(item.id);
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.5,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  color: selectedBrandIndex == carouselItems.indexOf(item)
                      ? Colors.black.withOpacity(0.33)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      item.foto,
                      height: 80.0,
                      width: 80.0,
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      item.nombre,
                      style: TextStyle(
                        fontFamily: 'system-ui',
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0,
                        color: selectedBrandIndex == carouselItems.indexOf(item)
                            ? Colors.yellow
                            : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }

  Widget _buildModelList() {
    return isLoadingModels
        ? Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
            ),
          )
        : ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: carModels.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedModelIndex = index;
                  });
                },
                child: Container(
                  color: selectedModelIndex == index ? Colors.black.withOpacity(0.33) : Colors.transparent,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          Image.network(
                            carModels[index].foto,
                            height: 80.0,
                            width: 80.0,
                          ),
                          SizedBox(width: 16.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                carModels[index].nombre,
                                style: TextStyle(
                                  fontFamily: 'system-ui',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                  color: selectedModelIndex == index ? Colors.yellow : Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Divider(),
                    ],
                  ),
                ),
              );
            },
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildBrandCarousel(),
                  _buildModelList(),
                ],
              ),
            ),
          ),
        ],
      ),
      appBar: AppBar(
        title: AnimatedSwitcher(
          duration: Duration(milliseconds: 500),
          child: selectedModelIndex != -1
              ? SizedBox.shrink()
              : selectedBrandIndex != -1
                  ? Text(
                      'Selecciona tu modelo',
                      style: TextStyle(
                        fontFamily: 'system-ui',
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : Text(
                      'Selecciona tu vehículo',
                      style: TextStyle(
                        fontFamily: 'system-ui',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
        ),
        centerTitle: true,
        actions: [
          if (selectedModelIndex != -1)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  if (selectedBrandIndex != -1 && selectedModelIndex != -1) {
                    final selectedBrandId = carouselItems[selectedBrandIndex].id;
                    final selectedModelId = carModels[selectedModelIndex].id;

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegisterPatenteView(
                          userId: widget.userId,
                          selectedBrandId: selectedBrandId,
                          selectedModelId: selectedModelId,
                        ),
                      ),
                    );
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(30.0),
                    border: Border.all(color: Colors.black),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: Center(
                    child: Text(
                      'Registrar mi vehículo',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
