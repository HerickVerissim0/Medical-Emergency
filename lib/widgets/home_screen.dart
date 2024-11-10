import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth/auth_service.dart';
import 'package:flutter_application_1/auth/login_screen.dart';
import 'package:flutter_application_1/model/favorite.dart';
import 'package:flutter_application_1/model/profile_screen.dart';
import 'package:flutter_application_1/model/settings_screen.dart';
import 'package:flutter_application_1/screens/alteracao_consciencia.dart';
import 'package:flutter_application_1/screens/contatos_emergencia.dart';
import 'package:flutter_application_1/screens/equipamentos_emergencia.dart';
import 'package:flutter_application_1/screens/kit_emergencia.dart';
import 'package:flutter_application_1/screens/medicamentos.dart';
import 'package:flutter_application_1/screens/medo_ansiedade_screen.dart';
import 'package:flutter_application_1/screens/praticas_medicas.dart';
import 'package:flutter_application_1/screens/reacao_alergica.dart';
import 'package:flutter_application_1/screens/sbv.dart';
import 'package:flutter_application_1/screens/search_icon.dart';
import 'package:flutter_application_1/screens/sistema_cardiaco.dart';
import 'package:flutter_application_1/screens/sistema_respiratorio.dart';

class HomeScreen extends StatelessWidget {
  static const double _iconSize = 50.0;
  static const TextStyle _labelStyle =
      TextStyle(fontSize: 18, fontWeight: FontWeight.w500);

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = AuthService();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Medical Emergency',
          style: TextStyle(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Colors.black,
          ),
        ),
        actions: <Widget>[
          SearchIcon(),
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,
            ),
            onPressed: () {
              print('Notifications icon pressed');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: GridView.count(
                crossAxisCount: 3, // Quantidade de colunas
                crossAxisSpacing: 2,
                mainAxisSpacing: 10,
                children: [
                  _buildIcon(
                      context,
                      Icons.sentiment_very_dissatisfied,
                      "Medo/Ansiedade",
                      const MedoAnsiedadeScreen(),
                      Colors.blue),
                  _buildIcon(context, Icons.favorite, "Sistema Cardíaco",
                      const SistemaCardiacoScreen(), Colors.blue),
                  _buildIcon(context, Icons.air, "Sistema Respiratório",
                      const SistemaRespiratorioScreen(), Colors.blue),
                  _buildIcon(context, Icons.warning, 'Reação Alérgica',
                      const ReacaoAlergica(), Colors.blue),
                  _buildIcon(context, Icons.contacts, 'Contatos de Emergência',
                      const ContatosEmergencia(), Colors.red),
                  _buildIcon(
                      context,
                      Icons.psychology,
                      'Alteração da Consciência',
                      const AlteracaoConsciencia(),
                      Colors.blue),
                  _buildIcon(context, Icons.medical_services_outlined,
                      'Medicamentos', const Medicamentos(), Colors.red),
                  _buildIcon(context, Icons.devices_other, 'Equipamentos',
                      EquipamentosEmergencia(), Colors.red),
                  _buildIcon(context, Icons.healing, 'Kit de Emergência',
                      KitEmergencia(), Colors.red),
                  _buildIcon(context, Icons.medical_services, 'SBV', Sbv(),
                      Colors.red),
                  _buildIcon(context, Icons.video_collection,
                      'Emergências Médicas', PraticasMedicas(), Colors.red),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Widget _buildIcon(BuildContext context, IconData icon, String label,
      Widget targetScreen, Color iconColor) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        try {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => targetScreen),
          );
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('Erro ao navegar para a tela'),
              backgroundColor: theme.brightness == Brightness.dark
                  ? const Color(0xFF1976D2)
                  : Colors.blue[700],
            ),
          );
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: _iconSize,
            color: iconColor,
          ),
          const SizedBox(height: 10),
          Text(
            label,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: theme.brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  goToLogin(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );

  Widget _buildBottomNavigationBar(BuildContext context) {
    final theme = Theme.of(context);
    return BottomNavigationBar(
      backgroundColor: theme.scaffoldBackgroundColor,
      selectedItemColor: theme.brightness == Brightness.dark
          ? const Color(0xFF1976D2)
          : Colors.blue[700],
      unselectedItemColor:
          theme.brightness == Brightness.dark ? Colors.white70 : Colors.black54,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: theme.brightness == Brightness.dark
                ? Colors.white70
                : Colors.black54,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.favorite,
            color: theme.brightness == Brightness.dark
                ? Colors.white70
                : Colors.black54,
          ),
          label: 'Favorite',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
            color: theme.brightness == Brightness.dark
                ? Colors.white70
                : Colors.black54,
          ),
          label: 'Profile',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.settings,
            color: theme.brightness == Brightness.dark
                ? Colors.white70
                : Colors.black54,
          ),
          label: 'Settings',
        ),
      ],
      onTap: (int index) {
        switch (index) {
          case 0:
            // Não faz nada quando o ícone Home é pressionado
            break;
          case 1:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Favorite()),
            );
            break;
          case 2:
            Navigator.pushReplacement(
              // Alterado de push para pushReplacement
              context,
              MaterialPageRoute(builder: (context) => const Profile_Screen()),
            );
            break;
          case 3:
            Navigator.pushReplacement(
              // Alterado de push para pushReplacement
              context,
              MaterialPageRoute(builder: (context) => const Settings_Screen()),
            );
            break;
        }
      },
    );
  }
}
