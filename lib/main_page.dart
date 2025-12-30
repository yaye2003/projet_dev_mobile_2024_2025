import 'package:flutter/material.dart';
import 'container_item.dart'; // assure-toi que le fichier s'appelle bien container_items.dart

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      setState(() => _isLoading = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// ================= APPBAR AVEC DÉGRADÉ =================
      appBar: AppBar(
        title: const Text(
          "Accueil",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xFF1A0E0A),
                Color(0xFF3E2723),
                Colors.white,
              ],
              stops: [0.0, 0.45, 1.0],
            ),
          ),
        ),
        actions: [
          if (_isLoading)
            const Padding(
              padding: EdgeInsets.only(right: 16),
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                ),
              ),
            ),
        ],
      ),

      /// ================= DRAWER =================
      drawer: Drawer(
        backgroundColor: const Color(0xFF3E2723),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/smart agriculture (4).png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                alignment: Alignment.bottomLeft,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.4),
                ),
                child: const Text(
                  "Menu",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(color: Colors.black, blurRadius: 6)
                    ],
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.add_box, color: Colors.white),
              title: const Text("Nouvelle production",
                  style: TextStyle(color: Colors.white)),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.search, color: Colors.white),
              title: const Text("Recherche",
                  style: TextStyle(color: Colors.white)),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.history, color: Colors.white),
              title: const Text("Historique",
                  style: TextStyle(color: Colors.white)),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.help, color: Colors.white),
              title: const Text("Aide", style: TextStyle(color: Colors.white)),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.account_circle, color: Colors.white),
              title: const Text("Mon compte",
                  style: TextStyle(color: Colors.white)),
              onTap: () {},
            ),
          ],
        ),
      ),

      /// ================= BODY =================
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16),
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                children: buildContainers(context), // <-- passe context ici
              ),
            ),
    );
  }
}

/// ================== PAGE DE DÉTAIL AVEC FORMULAIRE CENTRÉ ==================
class ContainerDetailPage extends StatefulWidget {
  final String texte;
  const ContainerDetailPage({super.key, required this.texte});

  @override
  State<ContainerDetailPage> createState() => _ContainerDetailPageState();
}

class _ContainerDetailPageState extends State<ContainerDetailPage> {
  String? selectedSeed;
  String? selectedSoil;
  String? selectedHumidity;
  String? selectedPH;

  final List<String> seeds = ['Maïs', 'Mil', 'Riz', 'Arachide'];
  final List<String> soils = ['Sableux', 'Argileux', 'Loameux', 'Humifère'];
  final List<String> humidities = ['Faible', 'Moyenne', 'Élevée'];
  final List<String> phValues = ['Acide', 'Neutre', 'Alcalin'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Prédisez pour ${widget.texte}"),
        backgroundColor: Colors.brown,
      ),
      body: Center( // centre le formulaire verticalement et horizontalement
        child: SingleChildScrollView( // permet le scroll si l'écran est petit
          child: Container(
            width: 350, // largeur maximale pour le formulaire
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.brown.shade50.withOpacity(0.3),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Form(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  DropdownButtonFormField<String>(
                    value: selectedSeed,
                    decoration: const InputDecoration(
                      labelText: 'Semences',
                      border: OutlineInputBorder(),
                    ),
                    items: seeds
                        .map((seed) => DropdownMenuItem(
                              value: seed,
                              child: Text(seed),
                            ))
                        .toList(),
                    onChanged: (value) => setState(() => selectedSeed = value),
                  ),
                  const SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    value: selectedSoil,
                    decoration: const InputDecoration(
                      labelText: 'Type de sol',
                      border: OutlineInputBorder(),
                    ),
                    items: soils
                        .map((soil) => DropdownMenuItem(
                              value: soil,
                              child: Text(soil),
                            ))
                        .toList(),
                    onChanged: (value) => setState(() => selectedSoil = value),
                  ),
                  const SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    value: selectedHumidity,
                    decoration: const InputDecoration(
                      labelText: 'Humidité',
                      border: OutlineInputBorder(),
                    ),
                    items: humidities
                        .map((h) => DropdownMenuItem(
                              value: h,
                              child: Text(h),
                            ))
                        .toList(),
                    onChanged: (value) => setState(() => selectedHumidity = value),
                  ),
                  const SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    value: selectedPH,
                    decoration: const InputDecoration(
                      labelText: 'pH',
                      border: OutlineInputBorder(),
                    ),
                    items: phValues
                        .map((ph) => DropdownMenuItem(
                              value: ph,
                              child: Text(ph),
                            ))
                        .toList(),
                    onChanged: (value) => setState(() => selectedPH = value),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      if (selectedSeed != null &&
                          selectedSoil != null &&
                          selectedHumidity != null &&
                          selectedPH != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                'Prédiction pour ${widget.texte} avec $selectedSeed, $selectedSoil, $selectedHumidity, $selectedPH'),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Veuillez remplir tous les champs.'),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text('Soumettre',style: TextStyle(color: Colors.white),),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
