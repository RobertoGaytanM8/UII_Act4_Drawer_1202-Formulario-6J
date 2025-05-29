import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.2,
        title: Text("Roberto Gaytan"),
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
                leading: Icon(Icons.home, color: const Color.fromARGB(255, 0, 185, 161)),
                title: Text("Pagina Principal"),
              ),
            ),
          ],
        ),
      ),
      
    );
  }
}