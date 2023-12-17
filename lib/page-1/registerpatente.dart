import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/page-1/homereal.dart';

class RegisterPatenteView extends StatefulWidget {
  final String selectedBrandId;
  final String selectedModelId;
  final int userId;

  RegisterPatenteView({
    required this.selectedBrandId,
    required this.selectedModelId,
    required this.userId,
  });

  @override
  _RegisterPatenteViewState createState() => _RegisterPatenteViewState();
}

class _RegisterPatenteViewState extends State<RegisterPatenteView> {
  String selectedModeloPatente = 'Modelo viejo';
  String selectedImagePath = 'assets/patentevieja.jpg';
  TextEditingController patenteController = TextEditingController();
  String? patenteError;

  String getHintText() {
    return (selectedModeloPatente == 'Modelo viejo') ? 'Ej. ABC123' : 'Ej. AB123CD';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          'Ingresa tu patente',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.grey[200],
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 20.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      selectedImagePath,
                      height: 100.0,
                      width: 200.0,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
                DropdownButton<String>(
                  value: selectedModeloPatente,
                  items: ['Modelo viejo', 'Modelo nuevo']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      setState(() {
                        selectedModeloPatente = newValue;
                        selectedImagePath = (newValue == 'Modelo viejo')
                            ? 'assets/patentevieja.jpg'
                            : 'assets/patentenueva.jpg';
                        patenteController.clear();
                        clearPatenteError();
                      });
                    }
                  },
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                  ),
                  dropdownColor: Colors.white,
                  icon: Icon(Icons.arrow_drop_down, color: Colors.black),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  controller: patenteController,
                  decoration: InputDecoration(
                    labelText: 'Ingrese su patente',
                    hintText: getHintText(),
                    errorText: patenteError,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                  ),
                  onChanged: (value) {
                    value = value.replaceAll(' ', '').toUpperCase();
                    if (selectedModeloPatente == 'Modelo viejo') {
                      formatPatenteVieja(value);
                    } else {
                      formatPatenteNueva(value);
                    }
                  },
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    if (validatePatente()) {
                      registerVehicle().then((response) {
                        if (response == "Registro exitoso") {
                          showSuccessDialogAndNavigateToHome();
                        } else {
                          showErrorDialog(response);
                        }
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.amber,
                    onPrimary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                  ),
                  child: Text(
                    'Registrar patente',
                    style: TextStyle(
                      fontSize: 19.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void formatPatenteVieja(String value) {
    if (value.length == 6) {
      patenteController.text = '${value.substring(0, 3)} ${value.substring(3)}';
      clearPatenteError();
    } else {
      setPatenteError('Formato incorrecto');
    }
  }

  void formatPatenteNueva(String value) {
    if (value.length == 7) {
      patenteController.text =
          '${value.substring(0, 2)} ${value.substring(2, 5)} ${value.substring(5)}';
      clearPatenteError();
    } else {
      setPatenteError('Formato incorrecto');
    }
  }

  bool validatePatente() {
    if (patenteController.text.trim().isEmpty) {
      setPatenteError('Ingrese su patente');
      return false;
    }

    return patenteError == null;
  }

  void setPatenteError(String error) {
    setState(() {
      patenteError = error;
    });
  }

  void clearPatenteError() {
    setState(() {
      patenteError = null;
    });
  }

  Future<String> registerVehicle() async {
    final url = 'https://TU_DOMINIO/crearvehiculo.php';
    final response = await http.post(
      Uri.parse(url),
      body: {
        'userId': widget.userId.toString(),
        'marcaId': widget.selectedBrandId,
        'modeloId': widget.selectedModelId,
        'tipoPatente': selectedModeloPatente,
        'patente': patenteController.text,
      },
    );

    return response.body;
  }

  void showSuccessDialogAndNavigateToHome() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Éxito"),
          content: Text(
            "Tu primer vehículo ha sido creado exitosamente. Puedes saber más en Cuenta/Mis vehículos. Gracias por formar parte de LinkingParking.",
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (BuildContext context) => HomePage(userId: widget.userId),
                  ),
                );
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  void showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Error"),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }
}
