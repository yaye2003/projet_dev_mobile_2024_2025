import 'package:flutter/material.dart';
import 'main_page.dart'; // Pour ContainerDetailPage

/// Texte des containers
final List<String> containerTexts = [
  "Dakar",
  "Diourbel",
  "Fatick",
  "Kaffrine",
  "Kaolack",
  "Kédougou",
  "Kolda",
  "Louga",
  "Matam",
  "Saint-Louis",
  "Sédhiou",
  "Tambacounda",
  "Thiès",
  "Ziguinchor",
];

/// Chemins des images correspondantes
final List<String> containerImages = [
  "images/dakar.png",
  "images/diourbel.jfif",
  "images/fatick.jfif",
  "images/kaffrine.jfif",
  "images/kaolack.jfif",
  "images/kedougou.jfif",
  "images/kolda.jfif",
  "images/louga.jfif",
  "images/matam.png",
  "images/saintlouis.jfif",
  "images/sedhiou.jfif",
  "images/tambacounda.jfif",
  "images/thies.jfif",
  "images/ziguinchor.png",
];

/// Génère une liste de containers cliquables
List<Widget> buildContainers(BuildContext context) {
  return List.generate(containerTexts.length, (index) {
    return buildOneContainer(context, containerTexts[index], containerImages[index]);
  });
}

/// Un seul container avec image et texte
Widget buildOneContainer(BuildContext context, String texte, String imagePath) {
  return InkWell(
    borderRadius: BorderRadius.circular(12),
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ContainerDetailPage(texte: texte),
        ),
      );
    },
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        alignment: Alignment.bottomCenter,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.3),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          texte,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    ),
  );
}
