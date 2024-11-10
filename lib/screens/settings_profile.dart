import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

class SettingsProfile extends StatefulWidget {
  const SettingsProfile({super.key});

  @override
  _SettingsProfileState createState() => _SettingsProfileState();
}

class _SettingsProfileState extends State<SettingsProfile> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _isLoading = false;
  User? get user => _auth.currentUser;
  String? _specialty;

  @override
  void initState() {
    super.initState();
    _loadSpecialty();
  }

  Future<void> _loadSpecialty() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _specialty = prefs.getString('specialty');
    });
  }

  String _getSpecialtyLabel(String value) {
    final Map<String, String> specialties = {
      'clinico': 'Clínico Geral',
      'ortodontista': 'Ortodontista',
      'endodontista': 'Endodontista',
      'pediatra': 'Odontopediatra',
      'cirurgiao': 'Cirurgião',
      'protesista': 'Protesista',
      'periodontista': 'Periodontista',
    };
    return specialties[value] ?? 'Não definida';
  }

  void _changeProfilePicture() {
    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Escolher da Galeria'),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.gallery);
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Tirar Foto'),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.camera);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();

    try {
      final XFile? image = await picker.pickImage(source: source);
      if (image == null) return;

      setState(() => _isLoading = true);

      final storageRef = FirebaseStorage.instance
          .ref()
          .child('profile_images')
          .child('${user?.uid ?? ''}.jpg');

      await storageRef.putFile(File(image.path));
      final photoURL = await storageRef.getDownloadURL();

      await user?.updatePhotoURL(photoURL);

      setState(() => _isLoading = false);

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Foto atualizada com sucesso!')),
        );
      }
    } catch (e) {
      setState(() => _isLoading = false);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao atualizar foto: ${e.toString()}')),
        );
      }
    }
  }

  void _editDisplayName() {
    final TextEditingController nameController = TextEditingController(
      text: user?.displayName ?? '',
    );
    final theme = Theme.of(context);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Editar Nome',
          style: TextStyle(
            color: theme.brightness == Brightness.dark
                ? Colors.white
                : Colors.black,
          ),
        ),
        content: TextField(
          controller: nameController,
          style: TextStyle(
            color: theme.brightness == Brightness.dark
                ? Colors.white
                : Colors.black,
          ),
          decoration: InputDecoration(
            labelText: 'Nome completo',
            labelStyle: TextStyle(
              color: theme.brightness == Brightness.dark
                  ? Colors.white70
                  : Colors.black54,
            ),
            border: const OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: theme.brightness == Brightness.dark
                    ? Colors.white24
                    : Colors.black26,
              ),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Cancelar',
              style: TextStyle(
                color: theme.brightness == Brightness.dark
                    ? Colors.white70
                    : Colors.black54,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              try {
                await user?.updateDisplayName(nameController.text);
                if (context.mounted) {
                  Navigator.pop(context);
                  setState(() {});
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('Nome atualizado!'),
                      backgroundColor: theme.brightness == Brightness.dark
                          ? const Color(0xFF1976D2)
                          : Colors.blue[700],
                    ),
                  );
                }
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Erro: ${e.toString()}'),
                    backgroundColor: theme.brightness == Brightness.dark
                        ? const Color(0xFF1976D2)
                        : Colors.blue[700],
                  ),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: theme.brightness == Brightness.dark
                  ? const Color(0xFF1976D2)
                  : Colors.blue[700],
              foregroundColor: Colors.white,
            ),
            child: const Text('Salvar'),
          ),
        ],
      ),
    );
  }

  void _editSpecialty() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Editar Especialidade',
          style: TextStyle(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Colors.black,
          ),
        ),
        content: DropdownButtonFormField<String>(
          value: _specialty,
          decoration: InputDecoration(
            labelText: 'Especialidade',
            labelStyle: TextStyle(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white70
                  : Colors.black54,
            ),
            border: const OutlineInputBorder(),
          ),
          dropdownColor: Theme.of(context).scaffoldBackgroundColor,
          style: TextStyle(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Colors.black,
          ),
          items: [
            DropdownMenuItem(
              value: 'clinico',
              child: Text(
                'Clínico Geral',
                style: TextStyle(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black,
                ),
              ),
            ),
            DropdownMenuItem(
              value: 'ortodontista',
              child: Text(
                'Ortodontista',
                style: TextStyle(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black,
                ),
              ),
            ),
            DropdownMenuItem(
              value: 'endodontista',
              child: Text(
                'Endodontista',
                style: TextStyle(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black,
                ),
              ),
            ),
            DropdownMenuItem(
              value: 'pediatra',
              child: Text(
                'Odontopediatra',
                style: TextStyle(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black,
                ),
              ),
            ),
            DropdownMenuItem(
              value: 'cirurgiao',
              child: Text(
                'Cirurgião',
                style: TextStyle(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black,
                ),
              ),
            ),
            DropdownMenuItem(
              value: 'protesista',
              child: Text(
                'Protesista',
                style: TextStyle(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black,
                ),
              ),
            ),
            DropdownMenuItem(
              value: 'periodontista',
              child: Text(
                'Periodontista',
                style: TextStyle(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black,
                ),
              ),
            ),
          ],
          onChanged: (value) async {
            try {
              if (value != null) {
                final prefs = await SharedPreferences.getInstance();
                await prefs.setString('specialty', value);
                setState(() {
                  _specialty = value;
                });
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Especialidade atualizada!')),
                );
              }
            } catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Erro: ${e.toString()}')),
              );
            }
          },
        ),
      ),
    );
  }

  void _showChangePasswordDialog() {
    final currentPasswordController = TextEditingController();
    final newPasswordController = TextEditingController();
    final confirmPasswordController = TextEditingController();
    final theme = Theme.of(context);

    showDialog(
      context: context,
      builder: (context) => SingleChildScrollView(
        child: AlertDialog(
          title: Text(
            'Alterar Senha',
            style: TextStyle(
              color: theme.brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: currentPasswordController,
                obscureText: true,
                style: TextStyle(
                  color: theme.brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black,
                ),
                decoration: InputDecoration(
                  labelText: 'Senha atual',
                  labelStyle: TextStyle(
                    color: theme.brightness == Brightness.dark
                        ? Colors.white70
                        : Colors.black54,
                  ),
                  border: const OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: theme.brightness == Brightness.dark
                          ? Colors.white24
                          : Colors.black26,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: newPasswordController,
                obscureText: true,
                style: TextStyle(
                  color: theme.brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black,
                ),
                decoration: InputDecoration(
                  labelText: 'Nova senha',
                  labelStyle: TextStyle(
                    color: theme.brightness == Brightness.dark
                        ? Colors.white70
                        : Colors.black54,
                  ),
                  border: const OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: theme.brightness == Brightness.dark
                          ? Colors.white24
                          : Colors.black26,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: confirmPasswordController,
                obscureText: true,
                style: TextStyle(
                  color: theme.brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black,
                ),
                decoration: InputDecoration(
                  labelText: 'Confirmar nova senha',
                  labelStyle: TextStyle(
                    color: theme.brightness == Brightness.dark
                        ? Colors.white70
                        : Colors.black54,
                  ),
                  border: const OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: theme.brightness == Brightness.dark
                          ? Colors.white24
                          : Colors.black26,
                    ),
                  ),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Cancelar',
                style: TextStyle(
                  color: theme.brightness == Brightness.dark
                      ? Colors.white70
                      : Colors.black54,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                if (newPasswordController.text !=
                    confirmPasswordController.text) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('As senhas não coincidem')),
                  );
                  return;
                }

                try {
                  final credential = EmailAuthProvider.credential(
                    email: user?.email ?? '',
                    password: currentPasswordController.text,
                  );
                  await user?.reauthenticateWithCredential(credential);
                  await user?.updatePassword(newPasswordController.text);
                  if (context.mounted) {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Senha atualizada!')),
                    );
                  }
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Erro: ${e.toString()}')),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.brightness == Brightness.dark
                    ? const Color(0xFF1976D2)
                    : Colors.blue[700],
                foregroundColor: Colors.white,
              ),
              child: const Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Meu Perfil',
          style: TextStyle(
            color: theme.brightness == Brightness.dark
                ? Colors.white
                : Colors.black,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color:
              theme.brightness == Brightness.dark ? Colors.white : Colors.black,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: theme.primaryColor.withOpacity(0.1),
                ),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: theme.primaryColor.withOpacity(0.2),
                          backgroundImage: user?.photoURL != null
                              ? NetworkImage(user!.photoURL!) as ImageProvider
                              : null,
                          child: user?.photoURL == null
                              ? Icon(
                                  Icons.person,
                                  size: 50,
                                  color: theme.brightness == Brightness.dark
                                      ? const Color(0xFF1976D2)
                                      : Colors.blue[700],
                                )
                              : null,
                        ),
                        Positioned(
                          right: -10,
                          bottom: -10,
                          child: IconButton(
                            onPressed: _changeProfilePicture,
                            icon: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: theme.brightness == Brightness.dark
                                    ? const Color(0xFF1976D2)
                                    : Colors.blue[700],
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.camera_alt,
                                size: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        if (_isLoading)
                          const Positioned.fill(
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      user?.displayName ?? 'Nome não disponível',
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: theme.brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      user?.email ?? 'Email não disponível',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.brightness == Brightness.dark
                            ? Colors.white70
                            : Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: BorderSide(
                          color: theme.dividerColor.withOpacity(0.2),
                        ),
                      ),
                      child: Column(
                        children: [
                          ListTile(
                            leading: Icon(
                              Icons.person,
                              color: theme.brightness == Brightness.dark
                                  ? const Color(0xFF1976D2)
                                  : Colors.blue[700],
                            ),
                            title: Text(
                              "Nome de Usuário",
                              style: TextStyle(
                                color: theme.brightness == Brightness.dark
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                            subtitle: Text(
                              user?.displayName ?? "Adicionar nome",
                              style: TextStyle(
                                color: theme.brightness == Brightness.dark
                                    ? Colors.white70
                                    : Colors.black54,
                              ),
                            ),
                            trailing: Icon(
                              Icons.chevron_right,
                              color: theme.brightness == Brightness.dark
                                  ? const Color(0xFF1976D2)
                                  : Colors.blue[700],
                            ),
                            onTap: _editDisplayName,
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.business,
                              color: theme.brightness == Brightness.dark
                                  ? const Color(0xFF1976D2)
                                  : Colors.blue[700],
                            ),
                            title: Text(
                              "Especialidade",
                              style: TextStyle(
                                color: theme.brightness == Brightness.dark
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                            subtitle: Text(
                              _getSpecialtyLabel(_specialty ?? ''),
                              style: TextStyle(
                                color: theme.brightness == Brightness.dark
                                    ? Colors.white70
                                    : Colors.black54,
                              ),
                            ),
                            trailing: Icon(
                              Icons.chevron_right,
                              color: theme.brightness == Brightness.dark
                                  ? const Color(0xFF1976D2)
                                  : Colors.blue[700],
                            ),
                            onTap: _editSpecialty,
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.lock,
                              color: theme.brightness == Brightness.dark
                                  ? const Color(0xFF1976D2)
                                  : Colors.blue[700],
                            ),
                            title: Text(
                              "Alterar Senha",
                              style: TextStyle(
                                color: theme.brightness == Brightness.dark
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                            subtitle: Text(
                              "Atualizar senha de acesso",
                              style: TextStyle(
                                color: theme.brightness == Brightness.dark
                                    ? Colors.white70
                                    : Colors.black54,
                              ),
                            ),
                            trailing: Icon(
                              Icons.chevron_right,
                              color: theme.brightness == Brightness.dark
                                  ? const Color(0xFF1976D2)
                                  : Colors.blue[700],
                            ),
                            onTap: _showChangePasswordDialog,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
