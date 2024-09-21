import 'package:flutter/material.dart';
import 'package:onepiece/src/pages/detail_page.dart';


class ListCharacters extends StatefulWidget {
  const ListCharacters({super.key});

  @override
  State<ListCharacters> createState() => _ListCharactersState();
}

class _ListCharactersState extends State<ListCharacters> {
  double widthScreen =0;
  final titleStyleText = const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white);
  @override
  Widget build(BuildContext context) {
    widthScreen=MediaQuery.of(context).size.width-50;
    return Expanded(
      child: ListView(
        padding: const EdgeInsets.all(25),
        children: [
          Text("Portadas", style: titleStyleText,),
          const SizedBox(height: 15,),
          Row(
            children: [
              blocksBackground("p1.jpeg", "Titulo", "2018"),
              SizedBox(
                width: widthScreen*0.03,
              ),
              blocksBackground("p2.jpg", "Titulo", "2022"),
              SizedBox(
                width: widthScreen*0.03,
              ),
              blocksBackground("p3.jpg", "Titulo", "2024"),
              
            ],
          ),
          const Divider(
            thickness: 1,
            color: Color.fromARGB(255, 62, 62, 62),
          ),
          const SizedBox(height: 20),
          blockCharacters("Luffy", 0xffd5a308, "o1"),
          blockCharacters("Brook", 0xff674ea7, "o2"),
          blockCharacters("Ace", 0xffd77106, "o3"),
          blockCharacters("Hancock", 0xffea9999, "o4"),
          blockCharacters("Robin", 0xff134f5c, "o5"),
          blockCharacters("Sanji", 0xffffd966, "o6"),
        ],
      ),
    );
  }
  Widget blocksBackground (String image, String title, String subtitle) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: Image.asset("assets/$image", 
          width: widthScreen*.31,
          height: 110,
          fit: BoxFit.cover,),
          
        ),
        const SizedBox(
            height: 15,
          ),
          RichText(text: TextSpan(
            text: title, style: const TextStyle(color: Colors.white70, fontSize: 14),
            children: [
              TextSpan(
                text: subtitle, style: const TextStyle(color: Colors.grey,fontWeight: FontWeight.w300, fontSize: 12)
              )
            ]
          ))
      ],
    );
  }

  Widget blockCharacters(String name, int color, String image) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailingPage(color: color, image: "assets/$image.png", name: name,)));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color.fromARGB(66, 68, 64, 64)
        ),
        height: 65,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 8,
                        offset: const Offset(-0, 5),
                        spreadRadius: 0,
                        blurStyle: BlurStyle.normal,
                        color: Color(color)
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20)
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Hero(tag: color,child: Image.asset("assets/$image.png")),
                ),
                const SizedBox(width: 12,),
                Text(name, style: const TextStyle(color: Colors.white, fontSize: 16),)
              ],        
            ),
            IconButton(onPressed: (){}, 
            icon: const Icon(Icons.more_vert_rounded, color: Colors.grey,))
          ],
        ),
      ),
    );
  }

}