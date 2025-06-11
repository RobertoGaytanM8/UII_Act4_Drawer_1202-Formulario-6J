import 'package:flutter/material.dart';
import 'package:myapp/details2.dart';

class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key: key);

  @override
  State<MyForm> createState() => _MyFormState();
}


class _MyFormState extends State<MyForm> {
  final _productController = TextEditingController();
  final _productDesController = TextEditingController();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _tipoController = TextEditingController();
  final TextEditingController _capacidadController = TextEditingController();
  final TextEditingController _candadoController = TextEditingController();
  final TextEditingController _tamanoController = TextEditingController();
  final TextEditingController _comidaController = TextEditingController();
  final TextEditingController _aguaController = TextEditingController();

  final List<Map<String, String>> _cages = [];

  final Color baseColor = const Color.fromARGB(255, 123, 255, 226);
  final Color darkTurquoise = const Color.fromARGB(255, 0, 172, 153);
  final Color textColor = const Color.fromARGB(255, 10, 70, 62);

  @override
  void dispose() {
    _idController.dispose();
    _tipoController.dispose();
    _capacidadController.dispose();
    _candadoController.dispose();
    _tamanoController.dispose();
    _comidaController.dispose();
    _aguaController.dispose();
    super.dispose();
  }

  final List<Map<String, String>> _products = [];


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
        builder: (context) => Details(products: _products, cages: [],),
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
        title: Text("Formulario Jaulas"),
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
            MyTextField(fieldName: "ID", myController: _idController, myIcon: Icons.confirmation_number, labelColor: textColor, borderColor: darkTurquoise, focusedBorderColor: baseColor, prefixIconColor: darkTurquoise),
            const SizedBox(height: 10.0),
            MyTextField(fieldName: "Tipo", myController: _tipoController, myIcon: Icons.category, labelColor: textColor, borderColor: darkTurquoise, focusedBorderColor: baseColor, prefixIconColor: darkTurquoise),
            const SizedBox(height: 10.0),
            MyTextField(fieldName: "Capacidad", myController: _capacidadController, myIcon: Icons.group, labelColor: textColor, borderColor: darkTurquoise, focusedBorderColor: baseColor, prefixIconColor: darkTurquoise),
            const SizedBox(height: 10.0),
            MyTextField(fieldName: "Candado", myController: _candadoController, myIcon: Icons.lock, labelColor: textColor, borderColor: darkTurquoise, focusedBorderColor: baseColor, prefixIconColor: darkTurquoise),
            const SizedBox(height: 10.0),
            MyTextField(fieldName: "Tamaño", myController: _tamanoController, myIcon: Icons.aspect_ratio, labelColor: textColor, borderColor: darkTurquoise, focusedBorderColor: baseColor, prefixIconColor: darkTurquoise),
            const SizedBox(height: 10.0),
            MyTextField(fieldName: "Comida", myController: _comidaController, myIcon: Icons.fastfood, labelColor: textColor, borderColor: darkTurquoise, focusedBorderColor: baseColor, prefixIconColor: darkTurquoise),
            const SizedBox(height: 10.0),
            MyTextField(fieldName: "Agua", myController: _aguaController, myIcon: Icons.water_drop, labelColor: textColor, borderColor: darkTurquoise, focusedBorderColor: baseColor, prefixIconColor: darkTurquoise),
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
        if (_idController.text.isEmpty || _tipoController.text.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Por favor, complete al menos ID y Tipo")),
          );
          return;
        }

        final newCage = {
          "id": _idController.text,
          "tipo": _tipoController.text,
          "capacidad": _capacidadController.text,
          "candado": _candadoController.text,
          "tamaño": _tamanoController.text,
          "comida": _comidaController.text,
          "agua": _aguaController.text,
        };

        _cages.add(newCage);

        final updatedList = await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Details(cages: _cages, products: [],)),
        );

        if (updatedList != null) {
          setState(() {
            _cages
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
    this.myIcon = Icons.input,
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