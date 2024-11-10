import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/alteracao_consciencia.dart';
import 'package:flutter_application_1/screens/contatos_emergencia.dart';
import 'package:flutter_application_1/screens/equipamentos_emergencia.dart';
import 'package:flutter_application_1/screens/kit_emergencia.dart';
import 'package:flutter_application_1/screens/medicamentos.dart';
import 'package:flutter_application_1/screens/medo_ansiedade_screen.dart';
import 'package:flutter_application_1/screens/praticas_medicas.dart';
import 'package:flutter_application_1/screens/reacao_alergica.dart';
import 'package:flutter_application_1/screens/sbv.dart';
import 'package:flutter_application_1/screens/sistema_cardiaco.dart';
import 'package:flutter_application_1/screens/sistema_respiratorio.dart';

// Lista de telas disponíveis
final List<Map<String, dynamic>> _screens = [
  {'title': 'Medo/Ansiedade', 'screen': MedoAnsiedadeScreen()},
  {'title': 'Sistema Cardíaco', 'screen': SistemaCardiacoScreen()},
  {'title': 'Sistema Respiratório', 'screen': SistemaRespiratorioScreen()},
  {'title': 'Reação Alérgica', 'screen': ReacaoAlergica()},
  {'title': 'Contatos de Emergência', 'screen': ContatosEmergencia()},
  {'title': 'Alteração da Consciência', 'screen': AlteracaoConsciencia()},
  {'title': 'SBV', 'screen': Sbv()},
  {'title': 'Kit de Emergência', 'screen': KitEmergencia()},
  {'title': 'Práticas em Emergências Médicas', 'screen': PraticasMedicas()},
  {'title': 'Medicamentos de Emergência', 'screen': Medicamentos()},
  {'title': 'Equipamentos de Emergência', 'screen': EquipamentosEmergencia()},
];

class SearchIcon extends StatelessWidget {
  const SearchIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.search),
      onPressed: () {
        showSearch(
          context: context,
          delegate: CustomSearchDelegate(),
        );
      },
    );
  }
}

class CustomSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = _screens
        .where((screen) => screen['title']
            .toLowerCase()
            .contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final result = results[index];
        return ListTile(
          title: Text(result['title']),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => result['screen']),
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = _screens
        .where((screen) => screen['title']
            .toLowerCase()
            .contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];
        return ListTile(
          title: Text(suggestion['title']),
          onTap: () {
            query = suggestion['title'];
            showResults(context);
          },
        );
      },
    );
  }
}
