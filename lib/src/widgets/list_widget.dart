import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:onepiece/src/api/api.service.dart';
import 'package:onepiece/src/model/fruit.model.dart';
import 'package:onepiece/src/pages/detail_page.dart';


class ListCharacters extends StatefulWidget {
  const ListCharacters({super.key});

  @override
  State<ListCharacters> createState() => _ListCharactersState();
}

class _ListCharactersState extends State<ListCharacters> {
  late Future<List<Fruits>> futureFruits;
  double widthScreen =0;
  final titleStyleText = const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white);


  @override
  void initState() {
    super.initState();
    futureFruits = ApiService().fetchFruits();
  }


  @override
  Widget build(BuildContext context) {
    widthScreen=MediaQuery.of(context).size.width-50;
    return Expanded(
      child: FutureBuilder<List<Fruits>>(
        future: futureFruits,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No data available'));
          } else {
            return ListView(
            padding: const EdgeInsets.all(25),
            children: [
              Text("Portadas", style: titleStyleText,),
              const SizedBox(height: 15,),
              CarouselSlider(
                options: CarouselOptions(
                  height: 200,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                  autoPlay: true,
                  viewportFraction: 0.8
                ),
                items:snapshot.data!.map((fruit) {
                return Builder(
                  builder: (BuildContext context) {
                  return Container(
                    width: widthScreen * .8,
                    child: blocksBackground(
                        fruit.filename!, 
                        fruit.name!, 
                        fruit.type!
                        ),
                    );
                },
              );
            }).toList(),
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
        );
        }
        }
      ),
    );
  }
  Widget blocksBackground (String image, String title, String subtitle) {
    bool isValidUrl = Uri.tryParse(image)?.hasScheme ?? false;

    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: isValidUrl
          ? Image.network(
            image, 
            width: widthScreen*.31,
            height: 110,
            fit: BoxFit.fill,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                width: widthScreen * 0.31,
                height: 110,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const Center(
                  child: Icon(Icons.image_not_supported, color: Colors.white,),
                ),
              );
            },
          )
          : Container(
            width: widthScreen * 0.31,
            height: 110,
            decoration: BoxDecoration(
              color: Colors.grey,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const Center(
                  child: Icon(Icons.image_not_supported, color: Colors.white,),
                ),
              ),
        ),
        const SizedBox(
            height: 15,
          ),
          RichText(text: TextSpan(
            text: title, style: const TextStyle(color: Colors.white70, fontSize: 14),
            children: [
              TextSpan(
                text: ': $subtitle', style: const TextStyle(color: Colors.grey,fontWeight: FontWeight.w300, fontSize: 12)
              ),
            ],
          ),
        ),
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