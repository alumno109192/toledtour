import 'package:flutter/material.dart';

class GastronomiaPage extends StatelessWidget {
  const GastronomiaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final restaurantes = [
      {
        'nombre': 'Restaurante Adolfo',
        'descripcion': 'Cocina tradicional toledana con toques modernos.',
        'direccion': 'Calle Hombre de Palo, 7, 45001 Toledo',
        'icon': Icons.restaurant,
      },
      {
        'nombre': 'La Abadía',
        'descripcion':
            'Taberna típica con platos manchegos y cervezas artesanas.',
        'direccion': 'Plaza de San Nicolás, 3, 45001 Toledo',
        'icon': Icons.local_bar,
      },
      {
        'nombre': 'La Orza',
        'descripcion':
            'Restaurante acogedor con cocina castellana y carta de vinos.',
        'direccion': 'Calle Descalzos, 5, 45002 Toledo',
        'icon': Icons.restaurant_menu,
      },
      {
        'nombre': 'Taberna El Botero',
        'descripcion': 'Tapas creativas y cócteles en un ambiente moderno.',
        'direccion': 'Calle de la Ciudad, 5, 45002 Toledo',
        'icon': Icons.local_drink,
      },
      {
        'nombre': 'Cervecería El Trébol',
        'descripcion': 'Famosa por sus carcamusas y cervezas propias.',
        'direccion': 'Calle de Santa Fe, 1, 45001 Toledo',
        'icon': Icons.sports_bar,
      },
      {
        'nombre': 'Restaurante Alfileritos 24',
        'descripcion': 'Cocina de autor en un edificio histórico.',
        'direccion': 'Calle Alfileritos, 24, 45003 Toledo',
        'icon': Icons.dining,
      },
      {
        'nombre': 'Maruxiña Lounge',
        'descripcion': 'Restaurante y coctelería con terraza y vistas.',
        'direccion': 'Calle de la Paz, 16, 45002 Toledo',
        'icon': Icons.emoji_food_beverage,
      },
      {
        'nombre': 'Restaurante Venta de Aires',
        'descripcion': 'El restaurante más antiguo de Castilla-La Mancha.',
        'direccion': 'Calle de Toledo, 31, 45005 Toledo',
        'icon': Icons.restaurant,
      },
      {
        'nombre': 'La Malquerida',
        'descripcion': 'Bar de tapas y raciones en el casco histórico.',
        'direccion': 'Calle Santa Leocadia, 6, 45002 Toledo',
        'icon': Icons.fastfood,
      },
      {
        'nombre': 'Restaurante La Ermita',
        'descripcion': 'Cocina tradicional con vistas panorámicas.',
        'direccion': 'Carretera de la Ermita, s/n, 45004 Toledo',
        'icon': Icons.restaurant,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bares y Restaurantes de Toledo'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: restaurantes.length,
        itemBuilder: (context, index) {
          final bar = restaurantes[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 10),
            elevation: 3,
            child: ListTile(
              leading: Icon(
                bar['icon'] as IconData,
                size: 36,
                color: Theme.of(context).colorScheme.primary,
              ),
              title: Text(
                bar['nombre'] as String,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('${bar['descripcion']}\n${bar['direccion']}'),
              isThreeLine: true,
            ),
          );
        },
      ),
    );
  }
}
