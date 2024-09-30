import 'package:flutter/material.dart';
import 'package:onepiece/src/api/api.service.dart';
import 'package:onepiece/src/model/character.model.dart';
import 'package:onepiece/src/widgets/wanted_poster_dialog.dart';


class SearchBottomSheet extends StatefulWidget {

  const SearchBottomSheet({super.key});

  @override
  State<SearchBottomSheet> createState() => _SearchBottomSheetState();
}

class _SearchBottomSheetState extends State<SearchBottomSheet> {
  final TextEditingController _controller = TextEditingController();

  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.brown[100],
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            ),
            height: MediaQuery.of(context).size.height * 0.5,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text("Buscar", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                _buildSearchTextField(),                
                const SizedBox(height: 20,),
                _buildSearchButtons(context),
              ],
            ),
          ),
    );
  }

  TextField _buildSearchTextField() {
  return TextField(
    controller: _controller,
    decoration: InputDecoration(hintText: "Ingresa el nombre",
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Colors.brown)
        ),
      ),
    );
  }

  Row _buildSearchButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          child: const Text("Buscar"),
          onPressed: () => _onSearchPressed(context),
        ),
        TextButton(
          child: const Text("Cancelar"),
          onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      );
    }

  void _onSearchPressed(BuildContext context) {
    String searchTerm = _controller.text.trim();
    if (searchTerm.isNotEmpty) {
      // Navigator.of(context).pop();
      _searchByName(searchTerm, context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Por favor, ingresa un nombre.")),
      );
    }
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
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return WantedPosterDialog(character: results.first);
      },
    );
  }
}




  