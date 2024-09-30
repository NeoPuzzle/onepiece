import 'package:flutter/material.dart';
import 'package:onepiece/src/model/character.model.dart';

class WantedPosterDialog extends StatelessWidget {

  final OnePieceCharacter character;

  const WantedPosterDialog({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
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
}