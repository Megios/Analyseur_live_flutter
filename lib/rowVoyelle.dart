import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class RowVoyelle extends StatelessWidget {
  const RowVoyelle(
      {super.key,
      required this.letter,
      required this.color,
      required this.textOccurences});
  final String letter;
  final Color color;
  final String textOccurences;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        height: 65,
        decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        width: MediaQuery.of(context).size.width -
            20, //on recupere la largeur de l'écran et on lui reduit 20px
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "$letter :",
                style: const TextStyle(
                    fontFamily: 'Pacifico', color: Colors.white, fontSize: 18),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  textOccurences,
                  style: const TextStyle(
                      fontFamily: 'Pacifico',
                      color: Colors.white,
                      fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
