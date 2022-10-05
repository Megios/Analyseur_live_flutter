import 'dart:ui';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
// Variable :
  String motSaisi = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Analyseur"),
        ),
        body:
            // const Center(
            //     child: Text(
            //   "Je vais analysez un mot",
            //   style: TextStyle(
            //       fontFamily: 'Pacifico', fontSize: 20.0, color: Colors.red),
            // )),
            Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                // configuration du l'apparence
                style: const TextStyle(fontFamily: 'Pacifico'),
                decoration: InputDecoration(
                    // hint text _ équivaux a placehorder
                    hintText: 'Entrez votre mot à analysez',
                    // border pour spécifier la bordure de notre champs de saisie
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
                // configuration du comportement
                onChanged: (newValue) {
                  setState(() {
                    motSaisi = newValue;
                  });
                },
              ),
            ),
            //on veut afficher le text que si quelque chose a été saisi
            motSaisi.isNotEmpty
                ? Text(
                    "Vous voulez analysez : $motSaisi ?",
                    style: const TextStyle(fontFamily: 'Pacifico'),
                  )
                : const Text("")
          ],
        ));
  }
}
