import 'package:flutter/material.dart';
import 'package:onepiece/src/api/api.service.dart';
import 'package:onepiece/src/model/character.model.dart';

class HeaderWidget extends StatelessWidget {
  HeaderWidget({super.key});

  final titleTextStyle = const TextStyle(fontWeight: FontWeight.bold, color: Colors.white,
          fontSize: 26);
  final subtitleTextStyle = const TextStyle(color: Colors.white,
          fontSize: 17);

  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.all(25),
      height: 170,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 41, 40, 39)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("One Piece",
              style: titleTextStyle),
              Text("Serie",
              style: subtitleTextStyle)
            ],
          ),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.black.withOpacity(.1)
                ),
                child: IconButton(onPressed: ()=> _showSearchDialog(context),
                icon: const Icon(Icons.search, size: 28, color: Colors.white)),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.black.withOpacity(.1)
                ),
                child: IconButton(onPressed: (){},
                icon: const Icon(Icons.notifications, size: 28, color: Colors.white)),
              )
            ],
          )
        ],
      ),
    );
  }

  void _showSearchDialog(BuildContext context) {
    final TextEditingController _controller = TextEditingController();

    showDialog(
      context: context, 
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Buscar"),
          content: TextField(
            controller: _controller,
            decoration: const InputDecoration(hintText: "Ingresa el nombre"),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text("Buscar"),
              onPressed: (){
                String searchTerm = _controller.text;
                _searchByName(searchTerm, context);
                },
              ),
            TextButton(
              child: const Text("Cancelar"),
              onPressed: (){
                Navigator.of(context).pop();
                },
              ),
          ],
        );
      });
  }

  void _searchByName(String name, BuildContext context) async {
    if (name.isNotEmpty) {
      try {
        final response = await apiService.fetchCharacterByName(name);
        if (response.isNotEmpty) {
          _showWantedPosterDialog(response, context);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("No se encuentran los resultados")),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al buscar: $e')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Por favor ingresa un nombre')),
        );
    }
  }

  void _showWantedPosterDialog(List<OnePieceCharacter> results, BuildContext context) {

    final character = results.first;

    showDialog(
      context: context, 
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color.fromARGB(255, 206, 161, 64),
          title: const Center(child: Text("WANTED", style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold))),
          content: SizedBox(
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('DEAD OR ALIVE', style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
                Text(character.name ?? 'Desconocido',style: const TextStyle(fontSize: 18)),
                Text("₿${character.bounty ?? 'Sin recompensa'}",style: const TextStyle(fontSize: 18)),
                Text(character.crew?.name ?? 'Sin crew',style: const TextStyle(fontSize: 18)),
                Text(character.fruit?.name ?? 'Sin fruta',style: const TextStyle(fontSize: 18)),
                Text(character.job ?? 'vago',style: const TextStyle(fontSize: 18)),
                Text(character.status ?? 'NN',style: const TextStyle(fontSize: 18)),
                const SizedBox(height: 10),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: (){
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              }, 
              child: const Text("Cerrar")
              )
          ],
        );
      }
    );
  }
}