import 'package:flutter/material.dart';
import 'package:toledotour/gastronomia.dart';
import 'package:toledotour/naturaleza.dart';
import 'package:toledotour/nocturno.dart';
import 'package:toledotour/turismo_cultural.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toledo Tour',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const TourismOptionsPage(),
    );
  }
}

// --- Nueva clase separada para las opciones de turismo ---
class TourismOptionsPage extends StatelessWidget {
  const TourismOptionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const TourismOptionsCardView();
  }
}

class TourismOptionsCardView extends StatelessWidget {
  const TourismOptionsCardView({super.key});

  @override
  Widget build(BuildContext context) {
    final options = [
      {
        'title': 'Turismo Cultural',
        'description': 'Descubre la historia y el arte de Toledo.',
        'icon': Icons.museum,
        'route': (BuildContext context) => const CulturalTourismPage(),
      },
      {
        'title': 'Turismo Gastronómico',
        'description': 'Disfruta de la mejor comida local.',
        'icon': Icons.restaurant,
        'route': (BuildContext context) => const GastronomiaPage(),
      },
      {
        'title': 'Turismo de Naturaleza',
        'description': 'Explora rutas y paisajes naturales.',
        'icon': Icons.park,
        'route': (BuildContext context) => const NaturalezaPage(),
      },
      {
        'title': 'Turismo Nocturno',
        'description': 'Vive la magia de Toledo de noche.',
        'icon': Icons.nightlife,
        'route': (BuildContext context) => const NocturnoPage(),
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Opciones de Turismo en Toledo'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: options.length,
        itemBuilder: (context, index) {
          final option = options[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 10),
            elevation: 4,
            child: ListTile(
              leading: Icon(
                option['icon'] as IconData,
                size: 40,
                color: Theme.of(context).colorScheme.primary,
              ),
              title: Text(
                option['title'] as String,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(option['description'] as String),
              onTap: () {
                if (option.containsKey('route')) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => (option['route']
                              as Widget Function(BuildContext))(context),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Seleccionaste: ${option['title']}'),
                    ),
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }
}
