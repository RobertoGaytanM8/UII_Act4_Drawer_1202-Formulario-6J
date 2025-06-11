import 'package:flutter/material.dart';
import 'package:myapp/details.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _MyFormState();
}


class _MyFormState extends State<HomePage> {
  final _productController = TextEditingController();
  final _productDesController = TextEditingController();
  final TextEditingController _codigoController = TextEditingController();
  final TextEditingController _razaController = TextEditingController();
  final TextEditingController _edadController = TextEditingController();
  final TextEditingController _comportamientoController = TextEditingController();
  final TextEditingController _vacunasController = TextEditingController();
  final TextEditingController _sexoController = TextEditingController();

  final List<Map<String, String>> _products = [];

  final Color baseColor = const Color.fromARGB(255, 123, 255, 226);
  final Color darkTurquoise = const Color.fromARGB(255, 0, 172, 153);
  final Color textColor = const Color.fromARGB(255, 10, 70, 62);

  @override
  void dispose() {
    _codigoController.dispose();
    _razaController.dispose();
    _edadController.dispose();
    _comportamientoController.dispose();
    _vacunasController.dispose();
    _sexoController.dispose();
    super.dispose();
  }


  

  @override


  void _saveAndNavigate(BuildContext context) {
    if (_productController.text.isNotEmpty &&
        _productDesController.text.isNotEmpty) {
      setState(() {
        _products.add({
          "name": _productController.text,
          "description": _productDesController.text,
        });
        _productController.clear();
        _productDesController.clear();
      });
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Details(products: _products),
      ),
    ).then((updatedProducts) {
      if (updatedProducts != null && updatedProducts is List<Map<String, String>>) {
        setState(() {
          _products
            ..clear()
            ..addAll(updatedProducts);
        });
      }
    });
  }

  @override
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.2,
        title: Text("Formulario Perros"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 9, 199, 174),
        actions: <Widget>[
          InkWell(
            onTap: null,
            child: new IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ), onPressed: () {  },
            ),
          ),
          InkWell(
            onTap: null,
            child: new IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.white,
              ), onPressed: () {  },
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: const Color.fromARGB(255, 0, 131, 131)),
              accountName: Text("Roberto Gaytan No. 1202"),
              accountEmail: Text("a.22308051281202@cbtis128.edu.mx"),
              currentAccountPicture: GestureDetector(
                child: CircleAvatar(radius: 130,
            backgroundColor: Colors.red,
            child: CircleAvatar(
              radius: 120,
              backgroundImage: NetworkImage(
                  'https://raw.githubusercontent.com/RobertoGaytanM8/imagenes-ios/refs/heads/main/elperrillo.jpg'),
    
                  ),),
              ),
            ),
             InkWell(
              onTap: (){},
              child: ListTile(
                onTap: (){Navigator.popAndPushNamed(context, "/home");},
                leading: Icon(Icons.pets, color: const Color.fromARGB(255, 0, 185, 161)),
                title: Text("Tabla Perros"),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                onTap: (){Navigator.popAndPushNamed(context, "/tablas");},
                leading: Icon(Icons.grid_on, color: const Color.fromARGB(255, 0, 185, 161)),
                title: Text("Tabla Jaulas"),
              ),
            ),
          ],
        ),
      ),
        body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            MyTextField(
              myController: _codigoController,
              fieldName: "Código",
              myIcon: Icons.qr_code,
              prefixIconColor: darkTurquoise,
              borderColor: darkTurquoise,
              focusedBorderColor: baseColor,
              labelColor: textColor,
            ),
            const SizedBox(height: 10.0),
            MyTextField(
              myController: _razaController,
              fieldName: "Raza",
              myIcon: Icons.pets,
              prefixIconColor: darkTurquoise,
              borderColor: darkTurquoise,
              focusedBorderColor: baseColor,
              labelColor: textColor,
            ),
            const SizedBox(height: 10.0),
            MyTextField(
              myController: _edadController,
              fieldName: "Edad",
              myIcon: Icons.cake,
              prefixIconColor: darkTurquoise,
              borderColor: darkTurquoise,
              focusedBorderColor: baseColor,
              labelColor: textColor,
            ),
            const SizedBox(height: 10.0),
            MyTextField(
              myController: _comportamientoController,
              fieldName: "Comportamiento",
              myIcon: Icons.psychology,
              prefixIconColor: darkTurquoise,
              borderColor: darkTurquoise,
              focusedBorderColor: baseColor,
              labelColor: textColor,
            ),
            const SizedBox(height: 10.0),
            MyTextField(
              myController: _vacunasController,
              fieldName: "Vacunas",
              myIcon: Icons.health_and_safety,
              prefixIconColor: darkTurquoise,
              borderColor: darkTurquoise,
              focusedBorderColor: baseColor,
              labelColor: textColor,
            ),
            const SizedBox(height: 10.0),
            MyTextField(
              myController: _sexoController,
              fieldName: "Sexo",
              myIcon: Icons.wc,
              prefixIconColor: darkTurquoise,
              borderColor: darkTurquoise,
              focusedBorderColor: baseColor,
              labelColor: textColor,
            ),
            const SizedBox(height: 20.0),
            myBtn(context),
          ],
        ),
      ),
    );
  }

  OutlinedButton myBtn(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(200, 50),
        side: BorderSide(color: darkTurquoise, width: 2),
      ),
      onPressed: () async {
        if (_codigoController.text.isEmpty || _razaController.text.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Por favor, complete al menos Código y Raza")),
          );
          return;
        }

        final newProduct = {
          "Codigo": _codigoController.text,
          "Raza": _razaController.text,
          "Edad": _edadController.text,
          "Comportamiento": _comportamientoController.text,
          "Vacunas": _vacunasController.text,
          "Sexo": _sexoController.text,
        };

        _products.add(newProduct);

        final updatedList = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Details(products: _products),
          ),
        );

        if (updatedList != null) {
          setState(() {
            _products
              ..clear()
              ..addAll(List<Map<String, String>>.from(updatedList));
          });
        }
      },
      child: Text(
        "Enviar".toUpperCase(),
        style: TextStyle(fontWeight: FontWeight.bold, color: darkTurquoise),
      ),
    );
  }
}

class MyTextField extends StatelessWidget {
  final TextEditingController myController;
  final String fieldName;
  final IconData myIcon;
  final Color prefixIconColor;
  final Color borderColor;
  final Color focusedBorderColor;
  final Color labelColor;

  const MyTextField({
    Key? key,
    required this.fieldName,
    required this.myController,
    this.myIcon = Icons.verified_user_outlined,
    this.prefixIconColor = Colors.blueAccent,
    this.borderColor = Colors.blueAccent,
    this.focusedBorderColor = Colors.blue,
    this.labelColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: myController,
      decoration: InputDecoration(
        labelText: fieldName,
        prefixIcon: Icon(myIcon, color: prefixIconColor),
        border: OutlineInputBorder(borderSide: BorderSide(color: borderColor)),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: borderColor)),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: focusedBorderColor, width: 2)),
        labelStyle: TextStyle(color: labelColor),
      ),
      style: TextStyle(color: labelColor),
    );
  }
}