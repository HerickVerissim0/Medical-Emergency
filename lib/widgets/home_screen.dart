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
import 'package:flutter_application_1/screens/todas_emergencias.dart';
import 'package:flutter_application_1/generated/l10n/app_localizations.dart';

class HomeScreen extends StatelessWidget {
  static const double _imageHeight = 150.0; // Altura da imagem

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = AuthService();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          AppLocalizations.of(context)!.appTitle, // Usando string localizada
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
                childAspectRatio:
                    0.8, // Ajuste a proporção para aumentar a altura
                children: [
                  _buildImage(
                      context,
                      'assets/images/emergencias_neurologicas.png',
                      AppLocalizations.of(context)!
                          .fearAnxiety, // Usando string localizada
                      const MedoAnsiedadeScreen()),
                  _buildImage(
                      context,
                      'assets/images/sistema_cardiovascular.png',
                      '${AppLocalizations.of(context)!.cardiacSystem.replaceAll(" ", "\n")}', // Sistema\nCardíaco
                      const SistemaCardiacoScreen()),
                  _buildImage(
                      context,
                      'assets/images/sistema_respiratorio.png',
                      '${AppLocalizations.of(context)!.respiratorySystem.replaceAll(" ", "\n")}', // Sistema\nRespiratório
                      const SistemaRespiratorioScreen()),
                  _buildImage(
                      context,
                      'assets/images/reacoes_alergicas.png',
                      '${AppLocalizations.of(context)!.allergicReaction.replaceAll(" ", "\n")}', // Reação\nAlérgica
                      const ReacaoAlergica()),
                  _buildImage(
                      context,
                      'assets/images/sos.png',
                      '', // Adicionando quebra de linha entre as palavras
                      const ContatosEmergencia()),
                  _buildImage(
                      context,
                      'assets/images/alteracao_da_consciencia.png',
                      'Alteração da\nConsciência', // Alteração da\nConsciência
                      const AlteracaoConsciencia()),
                  _buildImage(
                      context,
                      'assets/images/medicamentos_emergencia.png',
                      'Medicamentos\nde Emergência', // Medicamentos\nde Emergência
                      const Medicamentos()),
                  _buildImage(
                      context,
                      'assets/images/equipamentos_emergencia.png',
                      'Equipamentos\nde Emergência', // Equipamentos\nde Emergência
                      EquipamentosEmergencia()),
                  _buildImage(
                      context,
                      'assets/images/kit_emergencia.png',
                      'Kit\nde Emergência', // Kit\nde Emergência
                      KitEmergencia()),
                  _buildImage(
                      context,
                      'assets/images/sbv.png',
                      '', // SBV
                      Sbv()),
                  _buildImage(
                      context,
                      'assets/images/praticas_emergencias_medicas.png',
                      '${AppLocalizations.of(context)!.medicalEmergencies.replaceAll(" ", "\n")}', // Práticas\nem Emergências Médicas
                      PraticasMedicas()),
                  _buildImage(
                      context,
                      'assets/images/todas_emergencias.png', // Caminho da imagem para Todas Emergências
                      'Todas\nEmergências', // Texto para a imagem
                      const TodasEmergencias()), // Navegação para a nova tela
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Widget _buildImage(BuildContext context, String imagePath, String label,
      Widget targetScreen) {
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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
            15.0), // Ajuste o valor para o arredondamento desejado
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              imagePath,
              fit: BoxFit.cover, // Ajuste para cobrir o espaço
              height: _imageHeight, // Altura da imagem
              width: double.infinity, // Largura total
            ),
            Positioned(
              bottom: 10, // Ajuste a posição vertical do texto
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 8.0), // Adiciona padding horizontal
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: 14, // Ajuste o tamanho da fonte se necessário
                    fontWeight: FontWeight.w500,
                    color: theme.brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2, // Permite até 2 linhas
                  overflow: TextOverflow
                      .ellipsis, // Adiciona reticências se o texto for muito longo
                ),
              ),
            ),
          ],
        ),
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
          label: AppLocalizations.of(context)!
              .favorite, // Usando string localizada
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
            color: theme.brightness == Brightness.dark
                ? Colors.white70
                : Colors.black54,
          ),
          label:
              AppLocalizations.of(context)!.profile, // Usando string localizada
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.settings,
            color: theme.brightness == Brightness.dark
                ? Colors.white70
                : Colors.black54,
          ),
          label: AppLocalizations.of(context)!
              .settings, // Usando string localizada
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
