import 'package:flutter/material.dart';
import 'package:onepiece/src/widgets/search_bottom_sheet.dart';

class HeaderWidget extends StatelessWidget {
 const HeaderWidget({super.key});

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
          _buildHeaderText(),
          _buildActionButtos(context,)
        ],
      ),
    );
  }

  Column _buildHeaderText() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("One Piece",style: _titleTextStyle()),
        Text("Serie",style: _subtitleTextStyle())
      ],
    );
  }

  TextStyle _titleTextStyle(){
    return const TextStyle(fontWeight: FontWeight.bold, 
      color: Colors.white,fontSize: 26);
  }

  TextStyle _subtitleTextStyle(){
    return const TextStyle(color: Colors.white,
      fontSize: 17);
  }

  Row _buildActionButtos(BuildContext context) {
    return Row(
      children: [
        _buildIconButton(icon: Icons.search,
        onPressed: () => _showSearchBottomSheet(context),
        ),          
      const SizedBox(width: 10,),
      _buildIconButton(icon: Icons.notifications, 
      onPressed: (){}
        )
      ],
    );
  }

  Container _buildIconButton({required IconData icon, required VoidCallback onPressed}){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.black.withOpacity(.1)
      ),
    child: IconButton(
      onPressed: onPressed,
      icon: Icon(icon, size: 28, color: Colors.white)),
    );
  }

  void _showSearchBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) => SearchBottomSheet(),
    );
  }

}