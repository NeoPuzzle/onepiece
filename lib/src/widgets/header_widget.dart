import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  final titleTextStyle = const TextStyle(fontWeight: FontWeight.bold, color: Colors.white,
          fontSize: 26);
  final subtitleTextStyle = const TextStyle(color: Colors.white,
          fontSize: 17);

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
                child: IconButton(onPressed: (){},
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
}