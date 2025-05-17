import 'package:flutter/material.dart';

class NocturnoPage extends StatelessWidget {
  const NocturnoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final actividadesNocturnas = [
      {
        'nombre': 'Ruta Nocturna por el Toledo Mágico',
        'descripcion':
            'Excursión guiada por las leyendas y misterios de la ciudad iluminada.',
        'direccion': 'Punto de encuentro: Plaza de Zocodover',
        'icon': Icons.nightlight_round,
      },
      {
        'nombre': 'Tour de Fantasmas y Misterios',
        'descripcion':
            'Recorrido nocturno por los rincones más enigmáticos de Toledo.',
        'direccion': 'Punto de encuentro: Plaza del Ayuntamiento',
        'icon': Icons.emoji_objects,
      },
      {
        'nombre': 'Discoteca Circulo de Arte',
        'descripcion':
            'Discoteca ubicada en una antigua iglesia, ambiente único y música variada.',
        'direccion': 'Plaza de San Vicente, 2, 45001 Toledo',
        'icon': Icons.music_note,
      },
      {
        'nombre': 'Sala Pícaro',
        'descripcion':
            'Sala de conciertos y club nocturno con programación cultural.',
        'direccion': 'Calle Cadenas, 6, 45001 Toledo',
        'icon': Icons.theater_comedy,
      },
      {
        'nombre': 'La Nuit Toledo',
        'descripcion': 'Discoteca moderna con DJs y fiestas temáticas.',
        'direccion': 'Calle Río Jarama, 120, 45007 Toledo',
        'icon': Icons.nightlife,
      },
      {
        'nombre': 'Salón de Baile El Candil',
        'descripcion': 'Salón de baile con clases y música en vivo.',
        'direccion': 'Calle de la Plata, 12, 45001 Toledo',
        'icon': Icons.music_note,
      },
      {
        'nombre': 'Pub El Ultimo',
        'descripcion': 'Pub con ambiente alternativo y música indie.',
        'direccion': 'Calle Alfileritos, 3, 45003 Toledo',
        'icon': Icons.local_bar,
      },
      {
        'nombre': 'Excursión Toledo de Leyenda',
        'descripcion':
            'Paseo nocturno por los lugares más legendarios de la ciudad.',
        'direccion': 'Punto de encuentro: Plaza de Zocodover',
        'icon': Icons.tour,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Excursiones Nocturnas y Ocio en Toledo'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: actividadesNocturnas.length,
        itemBuilder: (context, index) {
          final actividad = actividadesNocturnas[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 10),
            elevation: 3,
            child: ListTile(
              leading: Icon(
                actividad['icon'] as IconData,
                size: 36,
                color: Theme.of(context).colorScheme.primary,
              ),
              title: Text(
                actividad['nombre'] as String,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                '${actividad['descripcion']}\n${actividad['direccion']}',
              ),
              isThreeLine: true,
            ),
          );
        },
      ),
    );
  }
}
