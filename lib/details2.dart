import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  final List<Map<String, String>> cages;

  const Details({Key? key, required this.cages, required List<Map<String, String>> products}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  late List<Map<String, String>> _localCages;

  final Color baseColor = Color.fromARGB(255, 123, 255, 226);
  final Color darkTurquoise = Color.fromARGB(255, 0, 172, 153);
  final Color lightTurquoise = Color.fromARGB(255, 188, 255, 246);

  @override
  void initState() {
    super.initState();
    _localCages = List<Map<String, String>>.from(widget.cages);
  }

  void _removeCage(int index) {
    final removedItem = _localCages[index];
    _localCages.removeAt(index);
    _listKey.currentState?.removeItem(
      index,
      (context, animation) => _buildRemovedItem(removedItem, animation),
      duration: const Duration(milliseconds: 400),
    );
  }

  Widget _buildRemovedItem(Map<String, String> cage, Animation<double> animation) {
    return FadeTransition(
      opacity: animation,
      child: SlideTransition(
        position: Tween<Offset>(begin: Offset.zero, end: Offset(1.0, 0.0)).animate(animation),
        child: ListTile(
          leading: Icon(Icons.cabin, color: Colors.grey.shade400),
          title: Text(
            cage["id"] ?? "",
            style: TextStyle(color: darkTurquoise, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            _buildDescription(cage),
            style: TextStyle(color: darkTurquoise.withOpacity(0.7)),
          ),
        ),
      ),
    );
  }

  String _buildDescription(Map<String, String> cage) {
    return "Tipo: ${cage["tipo"] ?? "-"}\n"
        "Capacidad: ${cage["capacidad"] ?? "-"}\n"
        "Candado: ${cage["candado"] ?? "-"}\n"
        "Tamaño: ${cage["tamaño"] ?? "-"}\n"
        "Comida: ${cage["comida"] ?? "-"}\n"
        "Agua: ${cage["agua"] ?? "-"}";
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, _localCages);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: baseColor,
          centerTitle: true,
          title: Text("Tabla Jaulas", style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold)),
          leading: IconButton(
            onPressed: () => Navigator.pop(context, _localCages),
            icon: Icon(Icons.arrow_back, color: darkTurquoise),
          ),
        ),
        body: AnimatedList(
          key: _listKey,
          initialItemCount: _localCages.length,
          padding: const EdgeInsets.all(8.0),
          itemBuilder: (context, index, animation) {
            final cage = _localCages[index];
            return SizeTransition(
              sizeFactor: animation,
              child: Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1.0, color: lightTurquoise),
                  borderRadius: BorderRadius.circular(8),
                ),
                margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
                child: ListTile(
                  leading: Icon(Icons.cabin, color: darkTurquoise),
                  title: Text(
                    cage["id"] ?? "",
                    style: TextStyle(fontWeight: FontWeight.bold, color: darkTurquoise, fontSize: 18),
                  ),
                  subtitle: Text(
                    _buildDescription(cage),
                    style: TextStyle(color: darkTurquoise.withOpacity(0.8)),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete_forever, color: Colors.redAccent.shade400),
                    onPressed: () => _removeCage(index),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
