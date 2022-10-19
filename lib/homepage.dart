import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_live_appplication_analyse/RowVoyelle.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Définition d'un controller qui va observer l'évolution de notre champs de saisi
  late TextEditingController saisiController;

  //On va initialiser notre controleur dans le initState
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //instancier le controler - réserve l'espace mémoire
    saisiController = TextEditingController();
    saisiController.addListener(_ecouteurText);
  }

  //définition de notre fonction d'écoute
  void _ecouteurText() {
    //on passe ici quand on va saisir du text
    print("Passage dans l'écouteur");
    setState(() {
      motSaisi = saisiController.text;
    });
  }

  void _incremente(String i) {
    // correction : setState sur toutes la fonction mais semblerait que ce soit non nécéssaire
    int? valeur = voyelleDico[i];
    valeur = valeur! + 1; //le point va devaller la variable
    voyelleDico[i] = valeur;
  }

  void _analyserMot() {
    _resetDico();
    print("analyse lancer");
    //la stratégie : parcourir notre chaine de caractère, caractère par caractère
    //on va dans le bon cas : switch
    for (var i = 0; i < motSaisi.length; i++) {
      switch (motSaisi[i].toLowerCase()) {
        case 'a':
          _incremente('a');
          break;
        case 'e':
          _incremente('e');
          break;
        case 'i':
          _incremente('i');
          break;
        case 'u':
          _incremente('u');
          break;
        case 'o':
          _incremente('o');
          break;
        case 'y':
          _incremente('y');
          break;
        case ' ':
          null;
          break;
        default:
          nbConsonnes = nbConsonnes + 1;
          break;
      }
    }
    print(voyelleDico);
    print(nbConsonnes);
  }

  //défition de notre map ayant pour clé un string (notre voyelle) et une valeur : entier (le nombre d'occurences)
  Map<String, int> voyelleDico = {
    'a': 0,
    'e': 0,
    'i': 0,
    'o': 0,
    'u': 0,
    'y': 0
  };
  int nbConsonnes = 0;
  // reset : remise à zero de notre map
  void _resetDico() {
    nbConsonnes = 0;
    setState(() {
      voyelleDico.forEach((key, value) {
        voyelleDico[key] = 0;
      });
    });
  }

  // Variable :
  String motSaisi = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //drawer : va permettre de mettre un menu dans l'application
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                  decoration: const BoxDecoration(color: Colors.blue),
                  child: Column(
                    children: const [
                      Text("Menu",
                          style: TextStyle(
                              fontFamily: "Pacifico",
                              fontSize: 20,
                              color: Colors.white)),
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: CircleAvatar(
                            backgroundImage: AssetImage("images/abc.png")),
                      )
                    ],
                  )),
              // On définit une tuile qui va être un onglet du menu
              ListTile(
                title: Row(
                  children: const [
                    Icon(
                      Icons.abc_outlined,
                      color: Colors.black,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        "Analysez",
                        style: TextStyle(fontFamily: "Pacifico"),
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                title: Row(
                  children: const [
                    Icon(Icons.book_outlined, color: Colors.black),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        "Historique",
                        style: TextStyle(fontFamily: "Pacifico"),
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                title: Row(
                  children: const [
                    Icon(
                      Icons.info_outline_rounded,
                      color: Colors.black,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        "A propos",
                        style: TextStyle(fontFamily: "Pacifico"),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
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
                //premiere methode pour controler le champs de saisie
                /*onChanged: (newValue) {
                  setState(() {
                    motSaisi = newValue;
                  });
                },*/
                //2eme méthode
                controller: saisiController,
              ),
            ),
            //on veut afficher le text que si quelque chose a été saisi
            motSaisi.isNotEmpty
                ? Text(
                    "Vous voulez analysez : $motSaisi ?",
                    style: const TextStyle(fontFamily: 'Pacifico'),
                  )
                : const Text(""),
            // _analyserMot ( fonction qui va analyser le mot)
            ElevatedButton(
                onPressed: _analyserMot,
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.all(15))),
                child: const Text(
                  "analyser",
                  style: TextStyle(fontFamily: "Pacifico", fontSize: 20),
                )),
            RowVoyelle(
                letter: 'a',
                color: Colors.red,
                textOccurences: '${voyelleDico["a"]} occurences'),
            RowVoyelle(
                letter: 'e',
                color: Colors.blue,
                textOccurences: '${voyelleDico["e"]} occurences'),
            RowVoyelle(
                letter: 'i',
                color: Colors.yellow,
                textOccurences: '${voyelleDico["i"]} occurences'),
            RowVoyelle(
                letter: 'u',
                color: Colors.green,
                textOccurences: '${voyelleDico["u"]} occurences'),
            RowVoyelle(
                letter: 'o',
                color: Colors.grey,
                textOccurences: '${voyelleDico["o"]} occurences'),
            RowVoyelle(
                letter: 'y',
                color: Colors.pink,
                textOccurences: '${voyelleDico["y"]} occurences'),
          ],
        ));
  }
}
