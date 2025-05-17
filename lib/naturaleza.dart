import 'package:flutter/material.dart';

class NaturalezaPage extends StatelessWidget {
  const NaturalezaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final rutas = [
      {
        'nombre': 'Ruta del Valle',
        'descripcion':
            'Recorrido panorámico por el Valle de Toledo con vistas al casco histórico.',
        'distancia': '5 km',
        'dificultad': 'Fácil',
        'icon': Icons.landscape,
      },
      {
        'nombre': 'Ruta de las Barrancas de Burujón',
        'descripcion':
            'Impresionantes cortados arcillosos junto al embalse de Castrejón.',
        'distancia': '6 km',
        'dificultad': 'Media',
        'icon': Icons.terrain,
      },
      {
        'nombre': 'Ruta Senda Ecológica del Tajo',
        'descripcion':
            'Sendero a orillas del río Tajo, ideal para paseos familiares.',
        'distancia': '8 km',
        'dificultad': 'Fácil',
        'icon': Icons.nature,
      },
      {
        'nombre': 'Ruta de los Cigarrales',
        'descripcion':
            'Ruta entre antiguas fincas y jardines típicos toledanos.',
        'distancia': '7 km',
        'dificultad': 'Media',
        'icon': Icons.forest,
      },
      {
        'nombre': 'Ruta de la Piedra del Rey Moro',
        'descripcion': 'Ruta circular con leyendas y vistas al río Tajo.',
        'distancia': '4 km',
        'dificultad': 'Fácil',
        'icon': Icons.hiking,
      },
      {
        'nombre': 'Ruta Montes de Toledo',
        'descripcion': 'Excursión por la sierra con flora y fauna autóctona.',
        'distancia': '12 km',
        'dificultad': 'Alta',
        'icon': Icons.directions_walk,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Rutas y Excursiones de Senderismo'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: rutas.length,
        itemBuilder: (context, index) {
          final ruta = rutas[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 10),
            elevation: 3,
            child: ListTile(
              leading: Icon(
                ruta['icon'] as IconData,
                size: 36,
                color: Theme.of(context).colorScheme.primary,
              ),
              title: Text(
                ruta['nombre'] as String,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                '${ruta['descripcion']}\nDistancia: ${ruta['distancia']} | Dificultad: ${ruta['dificultad']}',
              ),
              isThreeLine: true,
            ),
          );
        },
      ),
    );
  }
}
