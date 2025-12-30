import 'package:flutter/material.dart';

class ContainerDetailPage extends StatelessWidget {
  final int containerNumber;

  const ContainerDetailPage({super.key, required this.containerNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Détails du container $containerNumber'),
        backgroundColor: Colors.brown.shade700,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.widgets,
              size: 80,
              color: Colors.brown.shade700,
            ),
            const SizedBox(height: 20),
            Text(
              'Vous avez cliqué sur le Container $containerNumber',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // revenir en arrière
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown.shade700,
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                'Retour',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
