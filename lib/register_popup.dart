import 'package:flutter/material.dart';
import 'package:projet_flutter/main_page.dart';

class RegisterPopup extends StatefulWidget {
  const RegisterPopup({super.key});

  @override
  State<RegisterPopup> createState() => _RegisterPopupState();
}

class _RegisterPopupState extends State<RegisterPopup> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String? userType;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Créer un compte"),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(labelText: "Nom"),
                validator: (v) =>
                    v == null || v.isEmpty ? "Champ requis" : null,
              ),
              const SizedBox(height: 10),

              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(labelText: "Email"),
                validator: (v) =>
                    v == null || !v.contains('@') ? "Email invalide" : null,
              ),
              const SizedBox(height: 10),

              // ✅ Liste déroulante
              DropdownButtonFormField<String>(
                decoration:
                    const InputDecoration(labelText: "Type d'utilisateur"),
                value: userType,
                items: const [
                  DropdownMenuItem(
                      value: "Agriculteur", child: Text("Agriculteur")),
                  DropdownMenuItem(
                      value: "Conseiller", child: Text("Conseiller")),
                  DropdownMenuItem(
                      value: "Technicien", child: Text("Technicien")),
                  DropdownMenuItem(
                      value: "Chercheur", child: Text("Chercheur")),
                ],
                onChanged: (v) => setState(() => userType = v),
                validator: (v) =>
                    v == null ? "Veuillez sélectionner un type" : null,
              ),
              const SizedBox(height: 10),

              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(labelText: "Mot de passe"),
                obscureText: true,
                validator: (v) =>
                    v == null || v.length < 6 ? "Min 6 caractères" : null,
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Annuler"),
        ),
        ElevatedButton(
          onPressed: isLoading
              ? null
              : () async {
                  if (_formKey.currentState!.validate()) {
                    setState(() => isLoading = true);
                    await Future.delayed(const Duration(seconds: 1));
                    setState(() => isLoading = false);

                    Navigator.pop(context);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const MainPage(),
                      ),
                    );
                  }
                },
          child: isLoading
              ? const CircularProgressIndicator(strokeWidth: 2)
              : const Text("Créer"),
        ),
      ],
    );
  }
}
